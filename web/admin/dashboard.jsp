<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>
    </c:when>
    <c:otherwise>
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>
    </c:otherwise>
</c:choose>
<!-- nếu không phải admin redirect sang trang chủ -->
<c:if test="${s[2] ne true}">
    <c:redirect url="/"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Trang quản trị | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body>
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li class="active">Trang quản trị</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">

                        <section class="section">

                            <!-- SIDEBAR -->
                            <!-- SIDEBAR -->
                            <aside class="col-xs-12 col-sm-4 col-md-3">
                                <section class="side-section">
                                    <ul class="nav nav-tabs nav-stacked">
                                        <li><a href="products.do">Danh mục sản phẩm</a></li>															
                                        <li><a href="https://facebook.com/pages/KimFashion"><i class="iconfont-facebook-sign"></i> Facebook của chúng tôi</a></li>
                                        <li><a href="about.do">Giới thiệu cửa hàng</a></li>														
                                        <li><a href="contact.do">Liên hệ</a></li>															
                                    </ul>
                                </section>
                            </aside>

                            <div class="clearfix"></div>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <script src="resource/js/contact.js"></script>
        <script src="resource/js/gmap3.min.js"></script>
    </body>
</html>
