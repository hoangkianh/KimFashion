<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
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
        <title>Trang quản trị | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/morris.css"/>
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
                            <section class="col-xs-12 col-sm-12 col-md-12">
                                <div class="row">
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <a href="admin-product.do" class="tile-button btn bg-blue">
                                            <div class="tile-content-wrapper">
                                                <i class="iconfont-qrcode"></i>                                                
                                                <div class="tile-content">
                                                    <bean:write name="ThongKeForm" property="soSP"/> <small>sản phẩm</small>
                                                </div>
                                            </div>
                                            <div class="tile-footer">
                                                xem danh sách
                                                <i class="iconfont-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <a href="all-order.do" class="tile-button btn bg-orange">
                                            <div class="tile-content-wrapper">
                                                <i class="iconfont-shopping-cart"></i>                                                
                                                <div class="tile-content">
                                                    <bean:write name="ThongKeForm" property="soHD"/> <small>hóa đơn</small>
                                                </div>
                                            </div>
                                            <div class="tile-footer">
                                                xem danh sách
                                                <i class="iconfont-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <a href="admin-brand.do" class="tile-button btn bg-green">
                                            <div class="tile-content-wrapper">
                                                <i class="iconfont-bullhorn"></i>                                                
                                                <div class="tile-content">
                                                    <bean:write name="ThongKeForm" property="soThuongHieu"/> <small>thương hiệu</small>
                                                </div>
                                            </div>
                                            <div class="tile-footer">
                                                xem danh sách
                                                <i class="iconfont-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <a href="all-thanhvien.do" class="tile-button btn bg-red">
                                            <div class="tile-content-wrapper">
                                                <i class="iconfont-user"></i>                                                
                                                <div class="tile-content">
                                                    <bean:write name="ThongKeForm" property="soThanhVien"/> <small>thành viên</small>
                                                </div>
                                            </div>
                                            <div class="tile-footer">
                                                xem danh sách
                                                <i class="iconfont-arrow-right"></i>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5 class="uppercase text-center chart-title">Doanh thu theo tháng</h5>
                                        <div class="content-box">
                                            <div id="doanhThu"></div>
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
        <script type="text/javascript" src="resource/js/morris.min.js"></script>
        <script type="text/javascript" src="resource/js/raphael.min.js"></script>
        <script type="text/javascript">
            var year = new Date().getFullYear();
            Morris.Line({
                element: 'doanhThu',
                data: [
            <logic:iterate id="dt" indexId="i" name="ThongKeForm" property="doanhThu">
                    {y: year + '-' + '${i+1}', a: ${dt}},
            </logic:iterate>
                ],
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Doanh thu'],
                yLabelFormat: function (y) {return y.toString() + ' VND';}
            });
        </script>
    </body>
</html>
