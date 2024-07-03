<%-- 
    Document   : edit
    Created on : Jun 26, 2024, 10:48:40 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form New - Update Product</title>
    </head>
    <body>
        <div class="container-fluid">

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value="/admin-product?type=list"/>">Table Product</a>
                </li>
                <li class="active">/ Edit product</li>
            </ul><!-- /.breadcrumb -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="h3 m-0 font-weight-bold text-primary">Information Product</h6>
                </div>
                <div class="card-body">
                    <form class="mx-4" id="formSubmit"> 
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Image</label>
                            <div class="col-sm-10" style="">
                                <input type="image" src="<c:url value="${productModel.productSupplier.image}"/>" id="image" name="image" disabled="true">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <input type="text" value="${productModel.productSupplier.name}" class="form-control" id="name" name="name" disabled="true">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Category</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="categoryId" name="categoryId" disabled="true">
                                    <option value="">Choose category</option>
                                    <c:forEach items="${categoryModel.listResult}" var="item" >
                                        <option value="${item.id}" <c:if test="${item.id == productModel.productSupplier.category.id}">selected="selected"</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Brand</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="brandId" name="brandId" disabled="true">
                                    <option value="">Choose brand</option>
                                    <c:forEach items="${brandModel.listResult}" var="item">
                                        <option value="${item.id}" <c:if test="${item.id == productModel.productSupplier.brand.id}">selected="selected"</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Quantity</label>
                            <div class="col-sm-10">
                                <input type="number" value="${productModel.quantity}" class="form-control" id="quantity" name="quantity">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Price</label>
                            <div class="col-sm-10">
                                <input type="text" value="<fmt:formatNumber value="${productModel.price}" type="number"/>" class="form-control" id="price" name="price">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Rating</label>
                            <div class="col-sm-10">
                                <input type="number" value="${productModel.rating}" class="form-control" id="rating" name="rating">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Discount</label>
                            <div class="col-sm-10">
                                <input type="number" value="${productModel.discount}" class="form-control" id="discount" name="discount">
                            </div>
                        </div>
                        <c:if test="${not empty productModel.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold" value="Update" id="btnAddOrUpdateProduct"/>
                        </c:if>
                        <c:if test="${empty productModel.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold" value="Add" id="btnAddOrUpdateProduct"/>
                        </c:if>
                        <input type="hidden" name="id" id="id" value="${productModel.id}" />
                        <input type="hidden" name="id_spncc" id="id_spncc" value="${productModel.id_spncc}" />
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.getElementById("btnAddOrUpdateProduct").addEventListener("click", function (e){
                e.preventDefault();
                var data = {};
                var form = document.getElementById("formSubmit");
                var formData = $(form).serializeArray();
                console.log(formData);
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                console.log(data);
                data["priceSP"] = data["priceSP"].replace(/[,.]/g,''); //xóa toàn bộ , or . (nếu có)
                var id = document.getElementById("id").value.trim();
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
                        window.location.href = "${ProductURL}?type=list";
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
                        window.location.href = "${ProductURL}?type=list";
                    },
                    error: function (error) {
                        console.error("Error (update):", error);
                    }
                });
            }
        </script>

    </body>
</html>
