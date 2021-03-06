<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty param.s}">
    <c:redirect url="/"/>
</c:if>
<c:set var="s" value="${param.s}"/>
<c:if test="${s eq 1}">
    <c:set var="thongBao" value="Đăng ký thành công"/>
    <c:set var="moTa" value="Chúng tôi đã gửi 1 email vào hòm mail của bạn.
           Hãy làm theo hướng dẫn trong đó để xác nhận tài khoản"/>
</c:if>
<c:if test="${s eq 2}">
    <c:set var="thongBao" value="Xác nhận thành công"/>
    <c:set var="moTa" value="Chào mừng bạn đến với Kimfashion ! Chúc bạn có những giây phút mua sắm vui vẻ với Kimfashion <i class='iconfont-smile'></i>"/>
</c:if>
<c:if test="${s eq 3}">
    <c:set var="thongBao" value="Gửi email thành công"/>
    <c:set var="moTa" value="Chúng tôi đã gửi 1 email vào hòm mail của bạn.
           Hãy làm theo hướng dẫn trong đó để xác nhận tài khoản"/>
</c:if>
<c:if test="${s eq 4}">
    <c:set var="thongBao" value="Gửi email thành công"/>
    <c:set var="moTa" value="Chúng tôi đã gửi 1 mật khẩu mới vào email của bạn.
           Hãy sử dụng mật khẩu đó để đăng nhập"/>
</c:if>
<c:if test="${s eq 5}">
    <c:set var="thongBao" value="Gửi đơn hàng thành công"/>
    <c:set var="moTa" value="Cám ơn bạn đã mua hàng, chúng tôi sẽ liên lạc với bạn trong vòng 48h tới"/>
</c:if>
<c:if test="${s eq 6}">
    <c:set var="thongBao" value="Cập nhật thông tin thành công"/>
    <c:set var="moTa" value="Thông tin của bạn đã được cập nhật."/>
</c:if>
<c:if test="${s eq 7}">
    <c:set var="thongBao" value="Cập nhật mật khẩu thành công"/>
    <c:set var="moTa" value="Bạn có thể đăng nhập bằng mật khẩu mới."/>
</c:if>
<c:if test="${s eq 9}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Sản phẩm đã được cập nhật thành công. <br/> <a href='admin-product.do'>Quay lại danh sách sản phẩm</a>"/>
</c:if>
<c:if test="${s eq 10}">
    <c:set var="thongBao" value="Thêm sản phẩm thành công!"/>
    <c:set var="moTa" value="Sản phẩm đã được thêm thành công. <br/> <a href='admin-product.do'>Quay lại danh sách sản phẩm</a>"/>
</c:if>
<c:if test="${s eq 11}">
    <c:set var="thongBao" value="Thêm loại sản phẩm thành công!"/>
    <c:set var="moTa" value="Loại sản phẩm đã được thêm thành công. <br/> <a href='admin-category.do'>Quay lại danh sách loại sản phẩm</a>"/>
</c:if>
<c:if test="${s eq 12}">
    <c:set var="thongBao" value="Thêm bộ sưu tập thành công!"/>
    <c:set var="moTa" value="Bộ sưu tập đã được thêm thành công. <br/> <a href='admin-collection.do'>Quay lại danh sách bộ sưu tập</a>"/>
</c:if>
<c:if test="${s eq 13}">
    <c:set var="thongBao" value="Thêm thương hiệu thành công!"/>
    <c:set var="moTa" value="Thương hiệu đã được thêm thành công. <br/> <a href='admin-brand.do'>Quay lại danh sách thương hiệu</a>"/>
</c:if>
<c:if test="${s eq 14}">
    <c:set var="thongBao" value="Thêm size thành công!"/>
    <c:set var="moTa" value="Size đã được thêm thành công. <br/> <a href='admin-size.do'>Quay lại danh sách size</a>"/>
</c:if>
<c:if test="${s eq 15}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Loại sản phẩm đã được cập nhật thành công. <br/> <a href='admin-category.do'>Quay lại danh sách loại sản phẩm</a>"/>
</c:if>
<c:if test="${s eq 16}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Thương hiệu đã được cập nhật thành công. <br/> <a href='admin-brand.do'>Quay lại danh sách thương hiệu</a>"/>
</c:if>
<c:if test="${s eq 17}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Size đã được cập nhật thành công. <br/> <a href='admin-size.do'>Quay lại danh sách size</a>"/>
</c:if>
<c:if test="${s eq 18}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Hóa đơn đã được cập nhật thành công. <br/> <a href='all-order.do'>Quay lại danh sách hóa đơn</a>"/>
</c:if>
<c:if test="${s eq 19}">
    <c:set var="thongBao" value="Cập nhật thành công!"/>
    <c:set var="moTa" value="Bộ sưu tập đã được cập nhật thành công. <br/> <a href='admin-collection.do'>Quay lại danh sách bộ sưu tập</a>"/>
</c:if>
<c:if test="${s eq 20}">
    <c:set var="thongBao" value="Xóa hóa đơn thành công!"/>
    <c:set var="moTa" value="Hóa đơn đã được xóa thành công. <br/> <a href='all-order.do'>Quay lại danh sách hóa đơn</a>"/>
</c:if>
<c:if test="${s eq 21}">
    <c:set var="thongBao" value="Xóa sản phẩm thành công!"/>
    <c:set var="moTa" value="Sản phẩm đã được xóa thành công. <br/> <a href='admin-product.do'>Quay lại danh sách sản phẩm</a>"/>
</c:if>
<c:if test="${s eq 22}">
    <c:set var="thongBao" value="Hủy quyền admin thành công"/>
    <c:set var="moTa" value="<a href='all-thanhvien.do'>Quay lại danh sách thành viên</a>"/>
</c:if>
<c:if test="${s eq 23}">
    <c:set var="thongBao" value="Tạo admin mới thành công"/>
    <c:set var="moTa" value="<a href='all-thanhvien.do'>Quay lại danh sách thành viên</a>"/>
</c:if>
<c:if test="${s eq 24}">
    <c:set var="thongBao" value="Xóa size thành công!"/>
    <c:set var="moTa" value="Size đã được xóa thành công. <br/> <a href='admin-size.do'>Quay lại danh sách size</a>"/>
</c:if>
<c:if test="${s eq 25}">
    <c:set var="thongBao" value="Xóa thương hiệu thành công!"/>
    <c:set var="moTa" value="Thương hiệu đã được xóa thành công. <br/> <a href='admin-brand.do'>Quay lại danh sách thương hiệu</a>"/>
</c:if>
<c:if test="${s eq 26}">
    <c:set var="thongBao" value="Xóa bộ sưu tập thành công!"/>
    <c:set var="moTa" value="Bộ sưu tập đã được xóa thành công. <br/> <a href='admin-collection.do'>Quay lại danh sách bộ sưu tập</a>"/>
</c:if>
<c:if test="${s eq 27}">
    <c:set var="thongBao" value="Xóa loại sản phẩm thành công!"/>
    <c:set var="moTa" value="Loại sản phẩm đã được xóa thành công. <br/> <a href='admin-category.do'>Quay lại danh sách loại sản phẩm</a>"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Thành công | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body>
        <!-- PAGE -->
        <div id="page-wrapper">
            <c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
                <c:if test="${not empty sessionScope.kimfashion}">
                    <c:set var="str" value="${fn:split(sessionScope.kimfashion, '~')}"/>        
                </c:if>
                <c:if test="${not empty cookie.kimfashion}">
                    <c:set var="str" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
                </c:if>
            </c:if>
            <c:if test="${str[2] eq true}">
                <%@include file="../include/header-admin.jsp" %>
            </c:if>
            <c:if test="${str[2] eq false}">
                <%@include file="../include/header.jsp" %>
            </c:if>
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 text-center text-success">
                                <h1 class="text-bold"><i class="iconfont-check"></i> <c:out value="${thongBao}"/></h1>
                                <h4><c:out value="${moTa}" escapeXml="false" /></h4>
                                <c:if test="${str[2] eq false}">
                                    <h3><small>Bạn có thể <a href="mailto:kimfashion@gmail.com">liên hệ</a> với KimFashion nếu có thắc mắc</small></h3>
                                    <div id="sub-social">
                                        <ul class="social-list unstyled">
                                            <li><a href="https://www.facebook.com/pages/Kim-Fashion/1402400103359807"><i class="iconfont-facebook round-icon"></i></a></li>
                                            <li><a href="https://twitter.com/kimhue1012"><i class="iconfont-twitter round-icon"></i></a></li>
                                            <li><a href="https://plus.google.com/u/0/108003680879148344644"><i class="iconfont-google-plus-sign round-icon"></i></a></li>
                                        </ul>
                                    </div>
                                </c:if>
                            </section>
                            <c:if test="${str[2] eq false}">
                                <section class="section">
                                    <section class="col-xs-12 col-sm-12">
                                        <div id="gmap" class="gmap"></div>
                                    </section>
                                </section>
                            </c:if>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <script src="resource/js/gmap3.min.js"></script>
    </body>
</html>
