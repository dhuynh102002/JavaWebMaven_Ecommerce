<%-- 
    Document   : admin
    Created on : May 30, 2024, 8:34:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Admin"/></title>
        <!-- Custom fonts for this template-->
        <link href="<c:url value="/template/admin/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        
        
        <!-- Custom styles for this template-->
        <link href="<c:url value="/template/admin/css/sb-admin-2.min.css"/>" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="<c:url value="/template/admin/datatables/dataTables.bootstrap4.min.css"/>" rel="stylesheet">

        <style>
            th.no-sort::after, th.no-sort::before {
                display: none !important; /* Ẩn biểu tượng sort nếu được thêm bởi DataTables hoặc thư viện khác */
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!--menu-->
            <%@include file="/common/admin/menu.jsp" %>
            <!--menu-->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!--hearder-->
                    <%@include file="/common/admin/hearder.jsp" %>
                    <!--hearder-->
                    <dec:body/>

                </div>

                <!--footer-->
                <%@include file="/common/admin/footer.jsp" %>
                <!--footer-->
            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal (dialog confirm logout)-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="<c:url value="/logout?action=logout"/>">Logout</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript-->
        <script src="<c:url value="/template/admin/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

        <!-- Core plugin JavaScript-->
        <script src="<c:url value="/template/admin/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

        <!-- Custom scripts for all pages-->
        <script src="<c:url value="/template/admin/js/sb-admin-2.min.js"/>"></script>

        <!-- Page level plugins -->
        <script src="<c:url value="/template/admin/vendor/chart.js/Chart.min.js"/>"></script>

        <!-- Page level custom scripts -->
        <script src="<c:url value="/template/admin/js/demo/chart-area-demo.js"/>"></script>
        <script src="<c:url value="/template/admin/js/demo/chart-pie-demo.js"/>"></script>

        <!-- Page level plugins -->
        <script src="<c:url value="/template/admin/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/template/admin/datatables/dataTables.bootstrap4.min.js"/>"></script>

        <!-- Page level custom scripts -->
        <script src="<c:url value="/template/admin/js/demo/datatables-demo.js"/>"></script>

    </body>
</html>
