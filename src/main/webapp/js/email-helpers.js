// Helper functions for email status display

// Status badge class helper
function getStatusClass(status) {
    switch(status?.toLowerCase()) {
        case 'sent': return 'badge-success';
        case 'sending': return 'badge-warning';
        case 'failed': return 'badge-danger';
        case 'queued': return 'badge-info';
        case 'cancelled': return 'badge-secondary';
        default: return 'badge-light';
    }
}

// Progress bar class helper
function getProgressBarClass(status) {
    switch(status?.toLowerCase()) {
        case 'sent': return 'bg-success';
        case 'sending': return 'bg-warning';
        case 'failed': return 'bg-danger';
        case 'queued': return 'bg-info';
        case 'cancelled': return 'bg-secondary';
        default: return 'bg-light';
    }
}

// Progress width helper
function getProgressWidth(status) {
    switch(status?.toLowerCase()) {
        case 'sent': return 100;
        case 'sending': return 50;
        case 'failed': return 100;
        case 'queued': return 25;
        case 'cancelled': return 100;
        default: return 0;
    }
}

// Check if email can be sent
function canSendEmail(status) {
    return ['pending'].includes(status?.toLowerCase());
}

// Check if email can be cancelled
function canCancelEmail(status) {
    return ['queued', 'sending'].includes(status?.toLowerCase());
}

// Check if email can be resent
function canResendEmail(status) {
    return ['cancelled', 'failed'].includes(status?.toLowerCase());
}

// Email action handlers
window.sendEmail = function(email) {
    fetch('/email/send-individual', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'email=' + encodeURIComponent(email)
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            showToast('success', 'Queued!', `Email queued for ${email}`, 'paper-plane');
            updateEmailStatus(email, 'Queued');
        } else {
            showToast('danger', 'Error', data.message, 'times');
        }
    })
    .catch(error => {
        showToast('danger', 'Error', 'Failed to send', 'exclamation-triangle');
    });
};

window.cancelEmail = function(email) {
    if (confirm(`Cancel email for ${email}?`)) {
        fetch('/email/cancel-email', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'email=' + encodeURIComponent(email)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                showToast('success', 'Cancelled!', `Email cancelled for ${email}`, 'stop');
                updateEmailStatus(email, 'Cancelled');
            } else {
                showToast('danger', 'Error', data.message, 'times');
            }
        })
        .catch(error => {
            showToast('danger', 'Error', 'Failed to cancel', 'exclamation-triangle');
        });
    }
};

window.resendEmail = function(email) {
    if (confirm(`Resend email to ${email}?`)) {
        fetch('/email/resend-email', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'email=' + encodeURIComponent(email)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                showToast('success', 'Queued!', `Email queued for resending`, 'redo');
                updateEmailStatus(email, 'Queued');
            } else {
                showToast('danger', 'Error', data.message, 'times');
            }
        })
        .catch(error => {
            showToast('danger', 'Error', 'Failed to resend', 'exclamation-triangle');
        });
    }
};

// Helper function to show toast from global context
function showToast(type, title, message, icon) {
    const appElement = document.querySelector('[x-data="emailApp()"]');
    if (appElement && appElement.__x) {
        const app = appElement.__x.getUnobservable();
        app.showToast(type, title, message, icon);
    }
}

// Helper function to update email status in the app
function updateEmailStatus(email, status) {
    const appElement = document.querySelector('[x-data="emailApp()"]');
    if (appElement && appElement.__x) {
        const app = appElement.__x.getUnobservable();
        app.emailStatuses[email] = status;
        app.updateDataTableRow(email);
    }
}