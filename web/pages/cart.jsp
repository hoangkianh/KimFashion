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
                                    <th style="width: 10%;">Size</th>
                                    <th style="width: 15%;">Số lượng</th>
                                    <th class="hidden-xs" style="width: 15%;">Tổng tiền </th>
                                    <th class="hidden-xs" style="width: 5%;">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="hide empty-cart">
                                    <td colspan="5">
                                        Giỏ hàng đang trống. Hãy quay lại chọn <a href="products.do">sản phẩm</a>.
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="shopcart-total pull-right clearfix">
                            <div class="cart-total text-bold m-b-lg clearfix">
                                <span class="pull-left">Tổng cộng:</span>
                                <span class="pull-right"></span>
                            </div>
                            <div class="text-center">
                                <a class="btn btn-round btn-default uppercase" href="checkout.do">Thanh toán</a>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- RELATED PRODUCTS -->
                <section class="section visible-items-4">
                    <div class="container">
                        <div class="row">

                            <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                <h3 class="section-title">có thể bạn sẽ thích</h3>
                                <p class="section-teaser">có thể bạn sẽ thích nhữn sản phẩm này</p>
                            </header>

                            <div class="clearfix"></div>

                            <!-- CÓ THỂ BẠN SẼ THÍCH -->
                            <div id="featured-products" class="add-cart" data-product=".product"
                                 data-thumbnail=".entry-media .thumb" data-title=".entry-title > a"
                                 data-url=".entry-title > a" data-price=".entry-price > .price">

                                <div class="owl-controls clickable top">
                                    <div class="owl-buttons">
                                        <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                        <div class="owl-next"><i class="iconfont-angle-right"></i></div>
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
