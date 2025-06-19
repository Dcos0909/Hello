// Email actions for the EmailFlow Pro application

// Global functions for email actions
window.sendIndividualEmail = function(email) {
    const appElement = document.querySelector('[x-data="emailApp()"]');
    if (appElement && appElement.__x) {
        const app = appElement.__x.getUnobservable();
        
        fetch('/email/send-individual', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'email=' + encodeURIComponent(email)
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                app.showToast('success', 'Queued!', `Email queued for ${email}`, 'paper-plane');
            } else {
                app.showToast('danger', 'Error', data.message, 'times');
            }
        })
        .catch(error => {
            app.showToast('danger', 'Error', 'Failed to send', 'exclamation-triangle');
        });
    }
};

window.cancelEmail = function(email) {
    if (confirm(`Cancel email for ${email}?`)) {
        const appElement = document.querySelector('[x-data="emailApp()"]');
        if (appElement && appElement.__x) {
            const app = appElement.__x.getUnobservable();
            
            fetch('/email/cancel-email', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'email=' + encodeURIComponent(email)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    app.showToast('success', 'Cancelled!', `Email cancelled for ${email}`, 'stop');
                } else {
                    app.showToast('danger', 'Error', data.message, 'times');
                }
            })
            .catch(error => {
                app.showToast('danger', 'Error', 'Failed to cancel', 'exclamation-triangle');
            });
        }
    }
};

window.resendEmail = function(email) {
    if (confirm(`Resend email to ${email}?`)) {
        const appElement = document.querySelector('[x-data="emailApp()"]');
        if (appElement && appElement.__x) {
            const app = appElement.__x.getUnobservable();
            
            fetch('/email/resend-email', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'email=' + encodeURIComponent(email)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    app.showToast('success', 'Queued!', `Email queued for resending`, 'redo');
                } else {
                    app.showToast('danger', 'Error', data.message, 'times');
                }
            })
            .catch(error => {
                app.showToast('danger', 'Error', 'Failed to resend', 'exclamation-triangle');
            });
        }
    }
};