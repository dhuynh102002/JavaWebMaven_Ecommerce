<%-- 
    Document   : register
    Created on : Jun 15, 2024, 7:10:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image">
                            <image src="image/image_authen.png" style="height: 100%; width: 100%"/>
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form class="user" action='<c:url value="/authen"/>' id="formRegister" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="name"
                                               name="name" placeholder="Full Name" value="${userInfo.name != null ? userInfo.name : ''}" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="phone"
                                               name="phone" placeholder="Phone Number" minlength="10" maxlength="10" 
                                               value="${userInfo.phone != null ? userInfo.phone : ''}" required>
                                    </div>

                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="email"
                                               name="email" placeholder="Email Address" 
                                               value="${userInfo.email != null ? userInfo.email : ''}" required>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user"
                                                   id="password" name="password" placeholder="Password" 
                                                   value="${userInfo.password != null ? userInfo.password : ''}" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user"
                                                   id="repeat_password" name="repeat_password" placeholder="Repeat Password" 
                                                   value="${userInfo.type != null ? userInfo.type : ''}" required>
                                        </div>
                                    </div>
                                    <input type="hidden" value="register" name="action" />
                                    <input type="submit" value="Register Account" class="btn btn-primary btn-user btn-block" />
                                        
                                    <hr>
                                    <a href="index.html" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Register with Google
                                    </a>
                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                    </a>
                                    
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href='<c:url value="/authen?action=forgot-password"/>'>Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href='<c:url value="/authen?action=login"/>'>Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>
