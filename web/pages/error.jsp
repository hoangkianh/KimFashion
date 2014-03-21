<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <%@include file="../include/header.jsp" %>
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 text-center text-danger">
                                <h1 class="text-bold"><i class="iconfont-frown"></i> Opps! Đã có lỗi xảy ra</h1>
                                <h4>Đường dẫn mà bạn đang tìm kiếm không tồn tại hoặc bạn không có quyền truy cập.</h4>
                                <h3><small>Hãy <a href="mailto:kimfashion@gmail.com">liên hệ</a> với KimFashion để được giải đáp</small></h3>
                                <div id="sub-social">
                                    <ul class="social-list unstyled">
                                        <li><a href="https://www.facebook.com/pages/Kim-Fashion/1402400103359807"><i class="iconfont-facebook round-icon"></i></a></li>
                                        <li><a href="https://twitter.com/kimhue1012"><i class="iconfont-twitter round-icon"></i></a></li>
                                        <li><a href="https://plus.google.com/u/0/108003680879148344644"><i class="iconfont-google-plus-sign round-icon"></i></a></li>
                                    </ul>
                                </div>
                            </section>
                            <section class="section">
                                <section class="col-xs-12 col-sm-12">
                                    <div id="gmap" class="gmap"></div>
                                </section>
                            </section>
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
