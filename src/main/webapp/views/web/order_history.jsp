<%-- 
    Document   : OrderHistory
    Created on : Jun 18, 2024, 8:51:21 PM
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
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Tables</h1>
            <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                For more information about DataTables, please visit the <a target="_blank"
                                                                           href="https://datatables.net">official DataTables documentation</a>.</p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="h3 m-0 font-weight-bold text-primary">DataTables Order History</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0" style="border-bottom: 1px solid #e3e6f0; border-left: 1px solid #e3e6f0;">
                            <thead>
                                <tr >
                                    <th style="border-top: 1px solid #e3e6f0;">No</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Name</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Phone</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Address</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Date</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Status</th>
                                    <th style="border-top: 1px solid #e3e6f0;">Action</th>
                                </tr>
                            </thead>

                            <tbody style="border-bottom: 1px solid #e3e6f0; ">
                                <c:forEach items="${orderModel.listResult}" var="item" >
                                    <tr style="border-bottom: 1px solid #e3e6f0;">
                                        <td style="border-top: 1px solid #e3e6f0;">#${item.id}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${userModel.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.phone}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.address}</td>
                                        <td style="border-top: 1px solid #e3e6f0;">${item.createdAt}</td>
                                        <td style="border-top: 1px solid #e3e6f0; color: red">${item.status.name}</td>
                                        <td style="border-top: 1px solid #e3e6f0;"><i class="bi bi-list text-primary" title="Click here to see details" onclick="showDetails(${item.id})" style="cursor: pointer;"></i></td>
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
            <div class="modal-dialog" style=" max-width: 50%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Order Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Order details will be populated here -->
                        <div id="orderDetails"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function showDetails(orderId) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/order-history',
                    type: 'GET',
                    data: {
                        action: 'details',
                        orderId: orderId
                    },
                    success: function (response) {
                        var details = '';

                        // Add column titles
                        details += '<div class="card-body">';
                        details += '<div class="d-flex justify-content-between">';
                        details += '<div class="d-flex flex-row align-items-center">';
                        details += '<div style="width: 120px; text-align: center"><strong>Image</strong></div>';
                        details += '<div class="ms-3"><strong>Name</strong></div>';
                        details += '</div>';
                        details += '<div class="d-flex flex-row align-items-center">';
                        details += '<div style="width: 80px;"><strong>Quantity</strong></div>';
                        details += '<div style="width: 150px; padding: 20px"><strong>Price</strong></div>';
                        details += '<div style="width: 150px;"><strong>Total</strong></div>';
                        details += '</div>';
                        details += '</div>';
                        details += '</div>';

                        response.forEach(function (item) {
                            details += '<div class="card mb-3">';
                            details += '<div class="card-body">';
                            details += '<div class="d-flex justify-content-between">';
                            details += '<div class="d-flex flex-row align-items-center">';
                            details += '<div>';
                            details += '<img src="' + item.product.imageSP + '" class="img-fluid rounded-3" alt="Shopping item" style="width: 100px;">';
                            details += '</div>';
                            details += '<div class="ms-3">';
                            details += '<h5>' + item.product.nameSP + '</h5>';
                            details += '<p class="small mb-0">' + item.product.originSP + '</p>';
                            details += '</div>';
                            details += '</div>';
                            details += '<div class="d-flex flex-row align-items-center">';
                            details += '<div style="width: 80px;">';
                            details += '<h5 class="fw-normal mb-0">' + item.quantity + '</h5>';
                            details += '</div>';
                            details += '<div style="width: 150px;">';
                            details += '<h5 class="fw-normal mb-0">' + new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(item.price) + '</h5>';
                            details += '</div>';
                            details += '<h5 class="mb-0">' + new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(item.price * item.quantity) + '</h5>';
                            details += '</div>';
                            details += '</div>';
                            details += '</div>';
                            details += '</div>';
                        });
                        console.log(details);
                        $('#orderDetails').html(details);
                        $('#detailsModal').modal('show');
                    }

                });
            }

            function closeModal() {
                $('#detailsModal').modal('hide');
            }
        </script>
    </body>
</html>
