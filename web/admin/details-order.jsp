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
        <title>Chi tiết hóa đơn | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/jquery.dataTables.css"/>
        <%@include file="../include/includeJS.jsp" %>
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
                            <li class="active">Chi tiết hóa đơn</li>
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
                                <p class="uppercase text-bold text-center">chi tiết hóa đơn số <bean:write name="HoaDonForm" property="maHD"/></p>
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
                                                                <bean:write name="HoaDonForm" property="ngayGiaoHang"/>
                                                            </li>
                                                            <li>
                                                                <span class="text-bold uppercase">trạng thái:</span>
                                                                <c:if test="${HoaDonForm.trangThai eq true}">
                                                                    Đã thanh toán <i class="text-success iconfont-check-sign"></i>
                                                                </c:if>
                                                                <c:if test="${HoaDonForm.trangThai eq false}">
                                                                    Chưa thanh toán <br/>
                                                                    <a class="accent-color" href="edit-order.do?id=<bean:write name="HoaDonForm" property="maHD"/>">
                                                                        <i class="iconfont-edit"></i>
                                                                        Cập nhật trạng thái
                                                                    </a>
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
                                                                <span class="text-bold uppercase">họ tên:</span>
                                                                <bean:write name="HoaDonForm" property="hoTenNguoiMua"/>
                                                            </li>
                                                            <li>
                                                                <span class="text-bold uppercase">email:</span>
                                                                <bean:write name="HoaDonForm" property="emailNguoiMua"/>
                                                            </li>
                                                            <li>
                                                                <span class="text-bold uppercase">sdt:</span>
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
                                                                <span class="text-bold uppercase">họ tên:</span>
                                                                <bean:write name="HoaDonForm" property="hoTenNguoiNhan"/>
                                                            </li>
                                                            <li>
                                                                <span class="text-bold uppercase">sdt:</span>
                                                                <bean:write name="HoaDonForm" property="sdtNguoiNhan"/>
                                                            </li>
                                                            <li>
                                                                <span class="text-bold uppercase">địa chỉ:</span>
                                                                <bean:write name="HoaDonForm" property="diaChiGiaoHang"/>
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
                                                        <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
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
                                                                    <tr>
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
                                                                        <td><bean:write name="chiTietHD" property="tenSize" /></td>
                                                                        <td><bean:write name="chiTietHD" property="soLuong" /></td>
                                                                        <td><fmt:formatNumber value="${chiTietHD.donGia}" type="NUMBER" maxFractionDigits="3" /> VND</td>
                                                                        <td align="center"><fmt:formatNumber value="${chiTietHD.thanhTien}" type="NUMBER" maxFractionDigits="3" /> VND</td>
                                                                    </tr>
                                                                </logic:iterate>
                                                                <tr class="info text-bold uppercase">
                                                                    <td align="right" colspan="6"><span>tổng</span></td>
                                                                    <td align="center">
                                                                        <fmt:formatNumber value="${HoaDonForm.tongTien}" type="NUMBER" maxFractionDigits="3" /> VND                                                                        
                                                                    </td>
                                                                </tr>
                                                                <tr class="info text-bold uppercase">
                                                                    <td align="right" colspan="6"><span>phí vận chuyển</span></td>
                                                                    <td align="center">
                                                                        <fmt:formatNumber value="${HoaDonForm.phiVanChuyen}" type="NUMBER" maxFractionDigits="3" /> VND
                                                                    </td>
                                                                </tr>
                                                                <tr class="info text-bold uppercase">
                                                                    <td align="right" colspan="6"><span>tổng cộng</span></td>
                                                                    <td align="center">
                                                                        <fmt:formatNumber value="${HoaDonForm.tongTien + HoaDonForm.phiVanChuyen}" type="NUMBER" maxFractionDigits="3" /> VND
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
                            </section>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
    </body>
</html>
