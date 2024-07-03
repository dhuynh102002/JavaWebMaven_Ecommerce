<%-- 
    Document   : edit
    Created on : Jun 29, 2024, 10:53:05 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-product-supplier"/>
<c:url var ="ProductSupplierURL" value="/admin-product-supplier"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form New - Update Product Supplier</title>
    </head>
    <body>
        <div class="container-fluid">

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value="/admin-product-supplier?type=list"/>">Table Product Supplier</a>
                </li>
                <li class="active">/ Edit product supplier</li>
            </ul><!-- /.breadcrumb -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="h3 m-0 font-weight-bold text-primary">Information Product Supplier</h6>
                </div>
                <div class="card-body">
                    <form class="mx-4" id="formSubmit"> 
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Image</label>
                            <div class="col-sm-10">
                                <input type="${not empty productSupplierModel.id ? 'image' : 'hidden'}" src="<c:url value="${productSupplierModel.image}"/>" id="imageVisible">
                                <c:if test="${empty productSupplierModel.id}">
                                    <!-- Upload image input-->
                                    <input id="uploadImage" type="file" onchange="readURL(this);" class="form-control border-0" >
                                </c:if>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" value="${productSupplierModel.name}" class="form-control" id="name" name="name" >
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Origin</label>
                            <div class="col-sm-10">
                                <input type="text" value="${productSupplierModel.origin}" class="form-control" id="origin" name="origin">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Category</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="categoryId" name="categoryId">
                                    <option value="">Choose category</option>
                                    <c:forEach items="${categoryModel.listResult}" var="item" >
                                        <option value="${item.id}"<c:if test="${item.id == productSupplierModel.category.id}">selected="selected"</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Brand</label>
                            <div class="col-sm-10" id="brand-list">
                                <select class="form-control" id="brandId" name="brandId">
                                    <option value="">Choose brand</option>
                                    <c:forEach items="${brandModel.listResult}" var="item">
                                        <option value="${item.id}" <c:if test="${item.id == productSupplierModel.brand.id}">selected="selected"</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
                            <div class="col-sm-10">
                                <c:set var="productDescription" value="${productSupplierModel.description}"/>
                                <c:set var="delimiter" value="%%" />
                                <c:set var="descriptionLines" value="${fn:split(productDescription, delimiter)}" />
                                <textarea class="form-control" id="description" name="description" rows="${fn:length(descriptionLines)}">
                                    <c:forEach var='line' items='${descriptionLines}' varStatus="status">${line}</c:forEach>
                                    </textarea>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Quantity</label>
                                <div class="col-sm-10">
                                    <input type="number" value="${productSupplierModel.quantity}" class="form-control" id="quantity" name="quantity">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
                            <div class="col-sm-10">
                                <input type="text" value="<fmt:formatNumber value="${productSupplierModel.price}" type="number"/>" class="form-control" id="price" name="price">
                            </div>
                        </div>

                        <c:if test="${not empty productSupplierModel.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold" value="Update" id="btnAddOrUpdateProductSupplier"/>
                        </c:if>
                        <c:if test="${empty productSupplierModel.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold" value="Add" id="btnAddOrUpdateProductSupplier"/>
                        </c:if>
                        <input type="hidden" name="id" id="id" value="${productSupplierModel.id}" />
                        <input type="hidden" name="id_ctBrand" id="id_ctBrand" value="${productSupplierModel.id_ctBrand}" />
                        <input type="hidden" name="image1" id="image1" value="${productSupplierModel.image1}" />
                        <input type="hidden" name="image2" id="image2" value="${productSupplierModel.image2}" />
                        <input type="hidden" name="image3" id="image3" value="${productSupplierModel.image3}" />
                        <input type="hidden" name="id_producer" id="id_producer" value="${productSupplierModel.id_producer}" />
                        <input type="hidden" value="${productSupplierModel.image}" id="image" name="image">
                    </form>
                </div>
            </div>
        </div>
        <script>
            var uploadImage = document.getElementById('uploadImage');
            uploadImage.addEventListener("change", function () {
                readURL(uploadImage);
            });

            function readURL(input) {
                var imageVisible = document.getElementById('imageVisible');
                var imageHidden = document.getElementById('image');
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        imageVisible.type = 'image';
                        imageVisible.src = e.target.result;
                        imageHidden.value = e.target.result;//image base64
                        console.log("url: " + imageHidden.value);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            document.getElementById("categoryId").addEventListener("change", function () {
                var selectedCategoryId = this.value; //value=id
                if (selectedCategoryId) {
                    loadListBrand(selectedCategoryId);
                }
            });

            function loadListBrand(categoryId) {
                $.ajax({
                    url: '${ProductSupplierURL}',
                    type: 'GET',
                    data: {
                        action: 'getListBrandByCategoryId',
                        categoryId: categoryId
                    },
                    success: function (response) {
                        var brandsContainer = document.getElementById("brand-list"); // Get the container for brands
                        var brandsList = `<select class="form-control" id="brandId" name="brandId">
                                <option value="">Choose brand</option>`;

                        var selectedBrandId = '${productSupplierModel.brand.id}'; // Lấy ID của nhãn hiệu đã chọn từ JSP

                        response.forEach(function (brand) {
                            var selected = brand.id === selectedBrandId ? 'selected="selected"' : '';

                            brandsList += `<option value="` + brand.id + `"` + selected + `>` + brand.name + `</option>
                            `;
                        });

                        brandsList += `</select>`;

                        // Update the brands container with new content
                        brandsContainer.innerHTML = brandsList;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                        console.error("Error (removeFromCart):", xhr);
                    }
                });
            }
            document.getElementById("btnAddOrUpdateProductSupplier").addEventListener("click", function (e) {
                e.preventDefault();
                var data = {};
                var form = document.getElementById("formSubmit");
                var formData = $(form).serializeArray();
                console.log(formData);
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value.trim();
                });
                console.log(data);
                // Lấy giá trị từ textarea và thêm lại dấu %%
                data["description"] = data["description"].split('\n').join('%%');

                //xóa toàn bộ , or . (nếu có)
                data["price"] = data["price"].replace(/[,.]/g, '');

                var id = document.getElementById("id").value.trim();
                console.log(data);
                if (id === "") {
                    add(data);
                } else {
                    update(data);
                }
            });
            function add(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        alert("Add successful");
                        window.location.href = "${ProductSupplierURL}?type=list";
                    },
                    error: function (error) {
                        console.error("Error (add):", error);
                    }
                });
            }
            function update(data) {
                $.ajax({
                    url: '${APIurl}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        alert("Update successful");
                        window.location.href = "${ProductSupplierURL}?type=list";
                    },
                    error: function (error) {
                        console.error("Error (update):", error);
                    }
                });
            }

        </script>

    </body>
</html>

