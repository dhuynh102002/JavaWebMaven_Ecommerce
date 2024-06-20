<%-- 
    Document   : shopping_cart
    Created on : Jun 11, 2024, 11:56:02 AM
    Author     : ASUS
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
    <body>
        <section class="h-100 h-custom" style="background-color: #eee; margin-top: 20px">
            <div class="container py-5 h-100" style="padding-top: 6rem !important;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">
                                <c:set var="totalPrice" value="0" />
                                <div class="row">

                                    <div class="col-lg-7">
                                        <h5 class="mb-3"><a href="${pageContext.request.contextPath}/index" class="text-body"><i
                                                    class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                        <hr>

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div>
                                                <p class="mb-1">Shopping cart</p>
                                                <p class="mb-0">You have ${fn:length(sessionScope.CART)} items in your cart</p>
                                            </div>
                                            <div class="d-flex flex-row align-items-center">
                                                <a href="" style="margin-right: 20px" onclick="removeAllFromCart()">Remove All</a>

                                                <div class="mb-0 dropdown">
                                                    <span class="text-muted">Sort by:</span> 
                                                    <a href="#!" class="text-body" id="sortDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">price <i class="fas fa-angle-down mt-1"></i></a>
                                                    <ul class="dropdown-menu" aria-labelledby="sortDropdown" style="cursor: pointer">
                                                        <li><a class="dropdown-item" href="#" onclick="sortItemByPrice('ASC')">Ascending</a></li>
                                                        <li><a class="dropdown-item" href="#" onclick="sortItemByPrice('DESC')">Descending</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="product-list-cart">
                                            <c:choose>
                                                <c:when test="${not empty sessionScope.CART}">
                                                    <c:forEach items="${sessionScope.CART.values()}" var="item" >
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div>
                                                                            <img
                                                                                src="${item.imageSP}"
                                                                                class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h5>${item.nameSP}</h5>
                                                                            <p class="small mb-0">${item.originSP}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div style="width: 50px;">
                                                                            <h5 class="fw-normal mb-0">${item.quantitySP}</h5>
                                                                        </div>
                                                                        <div style="width: 150px;">
                                                                            <h5 class="mb-0"><fmt:formatNumber type = "currency" value = "${item.priceSP*item.quantitySP}" /></h5>
                                                                        </div>
                                                                        <a href="" class="icon-trash" style="color: #cecece;" onclick="removeFromCart(${item.id})"><i class="fas fa-trash-alt"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:set var="totalPrice" value="${totalPrice + (item.priceSP*item.quantitySP)}" />
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="text-align: center">Your cart is empty.</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">

                                        <div class="card bg-primary text-white rounded-3">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <h5 class="mb-0">PAY</h5>
                                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp"
                                                         class="img-fluid rounded-3" style="width: 45px;" alt="Avatar">
                                                </div>

                                                <p class="small mb-2">Card type</p>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i
                                                        class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>

                                                <form class="mt-4">
                                                    <div data-mdb-input-init class="form-outline form-white mb-2">
                                                        <input type="text" id="name" class="form-control form-control-lg" siez="17"
                                                               placeholder="Name" value="${sessionScope.USERMODEL.name}" disabled="true"/>
                                                        <label class="form-label" for="typeName">Full Name</label>
                                                    </div>

                                                    <div data-mdb-input-init class="form-outline form-white mb-2">
                                                        <input type="text" id="email" class="form-control form-control-lg" siez="17"
                                                               placeholder="abc@gmail.com" value="${sessionScope.USERMODEL.email}" disabled="true"/>
                                                        <label class="form-label" for="typeText">Email</label>
                                                    </div>                                             

                                                    <div data-mdb-input-init class="form-outline form-white mb-2">
                                                        <input type="text" id="phone" class="form-control form-control-lg" siez="17"
                                                               placeholder="1234 5678 90" minlength="10" maxlength="10" value="${sessionScope.USERMODEL.phone}" required/>
                                                        <label class="form-label" for="typeText">Phone Number</label>
                                                    </div>

                                                    <div data-mdb-input-init class="form-outline form-white mb-2">
                                                        <input type="text" id="address" class="form-control form-control-lg" siez="17"
                                                               placeholder="House number, Street, Ward, District, City" required/>
                                                        <label class="form-label" for="typeText">Address</label>
                                                    </div>

                                                </form>

                                                <hr class="my-4">
                                                <!-- Calculate the total price -->
                                                <div class="d-flex justify-content-between">
                                                    <p class="mb-2">Subtotal</p>
                                                    <p class="mb-2"><fmt:formatNumber type = "currency" value = "${totalPrice}" /></p>
                                                </div>

                                                <c:if test="${empty sessionScope.CART}">
                                                    <c:set var="shipping" value="0" />
                                                </c:if>
                                                <c:if test="${not empty sessionScope.CART}">
                                                    <c:set var="shipping" value="20000" />
                                                </c:if>

                                                <div class="d-flex justify-content-between">
                                                    <p class="mb-2">Shipping</p>
                                                    <p class="mb-2"><fmt:formatNumber type = "currency" value = "${shipping}"/></p>
                                                </div>

                                                <c:set var="total" value="${totalPrice + shipping}" />
                                                <div class="d-flex justify-content-between mb-4">
                                                    <p class="mb-2">Total(Incl. taxes)</p>
                                                    <p class="mb-2"><fmt:formatNumber type = "currency" value = "${total}"/></p>
                                                </div>


                                                <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg" onclick="checkout()">
                                                    <div class="d-flex justify-content-between">
                                                        <span><fmt:formatNumber type = "currency" value = "${total}"/></span>
                                                        <span class="ms-3"> Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                    </div>
                                                </button>


                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            function removeFromCart(productId) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/shoppingcart',
                    type: 'POST',
                    data: {
                        action: 'remove',
                        id: productId
                    },
                    success: function (response) {
                        //alert(response);
                        location.reload(); // Reload the page to reflect changes
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.error("Error (removeFromCart):", xhr);
                    }
                });
            }

            function removeAllFromCart() {
                if (confirm("Are you sure you want to remove all items from the cart?")) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/shoppingcart',
                        type: 'POST',
                        data: {
                            action: 'removeAll'
                        },
                        success: function (response) {
                            location.reload(); // Reload the page to reflect changes
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                            console.error("Error (removeAllFromCart):", xhr);
                        }
                    });
                }
            }

            function sortItemByPrice(order) {
                var cartLength = <%= session.getAttribute("CART") != null ? ((Map) session.getAttribute("CART")).size() : 0%>;
                if (cartLength === 0) {
                    showTemporaryAlert('Your cart is empty. Cannot sort items.', 'error');
                    return;
                }

                $.ajax({
                    url: '${pageContext.request.contextPath}/shoppingcart',
                    type: 'POST',
                    data: {
                        action: 'sortPrice',
                        order: order
                    },
                    success: function (response) {
                        console.log(response);
                        // Get the container for product list
                        var productContainer = document.getElementById("product-list-cart");
                        productContainer.innerHTML = ''; // Clear existing content

                        function formatPrice(price) {
                            return price.toLocaleString('de-DE', {minimumFractionDigits: 0, maximumFractionDigits: 0}).replace(/\./g, '.') + ' đ';
                        }

                        // Iterate through sorted products and update HTML
                        response.forEach(function (item) {
                            var formattedPrice = formatPrice(item.priceSP);
                            var cardHtml = '<div class="card mb-3">' +
                                    '<div class="card-body">' +
                                    '<div class="d-flex justify-content-between">' +
                                    '<div class="d-flex flex-row align-items-center">' +
                                    '<div>' +
                                    '<img src="' + item.imageSP + '" class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">' +
                                    '</div>' +
                                    '<div class="ms-3">' +
                                    '<h5>' + item.nameSP + '</h5>' +
                                    '<p class="small mb-0">' + item.originSP + '</p>' +
                                    '</div>' +
                                    '</div>' +
                                    '<div class="d-flex flex-row align-items-center">' +
                                    '<div style="width: 50px;">' +
                                    '<h5 class="fw-normal mb-0">' + item.quantitySP + '</h5>' +
                                    '</div>' +
                                    '<div style="width: 150px;">' +
                                    '<h5 class="mb-0">' + formattedPrice + '</h5>' +
                                    '</div>' +
                                    '<a href="" class="icon-trash" style="color: #cecece;" onclick="removeFromCart(' + item.id + ')"><i class="fas fa-trash-alt"></i></a>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>';
                            productContainer.innerHTML += cardHtml;
                        });
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.error("Error (sortItemByPrice):", xhr);
                    }
                });
            }

            function checkout() {
                // Kiểm tra xem USERMODEL có tồn tại trong session hay không
                var userModel = '${sessionScope.USERMODEL}';
                if (!userModel || userModel === 'null') {
                    alert('Bạn phải đăng nhập trước khi tiến hành thanh toán.');
                    return;
                }

                // Check if CART is empty
                var cartLength = <%= session.getAttribute("CART") != null ? ((Map) session.getAttribute("CART")).size() : 0%>;
                if (cartLength === 0) {
                    alert('Giỏ hàng của bạn rỗng. Không thể thực hiện thanh toán.');
                    return;
                }
                
                var phone = document.getElementById('phone').value.trim();
                var address = document.getElementById('address').value.trim();
                console.log(phone);
                console.log(address);

                if (!phone || phone === 'null') {
                    alert('Bạn chưa nhập số điện thoại.');
                    return;
                }

                if (!address || address === 'null') {
                    alert('Bạn chưa nhập địa chỉ.');
                    return;
                }

                $.ajax({
                    url: '${pageContext.request.contextPath}/shoppingcart',
                    type: 'POST',
                    data: {
                        action: 'checkout',
                        phone: phone,
                        address: address

                    },
                    success: function (response) {
                        alert(response);
                        location.reload(); // Reload the page to reflect changes
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu có
                        alert('Thanh toán thất bại. Vui lòng thử lại.');
                        console.error("Error (checkout):", xhr);
                    }
                });
            }

        </script>
    </body>
</html>
