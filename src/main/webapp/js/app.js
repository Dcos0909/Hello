// EmailFlow Pro - Main Application JavaScript for Babu Integration

function emailApp() {
    return {
        showProgress: false,
        showPreview: false,
        showSettings: false,
        fileName: '',
        emailList: [],
        emailStatuses: {},
        dataTable: null,
        campaignRunning: false,
        authMethod: 'app-password',
        credentials: { email: '', password: '', hasRealPassword: false },
        campaignProgress: {
            total: 0,
            processed: 0,
            success: 0,
            failed: 0,
            percentage: 0
        },
        showReports: false,
        stats: {
            sent: 0,
            failed: 0,
            cancelled: 0,
            processing: 0,
            rate: 0,
            total: 0
        },
        previewData: {
            subject: '',
            message: ''
        },
        stompClient: null,
        toasts: [],

        showToast(type, title, message, icon = 'info-circle', event = null) {
            const toast = {
                id: Date.now(),
                type: type,
                title: title,
                message: message,
                icon: icon,
                x: 20,
                y: 20
            };
            
            if (event && event.target) {
                const rect = event.target.getBoundingClientRect();
                toast.x = rect.right + 10;
                toast.y = rect.top;
            }
            
            this.toasts.push(toast);
            setTimeout(() => this.removeToast(toast.id), 3000);
        },

        removeToast(id) {
            this.toasts = this.toasts.filter(toast => toast.id !== id);
        },

        init() {
            this.connectWebSocket();
            this.loadCredentials();
        },

        loadCredentials() {
            fetch('/email/get-credentials')
            .then(response => response.json())
            .then(data => {
                this.credentials.email = data.email || '';
                this.credentials.password = data.hasPassword ? '••••••••••••••••' : '';
                this.credentials.hasRealPassword = data.hasPassword;
            })
            .catch(error => {});
        },

        saveCredentials() {
            if (!this.credentials.email || !this.credentials.password) {
                this.showToast('danger', 'Missing Info', 'Please enter email and password', 'exclamation');
                return;
            }

            fetch('/email/update-credentials', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(this.credentials)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    this.credentials.hasRealPassword = true;
                    this.showToast('success', 'Updated!', 'Credentials saved', 'check');
                    this.showSettings = false;
                } else {
                    this.showToast('danger', 'Failed', data.message, 'times');
                }
            })
            .catch(error => {
                this.showToast('danger', 'Error', 'Network error', 'exclamation-triangle');
            });
        },

        connectWebSocket() {
            const socket = new SockJS('/ws');
            this.stompClient = Stomp.over(socket);
            
            this.stompClient.connect({}, (frame) => {
                this.stompClient.subscribe('/topic/progress', (message) => {
                    const progress = JSON.parse(message.body);
                    this.campaignProgress = progress;
                    this.stats.sent = progress.success;
                    this.stats.failed = progress.failed;
                    this.stats.cancelled = progress.cancelled || 0;
                    this.stats.total = progress.total;
                    this.stats.processing = Math.max(0, progress.total - progress.processed);
                    this.stats.rate = progress.total > 0 ? Math.round((progress.success / progress.total) * 100) : 0;
                    
                    if (progress.processed >= progress.total && progress.total > 0) {
                        this.campaignRunning = false;
                        this.showReports = true;
                        this.writeReports();
                        
                        const authErrors = Object.values(this.emailStatuses).filter(status => 
                            status.includes('Invalid email credentials') || status.includes('Authentication failed')
                        ).length;
                        
                        if (authErrors > 0) {
                            this.showToast('danger', 'Auth Error', 'Check credentials in Settings', 'key');
                        } else {
                            this.showToast('success', 'Complete!', `Sent: ${progress.success}, Failed: ${progress.failed}`, 'check');
                        }
                    }
                });
                
                this.stompClient.subscribe('/topic/email-status', (message) => {
                    const update = JSON.parse(message.body);
                    this.emailStatuses[update.email] = update.status;
                    this.updateDataTableRow(update.email);
                });
            }, (error) => {});
        },

        handleFileUpload(event) {
            const file = event.target.files[0];
            if (!file) return;
            
            this.fileName = file.name;
            
            const formData = new FormData();
            formData.append('emailFile', file);
            
            fetch('/email/upload-emails', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    this.emailList = data.emails;
                    this.emailStatuses = {};
                    data.emails.forEach(email => {
                        this.emailStatuses[email] = 'Pending';
                    });
                    this.initializeDataTable();
                    this.showToast('success', 'Success!', `${data.emails.length} emails loaded`, 'check');
                } else {
                    this.showToast('danger', 'Upload Failed', data.message, 'times');
                }
            })
            .catch(error => {
                this.showToast('danger', 'Network Error', 'Upload failed', 'exclamation-triangle');
            });
        },

        getStatusClass(status) {
            switch(status.toLowerCase()) {
                case 'sent': return 'badge-success';
                case 'sending': return 'badge-warning';
                case 'failed': return 'badge-danger';
                case 'queued': return 'badge-info';
                case 'cancelled': return 'badge-secondary';
                default: return 'badge-light';
            }
        },

        getProgressBarClass(status) {
            switch(status.toLowerCase()) {
                case 'sent': return 'bg-success';
                case 'sending': return 'bg-warning';
                case 'failed': return 'bg-danger';
                case 'queued': return 'bg-info';
                case 'cancelled': return 'bg-secondary';
                default: return 'bg-light';
            }
        },

        getProgressWidth(status) {
            switch(status.toLowerCase()) {
                case 'sent': return 100;
                case 'sending': return 50;
                case 'failed': return 100;
                case 'queued': return 25;
                case 'cancelled': return 100;
                default: return 0;
            }
        },

        initializeDataTable() {
            if (this.dataTable) {
                this.dataTable.destroy();
            }
            
            const tableData = this.emailList.map(email => {
                let actionButton = '';
                if (this.canSendEmail(this.emailStatuses[email])) {
                    actionButton = `<button onclick="window.app.sendIndividualEmail('${email}')" class="btn btn-success btn-sm">Send</button>`;
                } else if (this.canCancelEmail(this.emailStatuses[email])) {
                    actionButton = `<button onclick="window.app.cancelEmail('${email}')" class="btn btn-danger btn-sm">Cancel</button>`;
                } else if (this.canResendEmail(this.emailStatuses[email])) {
                    actionButton = `<button onclick="window.app.resendEmail('${email}')" class="btn btn-info btn-sm">Resend</button>`;
                }
                
                return [
                    email,
                    `<span class="badge ${this.getStatusClass(this.emailStatuses[email] || 'pending')}">${this.emailStatuses[email] || 'Pending'}</span>`,
                    `<div class="progress" style="height: 20px;"><div class="progress-bar ${this.getProgressBarClass(this.emailStatuses[email] || 'pending')}" role="progressbar" style="width: ${this.getProgressWidth(this.emailStatuses[email] || 'pending')}%" aria-valuenow="${this.getProgressWidth(this.emailStatuses[email] || 'pending')}" aria-valuemin="0" aria-valuemax="100"></div></div>`,
                    actionButton
                ];
            });

            this.dataTable = $('#emailTable').DataTable({
                data: tableData,
                responsive: {
                    details: {
                        type: 'column',
                        target: 'tr'
                    }
                },
                pageLength: 25,
                lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
                columnDefs: [
                    { responsivePriority: 1, targets: 0 },
                    { responsivePriority: 2, targets: 1 },
                    { responsivePriority: 4, targets: 2 },
                    { responsivePriority: 3, targets: 3 }
                ]
            });
        },

        updateDataTableRow(email) {
            if (this.dataTable) {
                const rowIndex = this.emailList.indexOf(email);
                if (rowIndex !== -1) {
                    let actionButton = '';
                    if (this.canSendEmail(this.emailStatuses[email])) {
                        actionButton = `<button onclick="window.app.sendIndividualEmail('${email}')" class="btn btn-success btn-sm">Send</button>`;
                    } else if (this.canCancelEmail(this.emailStatuses[email])) {
                        actionButton = `<button onclick="window.app.cancelEmail('${email}')" class="btn btn-danger btn-sm">Cancel</button>`;
                    } else if (this.canResendEmail(this.emailStatuses[email])) {
                        actionButton = `<button onclick="window.app.resendEmail('${email}')" class="btn btn-info btn-sm">Resend</button>`;
                    }
                    
                    this.dataTable.row(rowIndex).data([
                        email,
                        `<span class="badge ${this.getStatusClass(this.emailStatuses[email])}">${this.emailStatuses[email]}</span>`,
                        `<div class="progress" style="height: 20px;"><div class="progress-bar ${this.getProgressBarClass(this.emailStatuses[email])}" role="progressbar" style="width: ${this.getProgressWidth(this.emailStatuses[email])}%" aria-valuenow="${this.getProgressWidth(this.emailStatuses[email])}" aria-valuemin="0" aria-valuemax="100"></div></div>`,
                        actionButton
                    ]).draw(false);
                }
            }
        },

        canSendEmail(status) {
            return ['pending'].includes(status?.toLowerCase());
        },

        canCancelEmail(status) {
            return ['queued', 'sending'].includes(status?.toLowerCase());
        },

        canResendEmail(status) {
            return ['cancelled', 'failed'].includes(status?.toLowerCase());
        },

        cancelAllEmails() {
            if (confirm('Cancel all pending emails?')) {
                fetch('/email/cancel-all', { method: 'POST' })
                .then(response => response.text())
                .then(data => {
                    this.campaignRunning = false;
                    this.showReports = true;
                    Object.keys(this.emailStatuses).forEach(email => {
                        if (this.canCancelEmail(this.emailStatuses[email])) {
                            this.emailStatuses[email] = 'Cancelled';
                        }
                    });
                    this.stats.cancelled = Object.values(this.emailStatuses).filter(status => status === 'Cancelled').length;
                    this.showToast('success', 'Stopped!', 'All emails cancelled', 'stop');
                })
                .catch(error => {
                    this.showToast('danger', 'Error', 'Failed to cancel', 'times');
                });
            }
        },

        submitForm() {
            if (this.emailList.length === 0) {
                this.showToast('danger', 'No Emails', 'Please upload email list first', 'list');
                return;
            }

            if (!this.credentials.email || !this.credentials.hasRealPassword) {
                this.showToast('warning', 'No Credentials', 'Configure email settings first', 'key');
                return;
            }
            
            if (this.campaignRunning) return;
            
            const form = document.getElementById('emailForm');
            const formData = new FormData(form);
            
            if (editorInstance) {
                formData.set('message', editorInstance.getData());
            }
            
            this.campaignRunning = true;
            this.showProgress = true;
            this.showReports = false;
            
            fetch('/email/send-bulk', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    this.showToast('success', 'Launched!', `Processing ${data.totalEmails} emails`, 'rocket');
                } else {
                    if (data.message && (data.message.includes('credentials') || data.message.includes('Authentication'))) {
                        this.showToast('danger', 'Auth Error', 'Wrong username or password', 'key');
                    } else {
                        this.showToast('danger', 'Failed', data.message, 'times');
                    }
                    this.campaignRunning = false;
                }
            })
            .catch(error => {
                this.showToast('danger', 'Error', 'Failed to start campaign', 'exclamation-triangle');
                this.campaignRunning = false;
            });
        },

        previewEmail() {
            const subject = document.querySelector('input[name="subject"]').value;
            const message = editorInstance ? editorInstance.getData() : document.querySelector('textarea[name="message"]').value;
            
            if (!subject || !message) {
                this.showToast('warning', 'Missing Info', 'Please fill subject and message', 'exclamation');
                return;
            }
            
            this.previewData.subject = subject;
            this.previewData.message = message;
            this.showPreview = true;
        },

        writeReports() {
            // Generate and download reports after campaign completion
        }
    }
}

// Initialize CKEditor 5
let editorInstance;
window.app = null;

document.addEventListener('DOMContentLoaded', function() {
    ClassicEditor
        .create(document.querySelector('#messageEditor'), {
           toolbar: ['bold', 'italic', 'underline', '|', 'link', 'bulletedList', 'numberedList', '|', 'blockQuote', 'insertTable', '|', 'undo', 'redo']
        })
        .then(editor => {
            editorInstance = editor;
        })
        .catch(error => {});
        
    setTimeout(() => {
        const element = document.querySelector('[x-data="emailApp()"]');
        if (element && element._x_dataStack) {
            window.app = element._x_dataStack[0];
        }
        
        // Initialize AdminLTE sidebar
        if (typeof AdminLTE !== 'undefined') {
            AdminLTE.init();
        }
    }, 500);
});