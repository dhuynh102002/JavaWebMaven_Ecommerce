<%-- 
    Document   : authen
    Created on : Jun 15, 2024, 7:33:31 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication</title>
        <!-- Custom fonts for this template-->
        <link href="<c:url value="/template/admin/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        
        <!-- Custom styles for this template-->
        <link href="<c:url value="/template/admin/css/sb-admin-2.min.css"/>" rel="stylesheet">
    </head>
    <body class="bg-gradient-primary">
        <c:if test="${not empty message}">
            <div class="alert alert-${alert}">
                ${message}
            </div>
        </c:if>

        <dec:body/>

        <!-- Bootstrap core JavaScript-->
        <script src="<c:url value="/template/admin/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value="/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

        <!-- Core plugin JavaScript-->
        <script src="<c:url value="/template/admin/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

        <!-- Custom scripts for all pages-->
        <script src="<c:url value="/template/admin/js/sb-admin-2.min.js"/>"></script>
    </body>
</html>
