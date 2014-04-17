<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<!-- nếu chưa đăng nhập -->
<c:if test="${empty sessionScope.kimfashion and empty cookie.kimfashion}">
    <c:redirect url="/login.do" />
</c:if>
<c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
    <c:if test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>        
    </c:if>
    <c:if test="${not empty cookie.kimfashion}">
        <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
    </c:if>
    <c:if test="${s[2] ne true}">
        <c:redirect url="/" />
    </c:if>
</c:if>
<!-- nếu không phải admin redirect sang trang chủ -->
<c:if test="${s[2] ne true}">
    <c:redirect url="/"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Tất cả hóa đơn | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/jquery.dataTables.css"/>
        <%@include file="../include/includeJS.jsp" %>
        <script src="resource/js/jquery.dataTables.min.js"></script>
        <script src="resource/js/jquery.dataTables.extend.js"></script>
    </head>
    <body>
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header-admin.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li><a href="admin.do">Trang quản trị</a></li>
                            <li><a href="all-order.do">Hóa đơn</a></li>
                            <li class="active">Hóa đơn chưa thanh toán</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="delete-confirm" class="modal fade">
                <div class="modal-dialog">
                    <html:form styleId="deleteForm" method="POST" action="/DeleteHD">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3>Xóa hóa đơn</h3>                    
                            </div>
                            <div class="modal-body">
                                <html:hidden styleId="maHD" name="HoaDonForm" property="maHD"/>
                                <p>Bạn có muốn xóa hóa đơn này không?</p>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary btn-round" value="Xóa hóa đơn" />
                                    <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                </div>
                            </div>
                        </div>
                    </html:form>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 col-md-12">
                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold"><h3>tất cả hóa đơn chưa thanh toán</h3></caption>
                                    <thead>
                                        <tr>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th>Mã HD</th>
                                            <th>Ngày lập</th>
                                            <th>Ngày giao hàng</th>
                                            <th>Người nhận</th>
                                            <th>SDT người nhận</th>
                                            <th>Địa chỉ giao hàng</th>
                                            <th class="sorting_disabled">Đã thanh toán</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate name="HoaDonForm" id="hd" property="listHoaDon">
                                            <c:if test="${hd.trangThai eq true}">
                                                <tr class="success">
                                                    <td></td>
                                                </c:if>
                                                <c:if test="${hd.trangThai eq false}">
                                                <tr>
                                                    <td align="center">
                                                        <a href="edit-order.do?id=<bean:write name="hd" property="maHD"/>"
                                                           rel="tooltip" data-toggle="tooltip" data-placement="top" title="Sửa hóa đơn">
                                                            <i class="iconfont-edit"></i>
                                                        </a>
                                                    </td>
                                                </c:if>
                                                <td align="center">
                                                    <a href="details-order.do?id=<bean:write name="hd" property="maHD"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem chi tiết">
                                                        <i class="iconfont-eye-open"></i>
                                                    </a>
                                                </td>
                                                <td align="center">
                                                    <a href="#delete-confirm" class="delete"
                                                       id="<bean:write name="hd" property="maHD"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xóa">
                                                        <i class="iconfont-trash text-danger"></i>
                                                    </a>
                                                </td>
                                                <td align="center"><bean:write name="hd" property="maHD" /></td>
                                                <td><bean:write name="hd" property="ngayLapHD" /></td>
                                                <td><bean:write name="hd" property="ngayGiaoHang" /></td>
                                                <td><bean:write name="hd" property="hoTenNguoiNhan" /></td>
                                                <td><bean:write name="hd" property="sdtNguoiNhan" /></td>
                                                <td><bean:write name="hd" property="diaChiGiaoHang" /></td>
                                                <td align="center">
                                                    <c:if test="${hd.trangThai eq true}">
                                                        <i class="iconfont-check-sign text-success"
                                                           rel="tooltip" data-toggle="tooltip" data-placement="top" title="Đã thanh toán"></i>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </logic:iterate>
                                    </tbody>
                                </table>
                            </section>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %><script type="text/javascript">
            $('[rel=tooltip]').tooltip();
            $('#myTable').dataTable({
                "aaSorting": [[3, 'asc']] // sort theo mã HD
            });

            $("a.delete").click(function() {
                $('#delete-confirm').modal();

                var maHD = $(this).attr('id');
                $("#maHD").val(maHD);
                return false;
            });
        </script>
    </body>
</html>
