<%-- 
    Document   : web
    Created on : May 30, 2024, 8:34:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Trang chủ"/></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<c:url value="/template/web/assets/favicon.ico"/>" />
        <!-- Bootstrap icons-->
        <link href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/template/web/css/styles.css"/>" rel="stylesheet" type="text/css" media="all"/>

        <!-- Font Awesome CSS - link icon of tag i -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/utilities/font-size/font-size.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/utilities/padding/padding.css">


        <!--paging-->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
        <script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>  
        
        <!-- table order history-->

        <link href="<c:url value="/template/admin/datatables/dataTables.bootstrap4.min.css"/>" rel="stylesheet">
        <!-- table order history-->
        
        <style>
            .icon-trash:hover i {
                color: red;
            }

            .temp-alert {
                position: fixed;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                padding: 15px;
                color: #721c24;
                border-radius: 5px;
                z-index: 10000;
                display: none;
                animation: slideDown 0.5s ease-in-out forwards;
            }

            .temp-alert.success {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }

            .temp-alert.error {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }

            @keyframes slideDown {
                0% {
                    top: -100px;
                    opacity: 0;
                }
                100% {
                    top: 20px;
                    opacity: 1;
                }
            }
        </style>
    </head>
    <body>
        <!-- Temporary alert message -->
        <div id="tempAlert" class="temp-alert"></div>

        <!--header-->
        <%@include file="/common/web/header.jsp" %>
        <!--header-->

        <dec:body/>

        <!--footer-->
        <%@include file="/common/web/footer.jsp" %>
        <!--footer-->

        <!-- Bootstrap core JS-->
        <script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"/>"></script>

        <!-- table order history -->
        <script src="<c:url value="/template/admin/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/template/admin/datatables/dataTables.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/template/admin/js/demo/datatables-demo.js"/>"></script>
        <!--table order history-->
        
        <script>
            function showTemporaryAlert(message, type) {
                var alertBox = document.getElementById('tempAlert');
                alertBox.textContent = message;
                alertBox.className = 'temp-alert ' + type;
                alertBox.style.display = 'block';
                setTimeout(function () {
                    alertBox.style.top = '-100px';
                    alertBox.style.display = 'none';
                }, 2500); // After 2.5 seconds, hide the alert
            }
        </script>
    </body>
</html>
