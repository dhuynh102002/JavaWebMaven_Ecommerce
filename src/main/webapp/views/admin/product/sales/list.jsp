<%-- 
    Document   : list
    Created on : Jun 26, 2024, 10:49:07 AM
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
        <title>Table Product</title>
    </head>
    <body>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Product</h1>
            <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                For more information about DataTables, please visit the <a target="_blank"
                                                                           href="https://datatables.net">official DataTables documentation</a>.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="h3 m-0 font-weight-bold text-primary">Tables</h6>
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-5">
                            <a class="btn btn-success mb-2" id="addButton"  style="margin-right: 15px"><i class="fa fa-plus-circle"></i> Add Products</a>
                            <a href="" id="deleteButton"  class="btn btn-danger mb-2" style="margin-right: 15px"><i class="fa fa-trash"></i> Delete</a>

                        </div>
                        <div class="col-sm-7">
                            <div class="text-sm-end" style="text-align: right !important;">
                                <button type="button" class="btn btn-light mb-2 me-1">Import</button>
                                <button type="button" class="btn btn-light mb-2">Export</button>
                            </div>
                        </div><!-- end col-->
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="border-bottom: 1px solid #e3e6f0; border-left: 1px solid #e3e6f0;">
                            <thead>
                                <tr>
                                    <th class="no-sort" style="border-top: 1px solid #e3e6f0;">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="checkAll">
                                            <label class="form-check-label" for="checkAll">&nbsp;</label>
                                        </div>
                                    </th>
                                    <th style="border-top: 1px solid #e3e6f0;">Product</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Category</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Brand</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Quantity</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Price</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Discount</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Action</th>
                                </tr>
                            </thead>

                            <tbody style="border-bottom: 1px solid #e3e6f0; ">
                                <c:forEach items="${productModel.listResult}" var="item" >
                                    <c:url var="editURL" value="/admin-product">
                                        <c:param name="type" value="edit"/>
                                        <c:param name="id" value="${item.id}"/>
                                    </c:url>
                                    <tr style="border-bottom: 1px solid #e3e6f0;">
                                        <td>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input checkItem" id="customCheck${item.id}" value="${item.id}">
                                                <label class="form-check-label" for="customCheck${item.id}">&nbsp;</label>
                                            </div>
                                        </td>
                                        <td style="border-top: 1px solid #e3e6f0;">
                                            <img src="<c:url value="${item.productSupplier.image}"/>" alt="contact-img" title="contact-img" class="rounded me-3" height="48" />
                                            <p class="m-0 d-inline-block align-middle font-16">
                                                <a href="${editURL}" class="text-body">${item.productSupplier.name}</a>
                                                <br />
                                                <c:set var="rating" value="${item.rating}" />
                                                <c:choose>
                                                    <c:when test="${rating >= 9}">
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                    </c:when>
                                                    <c:when test="${rating >= 7.5}">
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                    </c:when>
                                                    <c:when test="${rating >= 5.9}">
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                    </c:when>
                                                    <c:when test="${rating >= 3.5}">
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                        <i class="fa fa-star" style="color: orange"></i>
                                                    </c:when>
                                                </c:choose>

                                            </p>
                                        </td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.productSupplier.category.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.productSupplier.brand.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.quantity}</td>
                                        <td style="border-top: 1px solid #e3e6f0;"><fmt:formatNumber type="currency" value="${item.price}" /></td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.discount}%</td>
                                        <td style="border-top: 1px solid #e3e6f0;" >
                                            <a href="${editURL}" class="action-icon"><i class="fas fa-edit" style="color: gray; margin-right: 10px"></i></a>
                                            <a href="" class="action-icon deleteItem" data-name="${item.productSupplier.name}" data-id="${item.id}"> <i class="fa fa-trash" style="color: gray"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Modal -->
        <div class="modal fade" id="detailsModal" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" style=" max-width: 60%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Product Supplier</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Product Supplier will be populated here -->
                        <div id="productSupplier"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.getElementById('addButton').addEventListener('click', function () {
                showDetails();
            });
            function showDetails() {
                $.ajax({
                    url: '${ProductURL}',
                    type: 'GET',
                    data: {
                        action: 'addProduct'
                    },
                    success: function (response) {
                        var details = '';
                        if (response.length === 0) {
                            details = 'There are no new supplier products added';
                        } else {
                            // Add column titles
                            details += '<div class="card-body">';
                            details += '<div class="d-flex justify-content-between">';
                            details += '<div class="d-flex flex-row align-items-center">';
                            details += '<div style="width: 100px; text-align: center"><strong>Image</strong></div>';
                            details += '<div class="ms-3" style="margin-left: 15px;"><strong>Name</strong></div>';
                            details += '</div>';
                            details += '<div class="d-flex flex-row align-items-center">';
                            details += '<div style="width: 120px;"><strong>Category</strong></div>';
                            details += '<div style="width: 120px; padding: 20px"><strong>Brand</strong></div>';
                            details += '<div style="width: 140px;"><strong>Quantity</strong></div>';
                            details += '<div style="width: 120px; padding: 20px"><strong>Price</strong></div>';
                            details += '<div style="width: 80px;"><strong>Action</strong></div>';
                            details += '</div>';
                            details += '</div>';
                            details += '</div>';

                            response.forEach(function (item) {
                                var addProductURL = '${pageContext.request.contextPath}/admin-product?type=edit&id_spnccSP=' + item.id;
                                details += '<div class="card mb-3">';
                                details += '<div class="card-body">';
                                details += '<div class="d-flex justify-content-between">';
                                details += '<div class="d-flex flex-row align-items-center">';
                                details += '<div>';
                                details += '<img src="' + item.image + '" class="img-fluid rounded-3" alt="Shopping item" style="width: 100px;">';
                                details += '</div>';
                                details += '<div class="ms-3" style="margin-left: 15px;">';
                                details += '<h5>' + item.name + '</h5>';
                                details += '<p class="small mb-0">' + item.origin + '</p>';
                                details += '</div>';
                                details += '</div>';
                                details += '<div class="d-flex flex-row align-items-center">';
                                details += '<div style="width: 120px;">';
                                details += '<h5 class="fw-normal mb-0">' + item.category.name + '</h5>';
                                details += '</div>';
                                details += '<div style="width: 120px;">';
                                details += '<h5 class="fw-normal mb-0">' + item.brand.name + '</h5>';
                                details += '</div>';
                                details += '<div style="width: 100px;">';
                                details += '<h5 class="fw-normal mb-0">' + item.quantity + '</h5>';
                                details += '</div>';
                                details += '<div style="width: 140px;">';
                                details += '<h5 class="fw-normal mb-0">' + new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(item.price) + '</h5>';
                                details += '</div>';
                                details += ' <a href="' + addProductURL + '" class="btn btn-success mb-2" style="margin-right: 15px"><i class="fa fa-plus-circle"></i> Add</a>';
                                details += '</div>';
                                details += '</div>';
                                details += '</div>';
                                details += '</div>';
                            });
                        }
                        
                        $('#productSupplier').html(details);
                        $('#detailsModal').modal('show');
                    }

                });
            }

            function closeModal() {
                $('#detailsModal').modal('hide');
            }

            document.addEventListener('DOMContentLoaded', function () {
                var checkAll = document.getElementById('checkAll');
                var checkboxes = document.querySelectorAll('.checkItem');
                var deleteButton = document.getElementById('deleteButton');
                var deleteIcons = document.querySelectorAll('.deleteItem');


                function toggleDeleteButton() {
                    var anyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
                    deleteButton.style.display = anyChecked ? 'inline-block' : 'none';
                }

                checkAll.addEventListener('change', function () {
                    checkboxes.forEach(function (checkbox) {
                        checkbox.checked = checkAll.checked;
                    });
                    toggleDeleteButton();

                });

                checkboxes.forEach(function (checkbox) {
                    checkbox.addEventListener('change', function () {
                        if (!this.checked) {
                            checkAll.checked = false;
                        } else if (Array.from(checkboxes).every(checkbox => checkbox.checked)) {
                            checkAll.checked = true;
                        }
                        toggleDeleteButton();
                    });
                });
                toggleDeleteButton();

                deleteButton.addEventListener('click', function (e) {
                    e.preventDefault();
                    var checkedValues = Array.from(checkboxes)
                            .filter(checkbox => checkbox.checked)
                            .map(checkbox => checkbox.value);

                    // Thực hiện hành động xóa với checkedValues
                    if (checkedValues.length > 0) {
                        if (confirm("Are you sure you want to remove items?")) {
                            deleteItems(checkedValues);
                        }
                    }
                });

                deleteIcons.forEach(function (icon) {
                    icon.addEventListener('click', function (e) {
                        e.preventDefault();
                        var itemId = this.getAttribute('data-id');
                        var itemName = this.getAttribute('data-name');
                        if (confirm("Are you sure you want to remove item '" + itemName + "' ?")) {
                            deleteItems([itemId]);
                        }
                    });
                });
            });


            function deleteItems(ids) {
                console.log('Deleting items with IDs:', ids);
                var data = {};
                data['ids'] = ids;
                $.ajax({
                    url: '${APIurl}',
                    type: 'DELETE',
                    data: JSON.stringify(data),
                    success: function (response) {
                        // Xử lý phản hồi thành công
                        alert("Items deleted successfully");
                        window.location.href = "${ProductURL}?type=list";
                    },
                    error: function (error) {
                        // Xử lý lỗi nếu có
                        console.error('Error (deleteItems):', error);
                    }
                });
            }
        </script>
    </body>
</html>
