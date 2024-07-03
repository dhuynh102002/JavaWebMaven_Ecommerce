<%-- 
    Document   : list
    Created on : Jun 29, 2024, 10:52:58 AM
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
        <title>Table Product Supplier</title>
    </head>
    <body>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Product Supplier</h1>
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
                            <a href="<c:url value="/admin-product-supplier?type=edit"/>" class="btn btn-success mb-2" style="margin-right: 15px"><i class="fa fa-plus-circle"></i> Add Products</a>
                            <a href="" id="deleteButton" class="btn btn-danger mb-2" style="margin-right: 15px"><i class="fa fa-trash"></i> Delete</a>

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
                                    <th style="border-top: 1px solid #e3e6f0;">Origin</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Category</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Brand</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Quantity</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Price</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Updated At</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Action</th>
                                </tr>
                            </thead>

                            <tbody style="border-bottom: 1px solid #e3e6f0; ">
                                <c:forEach items="${productSupplierModel.listResult}" var="item" >
                                    <c:url var="editURL" value="/admin-product-supplier">
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
                                            <img src="<c:url value="${item.image}"/>" alt="contact-img" title="contact-img" class="rounded me-3" height="48" />
                                            <p class="m-0 d-inline-block align-middle font-16">
                                                <a href="${editURL}" class="text-body">${item.name}</a>
                                            </p>
                                        </td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.origin}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.category.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.brand.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.quantity}</td>
                                        <td style="border-top: 1px solid #e3e6f0;"><fmt:formatNumber type="currency" value="${item.price}" /></td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.updatedAt}</td>
                                        <td style="border-top: 1px solid #e3e6f0;" >
                                            <a href="${editURL}" class="action-icon"><i class="fas fa-edit" style="color: gray; margin-right: 10px"></i></a>
                                            <a href="" class="action-icon deleteItem" data-name="${item.name}" data-id="${item.id}"> <i class="fa fa-trash" style="color: gray"></i></a>
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
         
        <script >
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
                        window.location.href = "${ProductSupplierURL}?type=list";
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
