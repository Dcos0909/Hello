// Email responsive functionality

document.addEventListener('DOMContentLoaded', function() {
    // Handle window resize for DataTables
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            // Check if DataTable exists and redraw it
            if ($.fn.dataTable.isDataTable('#emailTable')) {
                $('#emailTable').DataTable().columns.adjust().responsive.recalc();
            }
        }, 250);
    });
    
    // Fix for mobile view - expand/collapse rows
    $('#emailTable').on('click', 'td', function() {
        if (window.innerWidth < 768) {
            const table = $('#emailTable').DataTable();
            const row = table.row($(this).closest('tr'));
            
            if (row.child.isShown()) {
                row.child.hide();
                $(this).closest('tr').removeClass('shown');
            } else {
                row.child.show();
                $(this).closest('tr').addClass('shown');
            }
        }
    });
    
    // Adjust table when tab becomes visible
    $('a[data-toggle="tab"]').on('shown.bs.tab', function() {
        if ($.fn.dataTable.isDataTable('#emailTable')) {
            $('#emailTable').DataTable().columns.adjust().responsive.recalc();
        }
    });
});