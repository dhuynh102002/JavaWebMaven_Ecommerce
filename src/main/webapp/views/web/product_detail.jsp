<%-- 
    Document   : product_detail
    Created on : Jun 11, 2024, 9:34:08 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Product section-->
        <section class="py-8">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${productModel.productSupplier.image}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${productModel.productSupplier.origin}</div>
                        <h1 class="display-5 fw-bolder">${productModel.productSupplier.name}</h1>
                        <div class="fs-5 mb-5">
                            <!-- Product price-->
                            <c:choose>
                                <c:when test="${productModel.discount != 0}">
                                    <span class="text-decoration-line-through">
                                        <fmt:formatNumber type = "currency" value = "${productModel.price}" />
                                    </span>
                                </c:when>
                            </c:choose>
                            <c:set var="reducedPrice" value="${productModel.price * ((100-productModel.discount) / 100)}" />
                            <span><fmt:formatNumber type="currency" value="${reducedPrice}" /></span>
                        </div>
                        <!-- table product description -->
                        <h4>Description</h4>
                        <c:set var="productDescription" value="${productModel.productSupplier.description}"/>
                        <c:set var="delimiter" value="%%" />
                        <c:set var="descriptionLines" value="${fn:split(productDescription, delimiter)}" />
                        <table class="table">
                            <%-- Iterate through description lines and split into attribute and value --%>
                            <c:forEach var="line" items="${descriptionLines}">
                                <c:set var="parts" value="${line.split(':')}"/>
                                <tbody>
                                    <tr>
                                        <th scope="row">${parts[0]}</th>
                                        <td>${parts[1]}</td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- Quantity -->
                        <div class="d-flex gap-3" >
                            <div class="input-group quantity" style="width: 150px">
                                <div class="input-group-prepend decrement-btn" style="cursor: pointer">
                                    <span class="input-group-text">-</span>
                                </div>
                                <input type="num" class="qty-input form-control" id="inputQuantity" maxlength="2" max="${productModel.quantity}" value="1" style="max-width: 5rem; text-align: center">
                                <div class="input-group-append increment-btn" style="cursor: pointer">
                                    <span class="input-group-text">+</span>
                                </div>
                            </div>

                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addToCart(${productModel.id})">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                        <div id="messageMaxQuantity" style="display: none; color: red; margin-top: 10px">Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div id="relatedProductsCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${productModel.listResult}" var="item" varStatus="status">
                            <c:if test="${status.index % 4 == 0}">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                                    </c:if>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="${item.productSupplier.image}" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">${item.productSupplier.name}</h5>
                                                    <!-- Product reviews -->
                                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                                        <c:set var="rating" value="${item.rating}" />
                                                        <c:choose>
                                                            <c:when test="${rating >= 9}">
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                            </c:when>
                                                            <c:when test="${rating >= 7.5}">
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                            </c:when>
                                                            <c:when test="${rating >= 5.9}">
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                            </c:when>
                                                            <c:when test="${rating >= 3.5}">
                                                                <div class="bi-star-fill"></div>
                                                                <div class="bi-star-fill"></div>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <!-- Product price-->
                                                    <c:choose>
                                                        <c:when test="${item.discount != 0}">
                                                            <span class="text-muted text-decoration-line-through">
                                                                <c:set var="OriginalPrice" value="${item.price / ((100-item.discount) / 100)}" />
                                                                <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                                                            </span>
                                                        </c:when>
                                                    </c:choose>
                                                    <fmt:formatNumber type="currency" value="${item.price}" /> 
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center">
                                                    <a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/details?id=${item.id}">View details</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--phần tử trong vòng lặp có chia hết cho 4 và dư 3 hay không. 
                                    thực hiện sau khi đã lặp qua 4 sản phẩm (0, 1, 2, 3), và đến sản phẩm thứ 4 (index = 3).
                                    status.index % 4 == 3: Đây là sản phẩm thứ tư trong nhóm 4 sản phẩm.
                                    status.last: Đây là sản phẩm cuối cùng trong danh sách.-->
                                    <c:if test="${status.index % 4 == 3 || status.last}">
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <!-- Conditional Carousel controls -->
                    <c:if test="${fn:length(productModel.listResult) > 4}">
                        <div class="carousel-controls" >
                            <button class="carousel-control-prev" type="button" data-bs-target="#relatedProductsCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#relatedProductsCarousel" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!--         Related items section
                <section class="py-5 bg-light">
                    <div class="container px-4 px-lg-5 mt-5">
                        <h2 class="fw-bolder mb-4">Related products</h2>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach items="${productModel.listResult}" var="item" >
            <div class="col mb-5">
                <div class="card h-100">
                     Product image
                    <img class="card-img-top" src="${item.productSupplier.image}" alt="..." />
                     Product details
                    <div class="card-body p-4">
                        <div class="text-center">
                             Product name
                            <h5 class="fw-bolder">${item.productSupplier.name}</h5>
                             Product reviews 
                            <div class="d-flex justify-content-center small text-warning mb-2">
            <c:set var="rating" value="${item.rating}" />
            <c:choose>
                <c:when test="${rating >= 9}">
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                </c:when>
                <c:when test="${rating >= 7.5}">
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                </c:when>
                <c:when test="${rating >= 5.9}">
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                </c:when>
                <c:when test="${rating >= 3.5}">
                    <div class="bi-star-fill"></div>
                    <div class="bi-star-fill"></div>
                </c:when>
            </c:choose>
        </div>
         Product price
            <c:choose>
                <c:when test="${item.discount != 0}">
                    <span class="text-muted text-decoration-line-through">
                    <c:set var="OriginalPrice" value="${item.price / ((100-item.discount) / 100)}" />
                    <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                </span>
                </c:when>
            </c:choose>
            <fmt:formatNumber type = "currency" value = "${item.price}" /> 
        </div>
    </div>
     Product actions
    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/details?id=${item.id}">View details</a></div>
    </div>
</div>
</div>
        </c:forEach>

    </div>
</div>
</div>
</section>-->

        <script>
            $(document).ready(function () {

                $('.increment-btn').click(function (e) {
                    e.preventDefault();
                    var incre_value = $(this).parents('.quantity').find('.qty-input').val();
                    var maxQuatity = document.getElementById('inputQuantity').max;
                    var value = parseInt(incre_value, 10);
                    value = isNaN(value) ? 0 : value;

                    if (value < maxQuatity) {
                        value++;
                        $(this).parents('.quantity').find('.qty-input').val(value);
                    }

                    if (value >= maxQuatity) {
                        document.getElementById('messageMaxQuantity').style.display = 'block';
                    }

                });

                $('.decrement-btn').click(function (e) {
                    e.preventDefault();
                    var decre_value = $(this).parents('.quantity').find('.qty-input').val();
                    var maxQuatity = document.getElementById('inputQuantity').max;
                    var value = parseInt(decre_value, 10);
                    value = isNaN(value) ? 0 : value;
                    if (value > 1) {
                        value--;
                        $(this).parents('.quantity').find('.qty-input').val(value);
                    }

                    if (value < maxQuatity) {
                        document.getElementById('messageMaxQuantity').style.display = 'none';
                    }
                });


                window.addToCart = function (productId) {
                    var quantity = document.getElementById("inputQuantity").value.trim();

                    $.ajax({
                        url: '${pageContext.request.contextPath}/shoppingcart',
                        type: 'POST',
                        data: {
                            id: productId,
                            quantity: quantity,
                            action: 'add'
                        },
                        success: function (response) {
                            console.log("message: " + response.message);
                            console.log("cartSize " + response.cartSize);
                            if (response.message !== "") {
                                alert(response.message);
                            } else {
                                showTemporaryAlert('Product added to cart successfully!', 'success');
                            }
                            $('#cart-quantity').text(response.cartSize);
                        },
                        error: function () {
                            showTemporaryAlert('Failed to add product to cart.', 'error');
                        }
                    });
                };

            });

        </script>
    </body>
</html>
