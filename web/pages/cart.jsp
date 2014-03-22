<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Giỏ hàng | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="/KimFashion">Trang chủ</a></li>
                            <li class="active">Giỏ hàng</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">

                        <table class="tbl-cart">
                            <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th style="width: 15%;">Giá</th>
                                    <th style="width: 15%;">Số lượng</th>
                                    <th class="hidden-xs" style="width: 15%;">Tổng tiền </th>
                                    <th class="hidden-xs" style="width: 10%;">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="hide empty-cart">
                                    <td colspan="5">
                                        Giỏ hàng đang trống. Hãy quay lại chọn <a href="Products.aspx">sản phẩm</a>.
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="shopcart-total pull-right clearfix">
                            <div class="cart-total text-bold m-b-lg clearfix">
                                <span class="pull-left">Grand Total:</span>
                                <span class="pull-right">$1050.00</span>
                            </div>
                            <div class="text-center">
                                <a class="btn btn-round btn-default uppercase" href="checkout.do">Proceed to checkout</a>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- RELATED PRODUCTS -->
                <section class="section visible-items-4">
                    <div class="container">
                        <div class="row">

                            <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                <h3 class="section-title">You may be interested in</h3>
                                <p class="section-teaser">Lorem ipsum dolor sit amet, consectetur adipiscing elit ac lobortis lacus</p>
                            </header>

                            <div class="clearfix"></div>

                            <!-- BEGIN CAROUSEL -->
                            <div id="featured-products" class="add-cart" data-product=".product" data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">

                                <div class="owl-controls clickable top">
                                    <div class="owl-buttons">
                                        <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                        <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                                    </div>
                                </div>

                                <div class="owl-carousel owl-theme" data-visible-items="4" data-navigation="true" data-lazyload="true">

                                    <div class="product" data-product-id="1">
                                        <div class="entry-media">
                                            <img data-src="images/product/women/basic/p01.jpg" alt="" class="lazyOwl thumb" />
                                            <div class="hover">
                                                <a href="ProductDetails.aspx" class="entry-url"></a>
                                                <ul class="icons unstyled">
                                                    <li>
                                                        <div class="circle ribbon ribbon-sale">Sale</div>
                                                    </li>
                                                    <li>
                                                        <a href="images/product/women/basic/p01.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                    </li>
                                                </ul>
                                                <div class="rate-bar">
                                                    <input type="range" value="4.5" step="0.5" id="backing1" />
                                                    <div class="rateit" data-rateit-backingfld="#backing1" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="entry-main">
                                            <h5 class="entry-title">
                                                <a href="#">Inceptos orci hac libero</a>
                                            </h5>
                                            <div class="entry-price">
                                                <s class="entry-discount">$ 350.00</s>
                                                <strong class="accent-color price">$ 250.00</strong>
                                            </div>
                                            <div class="entry-links clearfix">
                                                <a href="#" class="pull-center">+ Thêm vào để so sánh </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product" data-product-id="2">
                                        <div class="entry-media">
                                            <img data-src="images/product/women/basic/p02.jpg" alt="" class="lazyOwl thumb" />
                                            <div class="hover">
                                                <a href="ProductDetails.aspx" class="entry-url"></a>
                                                <ul class="icons unstyled">
                                                    <li>
                                                        <div class="circle ribbon ribbon-sale">Sale</div>
                                                    </li>
                                                    <li>
                                                        <a href="images/product/women/basic/p02.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                    </li>
                                                </ul>
                                                <div class="rate-bar">
                                                    <input type="range" value="4.5" step="0.5" id="backing2" />
                                                    <div class="rateit" data-rateit-backingfld="#backing2" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="entry-main">
                                            <h5 class="entry-title">
                                                <a href="#">Inceptos orci hac libero</a>
                                            </h5>
                                            <div class="entry-price">
                                                <s class="entry-discount">$ 350.00</s>
                                                <strong class="accent-color price">$ 250.00</strong>
                                            </div>
                                            <div class="entry-links clearfix">
                                                <a href="#" class="pull-center">+ Thêm vào để so sánh </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product" data-product-id="3">
                                        <div class="entry-media">
                                            <img data-src="images/product/women/basic/p03.jpg" alt="" class="lazyOwl thumb" />
                                            <div class="hover">
                                                <a href="ProductDetails.aspx" class="entry-url"></a>
                                                <ul class="icons unstyled">
                                                    <li>
                                                        <div class="circle ribbon ribbon-new">New</div>
                                                    </li>
                                                    <li>
                                                        <a href="images/product/women/basic/p03.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                    </li>
                                                </ul>
                                                <div class="rate-bar">
                                                    <input type="range" value="3.5" step="0.5" id="backing3" />
                                                    <div class="rateit" data-rateit-backingfld="#backing3" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="entry-main">
                                            <h5 class="entry-title">
                                                <a href="#">Inceptos orci hac libero</a>
                                            </h5>
                                            <div class="entry-price">
                                                <strong class="price">$ 450.00</strong>
                                            </div>
                                            <div class="entry-links clearfix">
                                                <a href="#" class="pull-center">+ Thêm vào để so sánh </a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product" data-product-id="4">
                                        <div class="entry-media">
                                            <img data-src="images/product/women/basic/p04.jpg" alt="" class="lazyOwl thumb" />
                                            <div class="hover">
                                                <a href="ProductDetails.aspx" class="entry-url"></a>
                                                <ul class="icons unstyled">
                                                    <li>
                                                        <div class="circle ribbon ribbon-new">New</div>
                                                    </li>
                                                    <li>
                                                        <a href="images/product/women/basic/p04.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                    </li>
                                                </ul>
                                                <div class="rate-bar">
                                                    <input type="range" value="3.5" step="0.5" id="backing4" />
                                                    <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="entry-main">
                                            <h5 class="entry-title">
                                                <a href="#">Inceptos orci hac libero</a>
                                            </h5>
                                            <div class="entry-price">
                                                <strong class="price">$ 450.00</strong>
                                            </div>
                                            <div class="entry-links clearfix">
                                                <a href="#" class="pull-center">+ Thêm vào để so sánh </a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/products.js"></script>
        <script src="resource/js/owl.carousel.js"></script>
    </body>
</html>
