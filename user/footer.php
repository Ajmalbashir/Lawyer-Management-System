
        </div>
        <!-- /#page-content-wrapper -->
    </div>
    <!-- /#wrapper -->

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap4.js"></script>
    <script>
    $(document).ready(function() {
      console.log(<?php echo json_encode($all_clients); ?>);
        var datatable = $('#data_table').DataTable({
            "paging": true,  // Enable pagination
            "searching": true  // Enable searching
            // Add more options as needed
        });
    });
</script>
