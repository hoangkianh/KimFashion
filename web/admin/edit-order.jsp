<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Sửa hóa đơn | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/bootstrap-datetimepicker.min.css"/>
        <%@include file="../include/includeJS.jsp" %>
        <script src="resource/js/order.js"></script>
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
                            <li class="active">Sửa hóa đơn</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 col-md-12">
                                <p class="uppercase text-bold text-center">sửa hóa đơn số <bean:write name="HoaDonForm" property="maHD"/></p>
                                <html:form action="/SuaHD" method="POST" styleClass="form-horizontal">
                                    <html:hidden name="HoaDonForm" property="maHD"/>
                                    <html:hidden name="HoaDonForm" property="listChiTietHDString" styleId="listChiTietHDString"/>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="javascript:void(0);">
                                                            thông tin cơ bản
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <span class="text-bold uppercase">ngày lập:</span>
                                                                    <bean:write name="HoaDonForm" property="ngayLapHD"/>
                                                                </li>
                                                                <li>
                                                                    <span class="text-bold uppercase">ngày giao hàng:</span>
                                                                    <div class="input-group" id="datetimepicker1">
                                                                        <input type="text" class="form-control" name="ngayGiaoHang" id="ngayGiaoHang" 
                                                                               data-format="dd/MM/yyyy hh:mm:ss" value="<bean:write name="HoaDonForm" property="ngayGiaoHang"/>" />
                                                                        <span class="input-group-addon"><i data-time-icon="iconfont-time" data-date-icon="iconfont-calendar"></i></span>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <span class="text-bold uppercase">trạng thái:</span>
                                                                    <c:if test="${HoaDonForm.trangThai eq true}">
                                                                        Đã thanh toán <i class="text-success iconfont-check-sign"></i>
                                                                    </c:if>
                                                                    <c:if test="${HoaDonForm.trangThai eq false}">
                                                                        <br/>
                                                                        <input type="radio" name="trangThai" value="false" class="prettyCheckable" data-label="Chưa thanh toán" checked="checked" />
                                                                        <input type="radio" name="trangThai" value="true" class="prettyCheckable" data-label="Đã thanh toán" />
                                                                    </c:if>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="javascript:void(0);">
                                                            thông tin người mua
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <span class="text-bold uppercase">họ tên: </span>
                                                                    <bean:write name="HoaDonForm" property="hoTenNguoiMua"/>
                                                                </li>
                                                                <li>
                                                                    <span class="text-bold uppercase">email: </span>
                                                                    <bean:write name="HoaDonForm" property="emailNguoiMua"/>
                                                                </li>
                                                                <li>
                                                                    <span class="text-bold uppercase">SĐT: </span>
                                                                    <bean:write name="HoaDonForm" property="sdtNguoiMua"/>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="javascript:void(0);">
                                                            thông tin người nhận
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <div class="form-group stylish-input">
                                                                        <label class="col-sm-4 control-label" for="hoTenNguoiNhan">Họ tên:</label>
                                                                        <div class="col-lg-7">
                                                                            <input type="text" name="hoTenNguoiNhan" class="form-control" 
                                                                                   id="tenDangNhap" placeholder="Họ tên người nhận"
                                                                                   value="<bean:write name="HoaDonForm" property="hoTenNguoiNhan"/>"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="form-group stylish-input">
                                                                        <label class="col-sm-4 control-label" for="sdtNguoiNhan">SĐT:</label>
                                                                        <div class="col-lg-7">
                                                                            <input type="text" name="sdtNguoiNhan" class="form-control" 
                                                                                   id="tenDangNhap" placeholder="SDT người nhận"
                                                                                   value="<bean:write name="HoaDonForm" property="sdtNguoiNhan"/>"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="form-group stylish-input">
                                                                        <label class="col-sm-4 control-label" for="diaChiGiaoHang">Địa chỉ giao hàng:</label>
                                                                        <div class="col-lg-7">
                                                                            <input type="text" name="diaChiGiaoHang" class="form-control" 
                                                                                   id="tenDangNhap" placeholder="Địa chỉ giao hàng"
                                                                                   value="<bean:write name="HoaDonForm" property="diaChiGiaoHang"/>"/>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-12 col-sm-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="javascript:void(0);">
                                                            chi tiết hóa đơn
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                                            <table id="myTable" class="tbl-order table table-striped table-bordered table-hover table-condensed">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Code</th>
                                                                        <th>Tên sản phẩm</th>
                                                                        <th>Hình ảnh</th>
                                                                        <th>Size</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Đơn giá</th>
                                                                        <th class="text-center">Thành tiền</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <logic:iterate id="chiTietHD" name="HoaDonForm" property="listChiTietHD">
                                                                        <tr data-product-id="<bean:write name="chiTietHD" property="maSP"/>" 
                                                                            data-size="<bean:write name="chiTietHD" property="maSize"/>">
                                                                            <td>
                                                                                <a href="details-product.do?id=<bean:write name="chiTietHD" property="sanPham.maSP" />"
                                                                                   class="accent-color" rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem chi tiết">
                                                                                    <bean:write name="chiTietHD" property="sanPham.code" />
                                                                                </a>
                                                                            </td>
                                                                            <td><bean:write name="chiTietHD" property="sanPham.tenSP" /></td>
                                                                            <td align="center">
                                                                                <a href="<bean:write name="chiTietHD" property="sanPham.hinhAnh"/>" data-toggle="lightbox">
                                                                                    <img width="50" src="<bean:write name="chiTietHD" property="sanPham.hinhAnh"/>"/>
                                                                                </a>
                                                                            </td>
                                                                            <td>
                                                                                <bean:write name="chiTietHD" property="tenSize" />
                                                                            </td>
                                                                            <td>
                                                                                <c:if test="${HoaDonForm.trangThai eq true}">
                                                                                    <bean:write name="chiTietHD" property="soLuong"/>
                                                                                </c:if>
                                                                                <c:if test="${HoaDonForm.trangThai eq false}">
                                                                                    <div class="qty-btn-group-order">
                                                                                        <button type="button" class="down"><i class="iconfont-caret-down inline-middle"></i></button>
                                                                                        <input type="text" value="<bean:write name="chiTietHD" property="soLuong" />" name="soLuong" />
                                                                                        <button type="button" class="up"><i class="iconfont-caret-up inline-middle"></i></button>
                                                                                    </div>
                                                                                </c:if>
                                                                            </td>
                                                                            <td><span class="unit-price"><fmt:formatNumber value="${chiTietHD.donGia}" type="NUMBER" maxFractionDigits="3" /> VND</span></td>
                                                                            <td align="center"><span class="row-total"><fmt:formatNumber value="${chiTietHD.thanhTien}" type="NUMBER" maxFractionDigits="3" /> VND</span></td>
                                                                        </tr>
                                                                    </logic:iterate>
                                                                    <tr class="info text-bold uppercase">
                                                                        <td align="right" colspan="6">tổng</td>
                                                                        <td align="center">
                                                                            <span class="all-row-total"><fmt:formatNumber value="${HoaDonForm.tongTien}" type="NUMBER" maxFractionDigits="3" /> VND</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="info text-bold uppercase">
                                                                        <td align="right" colspan="6">phí vận chuyển</td>
                                                                        <td align="center">
                                                                            <span class="ship-fee"><fmt:formatNumber value="${HoaDonForm.phiVanChuyen}" type="NUMBER" maxFractionDigits="3" /> VND</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="info text-bold uppercase">
                                                                        <td align="right" colspan="6">tổng cộng</td>
                                                                        <td align="center">
                                                                            <span class="order-total"><fmt:formatNumber value="${HoaDonForm.tongTien + HoaDonForm.phiVanChuyen}" type="NUMBER" maxFractionDigits="3" /> VND</span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-md-12 col-sm-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a href="javascript:void(0);">
                                                            thông tin khác
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <span class="text-bold uppercase">ghi chú:</span>
                                                                    <bean:write name="HoaDonForm" property="ghiChu"/>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${HoaDonForm.trangThai eq false}">
                                        <div class="row">
                                            <div class="col-xs-12 col-md-12 col-sm-12">
                                                <div class="pull-right">
                                                    <input type="submit" class="btn btn-primary btn-round" value="Cập nhật hóa đơn" />
                                                    <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </html:form>
                            </section>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript">
            $('#datetimepicker1').datetimepicker({
                language: 'vi-VN',
                pickTime: false
            });
        </script>
    </body>
</html>
