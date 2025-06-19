// Email input toggle functionality
document.addEventListener('DOMContentLoaded', function() {
    // Toggle between file upload and direct entry
    const toggleFileUpload = function() {
        const fileUploadDiv = document.querySelector('.custom-file');
        const directEntryDiv = document.querySelector('[x-show="recipientMethod === \'direct\'"]');
        const toggleButton = document.querySelector('.dropdown-toggle span');
        
        if (fileUploadDiv) fileUploadDiv.style.display = 'block';
        if (directEntryDiv) directEntryDiv.style.display = 'none';
        if (toggleButton) toggleButton.textContent = 'File Upload';
    };
    
    const toggleDirectEntry = function() {
        const fileUploadDiv = document.querySelector('.custom-file');
        const directEntryDiv = document.querySelector('[x-show="recipientMethod === \'direct\'"]');
        const toggleButton = document.querySelector('.dropdown-toggle span');
        
        if (fileUploadDiv) fileUploadDiv.style.display = 'none';
        if (directEntryDiv) directEntryDiv.style.display = 'block';
        if (toggleButton) toggleButton.textContent = 'Direct Entry';
    };
    
    // Add click handlers for dropdown items
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    if (dropdownItems && dropdownItems.length > 0) {
        dropdownItems.forEach(item => {
            item.addEventListener('click', function(e) {
                if (this.textContent.includes('File Upload')) {
                    toggleFileUpload();
                } else if (this.textContent.includes('Direct Entry')) {
                    toggleDirectEntry();
                }
            });
        });
    }
    
    // Initialize with file upload visible
    setTimeout(toggleFileUpload, 500);
});