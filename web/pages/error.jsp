<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty param.e}">
    <c:redirect url="/"/>
</c:if>
<c:set var="e" value="${param.e}"/>
<c:if test="${e eq 1}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Đường dẫn mà bạn đang tìm kiếm không tồn tại hoặc bạn không có quyền truy cập."/>
</c:if>
<c:if test="${e eq 2}">
    <c:set var="tenLoi" value="Đăng ký không thành công"/>
    <c:set var="moTa" value="Đã có lỗi xảy ra trong quá trình đăng ký, bạn hãy <a href='register.do'>thử lại</a>"/>
</c:if>
<c:if test="${e eq 3}">
    <c:set var="tenLoi" value="Đăng ký không thành công"/>
    <c:set var="moTa" value="Chúng tôi không thể gửi mail vào địa chỉ email của bạn.
           Bạn có thể <a href='register.do'>đăng ký</a> lại."/>
</c:if>
<c:if test="${e eq 4}">
    <c:set var="tenLoi" value="Xác nhận không thành công"/>
    <c:set var="moTa" value="Địa chỉ email hoặc mã xác nhận không chính xác. 
           Bạn có thể yêu cầu gửi lại mail xác nhận <a href='reconfirm.do'>tại đây</a>"/>
</c:if>
<c:if test="${e eq 5}">
    <c:set var="tenLoi" value="Gửi mail không thành công"/>
    <c:set var="moTa" value="Chúng tôi không thể gửi mail vào địa chỉ email của bạn."/>
</c:if>
<c:if test="${e eq 6}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Đã có lỗi xảy ra trong quá trình thanh toán.
           Rất xin lỗi bạn vì sự cố này."/>
</c:if>
<c:if test="${e eq 7}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Bạn không có quyền truy cập trang này."/>
</c:if>
<c:if test="${e eq 8}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Cập nhật thông tin không thành công, bạn hãy thử lại"/>
</c:if>
<c:if test="${e eq 9}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Mật khẩu không đúng, bạn hãy nhập lại"/>
</c:if>
<c:if test="${e eq 10}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Cập nhật mật khẩu không thành công, bạn hãy thử lại"/>
</c:if>
<c:if test="${e eq 12}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Cập nhật không thành công, bạn hãy thử lại"/>
</c:if>
<c:if test="${e eq 13}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Thêm mới sản phẩm không thành công, bạn hãy thử lại"/>
</c:if>
<c:if test="${e eq 14}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Thêm mới hình ảnh không thành công, bạn hãy thử lại"/>
</c:if>
<c:if test="${e eq 15}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Sản phẩm bạn đang tìm kiếm không có.
           Bạn hãy thử <a href='/'>tìm kiếm</a> lại."/>
</c:if>
<c:if test="${e eq 16}">
    <c:set var="tenLoi" value="Opps! Đã có lỗi xảy ra"/>
    <c:set var="moTa" value="Thêm mới loại sản phẩm không thành công, bạn hãy thử lại"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Lỗi | KimFashion - Cửa hàng thời trang online</title>
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
                    <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>        
                </c:if>
                <c:if test="${not empty cookie.kimfashion}">
                    <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
                </c:if>
            </c:if>
            <c:if test="${s[2] eq true}">
                <%@include file="../include/header-admin.jsp" %>
            </c:if>
            <c:if test="${s[2] eq false}">
                <%@include file="../include/header.jsp" %>
            </c:if>
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 text-center text-danger">
                                <h1 class="text-bold"><i class='iconfont-frown'></i> <c:out value="${tenLoi}"/> </h1>
                                <h4><c:out value="${moTa}" escapeXml="false" /></h4>
                                <c:if test="${s[2] eq false}">
                                    <h3><small>Bạn có thể <a href="mailto:kimfashion@gmail.com">liên hệ</a> với KimFashion để được giải đáp</small></h3>
                                    <div id="sub-social">
                                        <ul class="social-list unstyled">
                                            <li><a href="https://www.facebook.com/pages/Kim-Fashion/1402400103359807"><i class="iconfont-facebook round-icon"></i></a></li>
                                            <li><a href="https://twitter.com/kimhue1012"><i class="iconfont-twitter round-icon"></i></a></li>
                                            <li><a href="https://plus.google.com/u/0/108003680879148344644"><i class="iconfont-google-plus-sign round-icon"></i></a></li>
                                        </ul>
                                    </div>
                                </c:if>
                            </section>
                            <c:if test="${s[2] eq false}">
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
