<%-- 
    Document   : header
    Created on : May 30, 2024, 6:23:58 PM
    Author     : ASUS
--%>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" style="box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
     background-color: #fff;height: 100px; transition: background-color 0.3s ease, box-shadow 0.3s ease;">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index" ><img src="image/logo_Techstore.png"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>

            <!-- Search -->
            <div class="input-group" style="width: 40%">
                <input type="text" class="form-control" placeholder="Search product name" 
                       id="searchName" name="searchName" oninput="searchProduct(1);">
                <div class="input-group-append">
                    <button class="btn btn-secondary" type="button" id="submitSearch" onclick="searchProduct(1)">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>   



            <ul class="navbar-nav ml-auto" style="padding-left: 50px; padding-right: 10px">
                <c:if test="${not empty USERMODEL}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" href='#'>Wellcome, ${USERMODEL.name}</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Profile</a></li>
                            <li><a class="dropdown-item" href='<c:url value="/order-history"/>'>Order History</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/logout?action=logout"/>'>Logout   <i class="fas fa-sign-out-alt"></i></a>
                    </li>
                </c:if>
                <c:if test="${empty USERMODEL}">
                    <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/authen?action=login"/>'>
                            <i class="fa-solid fa-right-to-bracket"></i>   Login</a>
                    </li>
                </c:if>
            </ul>

            <div class="d-flex">

                <a href="${pageContext.request.contextPath}/shoppingcart">
                    <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <c:set var="cartSize" value="${not empty sessionScope.CART ? fn:length(sessionScope.CART) : 0}" />
                        <span class="badge bg-dark text-white ms-1 rounded-pill" id="cart-quantity">${cartSize}</span>
                    </button>
                </a>
            </div>
        </div>
    </div>
</nav>

