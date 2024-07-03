<%-- 
    Document   : forgot-password
    Created on : Jun 15, 2024, 7:38:29 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
    </head>
    <body>


        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-password-image">
                                    <!--                                    <image src="image/img_forgot_password.png"/>-->
                                    <image src="image/image_authen.png" style="height: 100%; width: 100%"/>
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                            <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                                and we'll send you a link to reset your password!</p>
                                        </div>
                                        <form class="user" action='<c:url value="/authen"/>' id="formForgotPassword" method="post">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user"
                                                       id="email" name="email" aria-describedby="emailHelp" value="${not empty sessionScope.USER_EMAIL ?  sessionScope.USER_EMAIL : ''}"
                                                       placeholder="Enter Email Address..." required ${empty sessionScope.USER_EMAIL ? '': 'disabled="true"'}>
                                            </div>

                                            <div class="form-group">
                                                <input type="hidden" class="form-control form-control-user ${empty codeStatus ? '' : (codeStatus == 'valid' ? 'is-valid' : 'is-invalid')}" 
                                                       value="${(not empty sessionScope.RESET_CODE && param.message != 'code_sent' && param.codeStatus != 'invalid') ?  sessionScope.RESET_CODE : ''}"
                                                       id="code" name="code" placeholder="Enter Verification Code" required>
                                            </div>

                                            <div class="form-group" >
                                                <input type="hidden" class="form-control form-control-user" id="password" name="password" placeholder="Enter New Password" required>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" class="form-control form-control-user" id="repeat_password" name="repeat_password" placeholder="Repeat New Password" required>
                                            </div>

                                            <input type="hidden" value="send-email" name="action" id="action"/>
                                            <input type="submit" value="Send Email" class="btn btn-primary btn-user btn-block" id="submit-form"/>

                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href='<c:url value="/authen?action=register"/>'>Create an Account!</a>
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

            </div>

        </div>

        <script>
            window.onload = function () {
                var actionElement = document.getElementById('action');
                var submitform = document.getElementById('submit-form');

                var isNotEmptyEmail = <%= session.getAttribute("USER_EMAIL") != null && !session.getAttribute("USER_EMAIL").toString().isEmpty()%>;
                console.log(isNotEmptyEmail);

                if (isNotEmptyEmail) {
                    document.getElementById('code').type = 'text';
                    actionElement.value = 'verify-code';
                    submitform.value = 'Verify Code';
                }

                var actionValue = document.getElementById('action').value.trim();
                console.log("action", actionValue);
                // Lấy URL hiện tại
                var urlParams = new URLSearchParams(window.location.search);
                
                // Lấy giá trị của tham số 'message'
                var message = urlParams.get('message');
                var alert = urlParams.get('alert');
                var codeStatus = urlParams.get('codeStatus');
                console.log(message);
                console.log(alert);

                if ((actionValue === "send-email" && alert === "success")) {
                    document.getElementById('code').type = 'text';
                    actionElement.value = 'verify-code';
                    submitform.value = 'Verify Code';
                } else if (actionValue === "verify-code" && message !== 'code_sent' && codeStatus!=='invalid') {
                    document.getElementById('password').type = 'password';
                    document.getElementById('repeat_password').type = 'password';
                    actionElement.value = 'reset-password';
                    submitform.value = 'Reset Password';
                }
            };
        </script>
    </body>
</html>
