<%-- 
    Document   : home
    Created on : May 30, 2024, 9:52:11 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        
    </head>
    <body>
        <!-- Banner-->
        <div id="carouselExampleIndicators" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/Green and Yellow Simple Clean Shoes Sale Banner.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/shoes sale (Banner (Landscape)).png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/banner3.png" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Bootstrap Grid Layout: Sử dụng container-fluid và row để tạo một hàng chứa hai cột: 
                .col-md-3: Cột bên trái chứa các bộ lọc.
                .col-md-9: Cột bên phải chứa danh sách sản phẩm.
        -->
        <div class="container-fluid"> 
            <div class="d-flex align-items-stretch">

                <!-- Filters -->
                <div class="col-md-2 filters" style="margin-top: 50px; margin-left: 20px">
                    <h5>Filters</h5>
                    <hr>
                    <div id="mobile-filter">
                        <div class="py-3">
                            <h5 class="font-weight-bold">Categories</h5>
                            <c:forEach items="${categoryModel.listResult}" var="item" >
                                <ul class="list-group" style="cursor: pointer">
                                    <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center category" data-id="${item.id}" onclick="toggleCategory(this)"> ${item.name} <span class="badge badge-primary badge-pill">328</span> </li>
                                </ul>
                            </c:forEach>
                        </div>
                        <div class="py-3" id="brand-list">
                            <h5 class="font-weight-bold">Brands</h5>
                            <c:forEach items="${brandModel.listResult}" var="item" >
                                <form class="brand">
                                    <div class="form-inline d-flex align-items-center py-1"> <input type="checkbox" name="brandCheckbox" data-id="${item.id}"><label class="tick" style="margin-left: 10px"> ${item.name} <span class="check"></span> </label> </div>
                                </form>
                            </c:forEach>
                        </div>
                        <div class="py-3">
                            <h5 class="font-weight-bold">Rating</h5>
                            <form class="rating">
                                <div class="form-inline d-flex align-items-center py-2"> <input type="checkbox" name="ratingFilter" value="5"><label class="tick" style="margin-left: 10px"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="check"></span> </label> </div>
                                <div class="form-inline d-flex align-items-center py-2"> <input type="checkbox" name="ratingFilter" value="4"><label class="tick" style="margin-left: 10px"> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="check"></span> </label> </div>
                                <div class="form-inline d-flex align-items-center py-2"> <input type="checkbox" name="ratingFilter" value="3"><label class="tick" style="margin-left: 10px"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span>  <span class="check"></span> </label> </div>
                                <div class="form-inline d-flex align-items-center py-2"> <input type="checkbox" name="ratingFilter" value="2"><label class="tick" style="margin-left: 10px"><span class="fas fa-star"></span> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span>  <span class="check"></span> </label> </div>
                                <div class="form-inline d-flex align-items-center py-2"> <input type="checkbox" name="ratingFilter" value="1"> <label class="tick" style="margin-left: 10px"> <span class="fas fa-star"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span> <span class="far fa-star px-1 text-muted"></span>  <span class="check"></span> </label> </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- Product List -->
                <div class="col-md-10" id="product-list">
                    <!-- Section-->
                    <form action="<c:url value='/index'/>" id="formProduct" method="get">
                        <section class="py-2">
                            <div class="container px-4 px-lg-5 mt-5">
                                <!-- Tổng sản phẩm -->
                                <span>Results: <span id="resultCount">${productModel.totalItem}</span> items | </span>
                                <span><a href="index">Clear all filter</a></span>

                                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="margin-top: 10px">
                                    <c:forEach items="${productModel.listResult}" var="item" >
                                        <div class="col mb-5">
                                            <div class="card h-100">
                                                <!-- Product image-->
                                                <img class="card-img-top" src="${item.imageSP}" alt="..." />
                                                <!-- Product details-->
                                                <div class="card-body p-4">
                                                    <div class="text-center">
                                                        <!-- Product name-->
                                                        <h5 class="fw-bolder">${item.nameSP}</h5>
                                                        <!-- rating-->
                                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                                            <c:set var="rating" value="${item.ratingSP}" />
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
                                                            <c:when test="${item.discountSP != 0}">
                                                                <span class="text-muted text-decoration-line-through">
                                                                    <c:set var="OriginalPrice" value="${item.priceSP / ((100-item.discountSP) / 100)}" />
                                                                    <fmt:formatNumber type="currency" value="${OriginalPrice}" />
                                                                </span>
                                                            </c:when>
                                                        </c:choose>
                                                        <fmt:formatNumber type = "currency" value = "${item.priceSP}" />
                                                    </div>
                                                </div>
                                                <!-- Product actions-->
                                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/details?id=${item.id}">View details</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- paging -->
                            <div class="container" style="margin-right: 135px">
                                <nav aria-label="Page navigation" style="display: flex; justify-content: flex-end;">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </div>
                            <input type="hidden" value="" id="page" name="page"/>
                            <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>

                        </section>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">

            $(document).ready(function () {
                function initializePagination(totalPages, currentPage, limit) {
                    console.log("totalPages..." + totalPages);
                    console.log("currentPage..." + currentPage);

                    window.pagObj = $('#pagination').twbsPagination({
                        totalPages: totalPages,
                        visiblePages: totalPages >= 3 ? 3 : (totalPages = 2 ? 2 : 0),
                        startPage: currentPage,
                        onPageClick: function (event, page) {
                            if (currentPage !== page) {
                                searchProduct(page);
                                $('#maxPageItem').val(limit);
                                $('#page').val(page);
//                                $('#formProduct').submit();
                            }
                        }
                    });
                }

                var selectedCategory = null;
                window.toggleCategory = function (element) { //window. => cho phép truy cập từ bên ngoài do nằm trong ($(document).ready())
                    //nếu đã chọn category đó rồi nhấn thêm lần nữa => bỏ nhấn
                    if (element.classList.contains("active")) {
                        element.classList.remove("active");
                        searchBrandsByCategory(0);
                        searchProduct(1);
                    } else {
                        // Loại bỏ "active" từ category đã chọn trước đó (nếu có)
                        if (selectedCategory)
                            selectedCategory.classList.remove("active");

                        //thêm active cho category được chọn
                        element.classList.add("active");
                        selectedCategory = element;

                        // lấy category ID của category được chọn
                        var categoryId = element.getAttribute('data-id');
                        searchBrandsByCategory(categoryId);
                        searchProduct(1);
                    }

                };

                // Function to attach event listeners to brand checkboxes
                function attachBrandCheckboxListeners() {
                    var brandCheckboxes = document.querySelectorAll("input[name='brandCheckbox']");
                    // Thêm sự kiện nghe lựa chọn cho mỗi checkbox brand
                    for (var i = 0; i < brandCheckboxes.length; i++) {
                        brandCheckboxes[i].addEventListener('change', function () {
                            searchProduct(1);
                        });
                    }
                }

                function attachRatingCheckboxListeners() {
                    var ratingCheckboxes = document.querySelectorAll("input[name='ratingFilter']");
                    // Thêm sự kiện nghe lựa chọn cho mỗi checkbox rating
                    for (var i = 0; i < ratingCheckboxes.length; i++) {
                        ratingCheckboxes[i].addEventListener('change', function () {
                            searchProduct(1);
                        });
                    }
                }

                function searchBrandsByCategory(categoryId) {

                    $.ajax({
                        url: "${pageContext.request.contextPath}/BrandsByCategoryController",
                        type: "get", //send it through get method
                        data: {
                            category: categoryId

                        },
                        traditional: true,
                        success: function (data) {

                            // Assuming 'data' is an array of brand objects with 'name' property
                            var brandsContainer = document.getElementById("brand-list"); // Get the container for brands
                            var brandsList = '<h5 class="font-weight-bold">Brands</h5>';

                            data.forEach(function (brand) {
                                brandsList += `<form class="brand">
                                            <div class="form-inline d-flex align-items-center py-1"> 
                                                <input type="checkbox" name="brandCheckbox" data-id="` + brand.id + `">
                                                <label class="tick" style="margin-left: 10px">` + brand.name + `<span class="check"></span> </label> 
                                            </div>
                                        </form>
                            `;
                            });

                            // Update the brands container with new content
                            brandsContainer.innerHTML = brandsList;

                            // Re-attach the event listeners to the new checkboxes
                            attachBrandCheckboxListeners();

                        },
                        error: function (xhr) {
                            //Do Something to handle error
                            console.error("Error (searchBrandsByCategory):", xhr);
                        }

                    });
                }

                //window. => cho phép truy cập từ bên ngoài do nằm trong ($(document).ready())
                window.searchProduct = function (pageNumber) {
                    var txtSearchName = document.getElementById("searchName").value.trim();
                    var activeCategory = document.querySelector(".category.active");
                    var categoryId = activeCategory ? activeCategory.getAttribute('data-id') : "";

                    var selectedBrands = [];
                    var brandCheckboxes = document.querySelectorAll('input[name="brandCheckbox"]:checked');
                    brandCheckboxes.forEach(function (checkbox) {
                        selectedBrands.push(checkbox.getAttribute('data-id'));
                    });

                    var selectedRatings = [];
                    var ratingCheckboxes = document.querySelectorAll('input[name="ratingFilter"]:checked');
                    ratingCheckboxes.forEach(function (checkbox) {
                        selectedRatings.push(checkbox.value);
                    });
                    console.log("name..." + txtSearchName);
                    console.log("categoryID..." + categoryId);
                    console.log("brand..." + selectedBrands);
                    console.log("rating..." + selectedRatings);

                    $.ajax({
                        url: "${pageContext.request.contextPath}/SearchController",
                        type: "get", //send it through get method
                        data: {
                            nameSP: txtSearchName,
                            category: categoryId,
                            brand: selectedBrands,
                            ratingFilter: selectedRatings,
                            page: pageNumber
                        },
                        traditional: true, // Đặt traditional thành true để gửi mảng dưới dạng "ratingFilter=1&ratingFilter=2&ratingFilter=3" (phù hợp với ngôn ngữ máy chủ Java)
                        success: function (data) {
                            var products = data.listResult;
                            var totalItemCount = data.totalItem;

                            var productContainer = document.getElementById("product-list"); // Get the container for product
                            productList = `<form action="/index" id="formSubmit" method="get">
                                        <section class="py-2">
                                            <div class="container px-4 px-lg-5 mt-5">
                                            <span>Results: <span id="resultCount">` + totalItemCount + `</span> items | </span>
                                            <span><a href="index">Clear all filter</a></span>
                                            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="margin-top: 10px">
                                        `;
                            // Function to format the price
                            function formatPrice(price) {
                                return price.toLocaleString('de-DE', {minimumFractionDigits: 0, maximumFractionDigits: 0}).replace(/\./g, '.') + ' đ';
                            }

                            products.forEach(function (item) {
                                var ratingStars = '';
                                if (item.ratingSP >= 9) {
                                    ratingStars = '<div class="bi-star-fill"></div>'.repeat(5);
                                } else if (item.ratingSP >= 7.5) {
                                    ratingStars = '<div class="bi-star-fill"></div>'.repeat(4);
                                } else if (item.ratingSP >= 5.9) {
                                    ratingStars = '<div class="bi-star-fill"></div>'.repeat(3);
                                } else if (item.ratingSP >= 3.5) {
                                    ratingStars = '<div class="bi-star-fill"></div>'.repeat(2);
                                }

                                var originalPrice = item.discountSP != 0 ? (item.priceSP / ((100 - item.discountSP) / 100)) : '';

                                // Format the original price and current price
                                var formattedOriginalPrice = originalPrice ? formatPrice(originalPrice) : '';
                                var formattedPrice = formatPrice(item.priceSP);
                                productList += `
                                                    <div class="col mb-5">
                                                        <div class="card h-100">
                                                            <!-- Product image-->
                                                            <img class="card-img-top" src="` + item.imageSP + `" alt="..." />
                                                            <!-- Product details-->
                                                            <div class="card-body p-4">
                                                                <div class="text-center">
                                                                    <!-- Product name-->
                                                                    <h5 class="fw-bolder">` + item.nameSP + `</h5>
                                                                    <!-- rating-->
                                                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                                                       ` + ratingStars + `
                                                                    </div>
                                                                    <!-- Product price-->
                                                                        <span class="text-muted text-decoration-line-through">
                                                                            ` + formattedOriginalPrice + `
                                                                        </span>
                                                                        ` + formattedPrice + `
                                                                </div>
                                                            </div>
                                                            <!-- Product actions-->
                                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/details?id=` + item.id + `">View details</a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                `;
                            });

                            productList += `
                                    </div>
                                </div>
                                <div class="container" style="margin-right: 135px">
                                    <nav aria-label="Page navigation" style="display: flex; justify-content: flex-end;">
                                            <ul class="pagination" id="pagination"></ul>
                                    </nav>
                                </div>
                                <input type="hidden" value="` + data.page + `" id="page" name="page"/>
                                <input type="hidden" value="` + data.maxPageItem + `" id="maxPageItem" name="maxPageItem"/>

                            </section>
                        </form>`;

                            // Update the brands container with new content
                            productContainer.innerHTML = productList;

                            // Re-attach the event listeners
                            initializePagination(data.totalPage, data.page, data.maxPageItem);
                            attachBrandCheckboxListeners();
                            attachRatingCheckboxListeners();

                        },
                        error: function (xhr) {
                            //Do Something to handle error
                            console.error("Error (searchProduct):", xhr);
                        }
                    });
                };

                var totalPages = ${productModel.totalPage};
                var currentPage = ${productModel.page};
                var limit = ${productModel.maxPageItem};
                initializePagination(totalPages, currentPage, limit);
                attachBrandCheckboxListeners();
                attachRatingCheckboxListeners();
            });
        </script>
    </body>
</html>
