<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>KimFashion - Cửa hàng thời trang online</title>
        <%@include file="include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/flexslider.css" />
        <%@include file="include/includeJS.jsp" %>
    </head>
    <body class="home">
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="include/header.jsp" %>
            <div id="home-slider">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="images/slider/Street-Fashion.jpg" alt="" />
                        </li>
                        <li style="background: #fa6f57;">
                            <img src="images/slider/Street-Fashion.jpg" alt="" />
                        </li>
                        <li>
                            <img src="images/slider/3303349658_cfaebb811f_o.jpg" alt="" />
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $(function() {
                    var $slider = $('#home-slider > .flexslider');
                    $slider.flexslider({
                        animation: 'slide',
                        easing: 'easeInQuad',
                        slideshowSpeed: 5000,
                        nextText: '<i class="iconfont-angle-right"></i>',
                        prevText: '<i class="iconfont-angle-left"></i>'
                    });
                });
            </script>
            <main id="main-content" role="main">

                <!-- BỘ SƯU TẬP -->
                <section class="section promos">
                    <div class="container">
                        <div class="row">
                            <jsp:useBean id="bstFrom" class="com.kimfashion.form.BoSuuTapForm"/>
                            <logic:iterate id="bst" collection="${bstFrom.listRandomBST}">                                
                                <div class="col-md-4">
                                    <div class="promo inverse-background first-row animated" data-animation="fadeInDown" style="background: url('${bst.anhDaiDien}') no-repeat; background-size: 100%;">
                                        <div class="inner text-center np">
                                            <div class="ribbon">
                                                <h6 class="nmb">Bộ sưu tập mới</h6>
                                                <h5 class="text-semibold uppercase nmb">${bst.tenBST}</h5>
                                                <div class="space10"></div>
                                                <html:link action="collection" paramId="id" paramName="bst" paramProperty="maBST">
                                                    <i class="iconfont-caret-right"></i><span style="color: #FA6F57; font-weight: bold;"> Xem ngay</span></a>
                                                    </html:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </logic:iterate>
                        </div>
                    </div>
                </section>
                <!-- // BỘ SƯU TẬP -->

                <!-- SẢN PHẨM MỚI -->
                <section class="section featured visible-items-4">
                    <div class="container">
                        <div class="row">
                            <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                <h3 class="section-title">hàng mới về</h3>
                                <p class="section-teaser">Bắt kịp xu hướng thời trang mới nhất năm nay</p>
                            </header>

                            <div class="clearfix"></div>

                            <div id="featured-products" class="add-cart" 
                                 data-product=".product" data-thumbnail=".entry-media .thumb" 
                                 data-title=".entry-title > a"
                                 data-url=".entry-title > a" data-price=".entry-price > .price">

                                <div class="owl-controls clickable outside">
                                    <div class="owl-buttons">
                                        <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                        <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                                    </div>
                                </div>

                                <div class="owl-carousel owl-theme" data-visible-items="5"
                                     data-navigation="true" data-lazyload="true">
                                    <jsp:useBean id="spForm" class="com.kimfashion.form.SanPhamForm"/>
                                    <logic:iterate id="sp" collection="${spForm.listSPMoi}">
                                        <div class="product" data-product-id="${sp.maSP}" 
                                             data-size="${sp.listSizeString}" data-code="${sp.code}">
                                            <div class="entry-media">
                                                <img data-src="${sp.hinhAnh}" alt="" class="lazyOwl thumb" />
                                                <div class="hover">
                                                    <a href="product-details.do?id=${sp.maSP}" class="entry-url"></a>                                                   

                                                    <ul class="icons unstyled">
                                                        <li>
                                                            <div class="circle ribbon ribbon-new">New</div>
                                                        </li>
                                                        <li>
                                                            <a href="${sp.hinhAnh}" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="entry-main">
                                                <h5 class="entry-title">
                                                    <a href="product-details.do?id=${sp.maSP}">${sp.tenSP}</a>
                                                </h5>
                                                <div class="entry-price">
                                                    <strong class="price accent-color">
                                                        <fmt:formatNumber value="${sp.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                        VND
                                                    </strong>
                                                </div>
                                            </div>
                                        </div>
                                    </logic:iterate>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // SẢN PHẨM MỚI -->

                <!-- SẢN PHẨM KM -->
                <section class="section new-arrivals visible-items-5">
                    <div class="container">
                        <div class="row">
                            <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                <h3 class="section-title">Sản phẩm khuyến mãi</h3>
                                <p class="section-teaser"></p>
                            </header>

                            <div class="clearfix"></div>

                            <!-- SẢN PHẨM KHUYẾN MÃI -->
                            <div id="new-arrivals-products" class="add-cart" data-product=".product" data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">

                                <div class="owl-controls clickable outside">
                                    <div class="owl-buttons">
                                        <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                        <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                                    </div>
                                </div>

                                <div class="owl-carousel owl-theme" data-visible-items="5"
                                     data-navigation="true" data-lazyload="true">
                                    <logic:iterate id="sp" collection="${spForm.listSPKhuyenMai}">
                                        <div class="product" data-product-id="${sp.maSP}"
                                             data-size="${sp.listSizeString}" data-code="${sp.code}">
                                            <div class="entry-media">
                                                <img data-src="${sp.hinhAnh}" alt="" class="lazyOwl thumb" />
                                                <div class="hover">
                                                    <a href="product-details.do?id=${sp.maSP}" class="entry-url"></a>                                                   

                                                    <ul class="icons unstyled">
                                                        <li>
                                                            <div class="circle ribbon ribbon-sale">Sale</div>
                                                        </li>
                                                        <li>
                                                            <a href="${sp.hinhAnh}" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="entry-main">
                                                <h5 class="entry-title">
                                                    <a href="product-details.do?id=${sp.maSP}">${sp.tenSP}</a>
                                                </h5>
                                                <div class="entry-price">
                                                    <s class="entry-discount">
                                                        <fmt:formatNumber value="${sp.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                        VND
                                                    </s>
                                                    <strong class="accent-color price">
                                                        <fmt:formatNumber value="${sp.giaBanKM}" type="NUMBER" maxFractionDigits="3" />
                                                        VND
                                                    </strong>
                                                </div>
                                            </div>
                                        </div>
                                    </logic:iterate>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // SẢN PHẨM KM -->
            </main>
        </div>
        <%@include file="include/footer.jsp" %>
        <script src="resource/js/owl.carousel.js"></script>
        <script src="resource/js/jquery.flexslider-min.js"></script>
    </body>
</html>