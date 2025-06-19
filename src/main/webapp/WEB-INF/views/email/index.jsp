<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>EmailFlow Pro - Babu Projects</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⚡</text></svg>">

<!-- AdminLTE CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/new-badge.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

<!-- DataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap4.min.css">
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap4.min.js"></script>

<!-- Other Libraries -->
<script src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>

<style>
.toast-container {
    position: fixed;
    z-index: 9999;
    pointer-events: none;
}
.toast-notification {
    min-width: 200px;
    max-width: 300px;
    padding: 8px 12px;
    border-radius: 6px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    animation: popIn 0.2s ease-out;
    font-size: 13px;
    pointer-events: auto;
}
@keyframes popIn {
    from { transform: scale(0.8); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}
</style>
</head>

<body class="hold-transition sidebar-mini layout-fixed" x-data="emailApp()" x-init="init()">
<div class="wrapper">
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-widget="pushmenu" href="#" role="button">
					<i class="fas fa-bars"></i>
				</a>
			</li>
			<li class="nav-item d-none d-sm-inline-block">
				<span class="nav-link">EmailFlow Pro - Enterprise Email Campaign Manager</span>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a href="/" class="nav-link">
					<i class="fas fa-home"></i> Back to Main
				</a>
			</li>
			<li class="nav-item">
				<span class="nav-link">
					<i class="fas fa-circle text-success"></i> System Online
				</span>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#" role="button" @click.prevent="showSettings = true">
					<i class="fas fa-cog"></i>
				</a>
			</li>
		</ul>
	</nav>

	<!-- Main Sidebar -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<a href="/" class="brand-link">
			<span class="brand-text font-weight-light">
				<i class="fas fa-bolt text-warning"></i> EmailFlow Pro
			</span>
		</a>
		<div class="sidebar">
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item">
						<a href="/email/" class="nav-link active">
							<i class="nav-icon fas fa-envelope"></i>
							<p>Campaigns</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="/email/howto" class="nav-link">
							<i class="nav-icon fas fa-question-circle"></i>
							<p>How to Use</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link" @click.prevent="showSettings = true">
							<i class="nav-icon fas fa-cog"></i>
							<p>Settings</p>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</aside>

	<!-- Content Wrapper -->
	<div class="content-wrapper">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Email Campaigns</h1>
					</div>
				</div>
			</div>
		</div>

		<section class="content">
			<div class="container-fluid">
				<!-- Stats Cards -->
				<div class="row">
					<div class="col-lg-2 col-6">
						<div class="small-box bg-success">
							<div class="inner">
								<h3 x-text="stats.sent">0</h3>
								<p>Sent</p>
							</div>
							<div class="icon">
								<i class="fas fa-check"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-6">
						<div class="small-box bg-danger">
							<div class="inner">
								<h3 x-text="stats.failed">0</h3>
								<p>Failed</p>
							</div>
							<div class="icon">
								<i class="fas fa-times"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-6">
						<div class="small-box bg-secondary">
							<div class="inner">
								<h3 x-text="stats.cancelled">0</h3>
								<p>Cancelled</p>
							</div>
							<div class="icon">
								<i class="fas fa-stop"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-6">
						<div class="small-box bg-warning">
							<div class="inner">
								<h3 x-text="stats.processing">0</h3>
								<p>Processing</p>
							</div>
							<div class="icon">
								<i class="fas fa-clock"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-6">
						<div class="small-box bg-info">
							<div class="inner">
								<h3 x-text="stats.rate + '%'">0%</h3>
								<p>Success Rate</p>
							</div>
							<div class="icon">
								<i class="fas fa-chart-line"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-6">
						<div class="small-box bg-primary">
							<div class="inner">
								<h3 x-text="stats.total">0</h3>
								<p>Total</p>
							</div>
							<div class="icon">
								<i class="fas fa-envelope"></i>
							</div>
						</div>
					</div>
				</div>

				<!-- Campaign Form -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Create Campaign</h3>
						<div class="card-tools">
							<button @click="previewEmail()" :disabled="campaignRunning" class="btn btn-secondary btn-sm">
								<i class="fas fa-eye"></i> Preview
							</button>
							<button @click="submitForm()" :disabled="campaignRunning" class="btn btn-primary btn-sm">
								<i class="fas fa-paper-plane"></i> Launch Campaign
							</button>
						</div>
					</div>
					<div class="card-body">
						<form id="emailForm" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Email Recipients</label>
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown">
													<span x-text="recipientMethod === 'file' ? 'File Upload' : 'Direct Entry'"></span>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#" @click.prevent="recipientMethod = 'file'">File Upload</a>
													<a class="dropdown-item" href="#" @click.prevent="recipientMethod = 'direct'">Direct Entry <span class="new-badge">NEW</span></a>
												</div>
											</div>
										</div>
										
										<!-- File Upload Option -->
										<div class="custom-file mb-3" x-show="recipientMethod === 'file'" style="display: block;">
											<input type="file" name="emailFile" id="emailFile" class="custom-file-input" accept=".txt,.csv" @change="handleFileUpload($event)" :required="recipientMethod === 'file'">
											<label class="custom-file-label" for="emailFile" x-text="fileName || 'Choose file'">Choose file</label>
										</div>
										
										<!-- Direct Entry Option -->
										<div x-show="recipientMethod === 'direct'" style="display: none;">
											<textarea name="directEmails" id="directEmails" class="form-control" rows="3" 
												placeholder="Enter email addresses separated by commas" 
												:required="recipientMethod === 'direct'"
												@input="handleDirectEmailInput($event)"></textarea>
											<small class="form-text text-muted">Example: user1@example.com, user2@example.com</small>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Subject Line</label>
										<input type="text" name="subject" class="form-control" placeholder="Enter subject" required>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Delay (seconds)</label>
										<input type="number" name="delay" class="form-control" value="0" min="0">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Send Mode</label>
										<select name="mode" class="form-control">
											<option value="async">Asynchronous</option>
											<option value="sync">Synchronous</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Attachment (Optional)</label>
										<input type="file" name="attachment" class="form-control-file">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>Email Message</label>
								<textarea name="message" id="messageEditor" class="form-control" rows="8" required></textarea>
							</div>
						</form>
					</div>
				</div>

				<!-- Email List Table -->
				<div x-show="emailList.length > 0" class="card">
					<div class="card-header">
						<h3 class="card-title">Email Recipients (<span x-text="emailList.length"></span>)</h3>
						<div class="card-tools">
							<button @click="cancelAllEmails()" class="btn btn-danger btn-sm">
								<i class="fas fa-stop"></i> Cancel All
							</button>
						</div>
					</div>
					<div class="card-body table-responsive">
						<table class="table table-bordered table-striped table-sm" id="emailTable">
							<thead>
								<tr>
									<th data-priority="1">Email Address</th>
									<th data-priority="2">Status</th>
									<th data-priority="3" class="d-none d-md-table-cell">Progress</th>
									<th data-priority="4">Action</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Settings Modal -->
	<div class="modal fade" :class="showSettings ? 'show d-block' : ''" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Email Configuration</h4>
					<button type="button" class="close" @click="showSettings = false">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Authentication Method</label>
						<div class="row">
							<div class="col-md-6">
								<div class="custom-control custom-radio">
									<input class="custom-control-input" type="radio" id="app-password" name="auth-method" value="app-password" x-model="authMethod">
									<label for="app-password" class="custom-control-label">
										<i class="fas fa-key text-primary"></i> App Password
									</label>
								</div>
							</div>
						</div>
					</div>
					<div x-show="authMethod === 'app-password'">
						<div class="form-group">
							<label>Gmail Address</label>
							<input type="email" x-model="credentials.email" class="form-control" placeholder="your-email@gmail.com" required>
						</div>
						<div class="form-group">
							<label>App Password</label>
							<input type="password" x-model="credentials.password" class="form-control" placeholder="16-character app password" required>
							<small class="form-text text-muted">Generate from Google Account → Security → 2-Step Verification → App passwords</small>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" @click="showSettings = false">Cancel</button>
					<button type="button" class="btn btn-primary" @click="saveCredentials()" x-show="authMethod === 'app-password'">Save Configuration</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-backdrop fade" :class="showSettings ? 'show' : ''" x-show="showSettings" @click="showSettings = false"></div>

	<!-- Toast Container -->
	<div class="toast-container">
		<template x-for="toast in toasts" :key="toast.id">
			<div class="toast-notification" 
				:class="'alert alert-' + toast.type" 
				:style="'left: ' + toast.x + 'px; top: ' + toast.y + 'px; position: fixed;'"
				role="alert">
				<i :class="'fas fa-' + toast.icon + ' mr-2'"></i>
				<strong x-text="toast.title"></strong>
				<span x-text="': ' + toast.message"></span>
				<button type="button" class="close ml-2" @click="removeToast(toast.id)" style="font-size: 16px; line-height: 1;">
					<span>&times;</span>
				</button>
			</div>
		</template>
	</div>
</div>

<script src="/js/email-toggle.js"></script>
<script src="/js/email-helpers.js"></script>
<script>
// EmailFlow Pro - Main Application JavaScript
function emailApp() {
    return {
        showProgress: false,
        showPreview: false,
        showSettings: false,
        fileName: '',
        recipientMethod: 'file',
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
                });
                
                this.stompClient.subscribe('/topic/email-status', (message) => {
                    const update = JSON.parse(message.body);
                    this.emailStatuses[update.email] = update.status;
                    this.updateDataTableRow(update.email);
                    console.log('Status update:', update.email, update.status);
                });
            }, (error) => {});
        },

        handleFileUpload(event) {
            const file = event.target.files[0];
            if (!file) return;
            
            this.fileName = file.name;
            this.recipientMethod = 'file';
            
            // Clear direct entry field if it exists
            const directEmailsField = document.getElementById('directEmails');
            if (directEmailsField) directEmailsField.value = '';
            
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
        
        handleDirectEmailInput(event) {
            const emailText = event.target.value;
            if (!emailText) {
                this.emailList = [];
                return;
            }
            
            this.recipientMethod = 'direct';
            
            // Clear file upload if it exists
            const fileInput = document.getElementById('emailFile');
            if (fileInput) fileInput.value = '';
            this.fileName = '';
            
            // Parse comma-separated emails
            const emails = emailText.split(',')
                .map(email => email.trim())
                .filter(email => email && email.includes('@'));
                
            if (emails.length > 0) {
                this.emailList = emails;
                this.emailStatuses = {};
                emails.forEach(email => {
                    this.emailStatuses[email] = 'Pending';
                });
                this.initializeDataTable();
                
                // Only show toast when we have a significant number of emails
                if (emails.length >= 5) {
                    this.showToast('success', 'Success!', `${emails.length} emails added`, 'check');
                }
            } else {
                this.emailList = [];
            }
        },

        initializeDataTable() {
            if (this.dataTable) {
                this.dataTable.destroy();
            }
            
            const tableData = this.emailList.map(email => {
                const status = this.emailStatuses[email] || 'Pending';
                const statusClass = getStatusClass(status);
                const progressBarClass = getProgressBarClass(status);
                const progressWidth = getProgressWidth(status);
                
                return [
                    email,
                    `<span class="badge ${statusClass}">${status}</span>`,
                    `<div class="progress" style="height: 20px;"><div class="progress-bar ${progressBarClass}" role="progressbar" style="width: ${progressWidth}%" aria-valuenow="${progressWidth}" aria-valuemin="0" aria-valuemax="100"></div></div>`,
                    `<button class="btn btn-success btn-sm" onclick="window.sendEmail('${email}')">Send</button>`
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
                    const status = this.emailStatuses[email];
                    
                    if (status === 'Pending') {
                        actionButton = `<button onclick="window.sendIndividualEmail('${email}')" class="btn btn-success btn-sm">Send</button>`;
                    } else if (status === 'Queued' || status === 'Sending') {
                        actionButton = `<button onclick="window.cancelEmail('${email}')" class="btn btn-danger btn-sm">Cancel</button>`;
                    } else if (status === 'Failed' || status === 'Cancelled') {
                        actionButton = `<button onclick="window.resendEmail('${email}')" class="btn btn-info btn-sm">Resend</button>`;
                    } else {
                        actionButton = '';
                    }
                    
                    const statusClass = this.getStatusClass(status);
                    const progressBarClass = this.getProgressBarClass(status);
                    const progressWidth = this.getProgressWidth(status);
                    
                    try {
                        this.dataTable.row(rowIndex).data([
                            email,
                            `<span class="badge ${statusClass}">${status}</span>`,
                            `<div class="progress" style="height: 20px;"><div class="progress-bar ${progressBarClass}" role="progressbar" style="width: ${progressWidth}%" aria-valuenow="${progressWidth}" aria-valuemin="0" aria-valuemax="100"></div></div>`,
                            actionButton
                        ]).draw(false);
                    } catch (e) {
                        console.error('Error updating row:', e);
                    }
                }
            }
        },

        submitForm() {
            if (this.emailList.length === 0) {
                this.showToast('danger', 'No Emails', 'Please add email recipients first', 'list');
                return;
            }

            if (!this.credentials.email || !this.credentials.hasRealPassword) {
                this.showToast('warning', 'No Credentials', 'Configure email settings first', 'key');
                return;
            }
            
            const form = document.getElementById('emailForm');
            const formData = new FormData(form);
            
            // Handle direct email input
            if (this.recipientMethod === 'direct') {
                // Create a temporary file with the direct emails
                const emailsBlob = new Blob([this.emailList.join('\n')], {type: 'text/plain'});
                formData.set('emailFile', emailsBlob, 'direct-emails.txt');
            }
            
            this.campaignRunning = true;
            this.showProgress = true;
            
            fetch('/email/send-bulk', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    this.showToast('success', 'Launched!', `Processing ${data.totalEmails} emails`, 'rocket');
                } else {
                    this.showToast('danger', 'Failed', data.message, 'times');
                    this.campaignRunning = false;
                }
            })
            .catch(error => {
                this.showToast('danger', 'Error', 'Failed to start campaign', 'exclamation-triangle');
                this.campaignRunning = false;
            });
        },

        cancelAllEmails() {
            if (confirm('Cancel all pending emails?')) {
                fetch('/email/cancel-all', { method: 'POST' })
                .then(response => response.text())
                .then(data => {
                    this.campaignRunning = false;
                    this.showReports = true;
                    this.showToast('success', 'Stopped!', 'All emails cancelled', 'stop');
                })
                .catch(error => {
                    this.showToast('danger', 'Error', 'Failed to cancel', 'times');
                });
            }
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



        updateDataTableRow(email) {
            if (this.dataTable) {
                const rowIndex = this.emailList.indexOf(email);
                if (rowIndex !== -1) {
                    const status = this.emailStatuses[email];
                    let actionButton = '';
                    
                    if (status === 'Pending') {
                        actionButton = `<button class="btn btn-success btn-sm" onclick="window.sendEmail('${email}')">Send</button>`;
                    } else if (status === 'Queued' || status === 'Sending') {
                        actionButton = `<button class="btn btn-danger btn-sm" onclick="window.cancelEmail('${email}')">Cancel</button>`;
                    } else if (status === 'Failed' || status === 'Cancelled') {
                        actionButton = `<button class="btn btn-info btn-sm" onclick="window.resendEmail('${email}')">Resend</button>`;
                    }
                    
                    try {
                        const statusClass = getStatusClass(status);
                        const progressBarClass = getProgressBarClass(status);
                        const progressWidth = getProgressWidth(status);
                        
                        this.dataTable.row(rowIndex).data([
                            email,
                            `<span class="badge ${statusClass}">${status}</span>`,
                            `<div class="progress" style="height: 20px;"><div class="progress-bar ${progressBarClass}" role="progressbar" style="width: ${progressWidth}%" aria-valuenow="${progressWidth}" aria-valuemin="0" aria-valuemax="100"></div></div>`,
                            actionButton
                        ]).draw(false);
                    } catch (e) {
                        console.error('Error updating row:', e);
                    }
                }
            }
        },

        previewEmail() {
            const subject = document.querySelector('input[name="subject"]').value;
            const message = document.querySelector('textarea[name="message"]').value;
            
            if (!subject || !message) {
                this.showToast('warning', 'Missing Info', 'Please fill subject and message', 'exclamation');
                return;
            }
            
            this.previewData.subject = subject;
            this.previewData.message = message;
            this.showPreview = true;
        }
    }
}

// Initialize CKEditor
let editorInstance;
document.addEventListener('DOMContentLoaded', function() {
    ClassicEditor
        .create(document.querySelector('#messageEditor'), {
           toolbar: ['bold', 'italic', 'underline', '|', 'link', 'bulletedList', 'numberedList', '|', 'blockQuote', 'insertTable', '|', 'undo', 'redo']
        })
        .then(editor => {
            editorInstance = editor;
        })
        .catch(error => {});
});
</script>
</body>
</html>