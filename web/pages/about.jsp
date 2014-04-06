<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Thông tin về chúng tôi | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">Giới thiệu</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-lg-offset-1 col-md-5">
                            <section class="section">
                                <h3 class="widget-title"><span class="text-bold">Giới thiệu Kim Fashion</span></h3>
                                <div class="widget-content">
                                    <p>Chào mừng quý khách đến với <span class="text-bold">KimFashion</span> , web mua sắm thời trang lớn nhất Việt Nam..</p>
                                    <p><span class="text-bold">KimFashion</span> hân hạnh mang đến cho bạn một bộ sưu tập thời trang khổng lồ từ những thương hiệu nổi tiếng thế giới 
                                        và Việt Nam. Tất cả các sản phẩm đều được <span class="text-bold">KimFashion</span> tuyển lựa một cách kỹ lưỡng sao cho thật hợp với phong cách Á Đông
                                        mà cũng bắt nhịp cùng với những xu hướng mới nhất đang thịnh hành khắp thế giới..</p>
                                    <p>Trong lĩnh vực thời trang, <span class="text-bold">KimFashion</span> tự hào về đội ngũ stylist chuyên nghiệp và tận tình giúp người mua có được
                                        những gợi ý sáng tạo cho một vẻ ngoài hoàn hảo thật phù hợp với nhiều hoàn cảnh và phong cách đa dạng của quý khách.
                                        Dù bạn thanh lịch, quý phái hay trẻ trung, năng động, bạn cũng đều có thể tìm được những món đồ ưng ý trên <span class="text-bold">KimFashion</span></p>
                                    <p>Sự sành điệu và gout thẩm mỹ tinh tế của quý khách còn được thể hiện qua sự lựa chọn những món đồ phụ kiện 
                                        có trên <span class="text-bold">KimFashion</span>. Chắc chắn quý khách sẽ rất hài lòng.</p>
                                    <p>Ở <span class="text-bold">KimFashion</span>, quý khách sẽ có những trải nghiệm mua sắm vô cùng thú vị!</p>
                                </div>
                            </section>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-5">
                            <section class="section">
                                <img src="images/ABOUT.jpg" class="lazyOwl thumb"/>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="http://maps.googleapis.com/maps/api/Resource/js/?sensor=false" type="text/javascript"></script>
        <script src="resource/js//owl.carousel.Resource/js/"></script>
        <script src="resource/js//gmap3.min.Resource/js/"></script>
    </body>
</html>
