// Email input toggle functionality
document.addEventListener('DOMContentLoaded', function() {
    // Get references to elements
    const fileUploadDiv = document.querySelector('[x-show="recipientMethod === \'file\'"]');
    const directEntryDiv = document.querySelector('[x-show="recipientMethod === \'direct\'"]');
    const fileToggle = document.querySelector('[data-toggle="dropdown"]');
    
    // Set initial state
    if (fileUploadDiv) fileUploadDiv.style.display = 'block';
    if (directEntryDiv) directEntryDiv.style.display = 'none';
    
    // Add click handlers for dropdown items
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', function(e) {
            const method = this.textContent.trim();
            
            if (method === 'File Upload') {
                if (fileUploadDiv) fileUploadDiv.style.display = 'block';
                if (directEntryDiv) directEntryDiv.style.display = 'none';
                if (fileToggle) fileToggle.querySelector('span').textContent = 'File Upload';
            } else if (method === 'Direct Entry') {
                if (fileUploadDiv) fileUploadDiv.style.display = 'none';
                if (directEntryDiv) directEntryDiv.style.display = 'block';
                if (fileToggle) fileToggle.querySelector('span').textContent = 'Direct Entry';
            }
        });
    });
});