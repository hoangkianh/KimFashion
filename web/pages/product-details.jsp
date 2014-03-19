<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Chi tiết sản phẩm | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/jquery.nouislider.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body class="product-single">
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li><a href="/KimFashion">Trang chủ</a></li>
                            <li><a href="/products.do">Sản phẩm</a></li>
                            <li class="active">Chi tiết sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <!-- PRODUCT PREVIEW -->
                            <div class="col-xs-12 col-sm-4">

                                <div class="product-preview">
                                    <div class="big-image">
                                        <a href="images/product/women/skirt/1.jpg" data-toggle="lightbox">
                                            <img src="images/product/women/skirt/1.jpg" alt="" />
                                        </a>
                                    </div>
                                    <ul class="thumbs unstyled clearfix">
                                        <li><a href="images/product/women/skirt/1.jpg"><img src="images/product/women/skirt/1.jpg" alt="" /></a></li>
                                        <li><a href="images/product/women/skirt/2.jpg"><img src="images/product/women/skirt/2.jpg" alt="" /></a></li>
                                    </ul>
                                </div>

                            </div>
                            <div class="space40 visible-xs"></div>

                            <!-- PRODUCT DETAILS -->
                            <div class="col-xs-12 col-sm-8">
                                <section class="product-details add-cart">
                                    <header class="entry-header">
                                        <h2 class="entry-title uppercase">
                                            <bean:write name="SanPhamForm" property="tenSP"/>
                                        </h2>
                                    </header>
                                    <article class="entry-content">
                                        <figure>
                                            <span class="entry-price inline-middle"> 
                                                <fmt:formatNumber value="${SanPhamForm.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                VND
                                            </span>
                                            <div class="rate-bar inline-middle">
                                                <input type="range" value="4.5" step="0.5" id="backing0" />
                                                <div class="rateit" data-rateit-backingfld="#backing0" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                            <span class="entry-review-count inline-middle">
                                                (<bean:write name="SanPhamForm" property="soLuotDanhGia"/> lượt đánh giá)
                                            </span>
                                            <ul class="entry-meta unstyled">
                                                <li>
                                                    <span class="key">Thương hiệu:</span>
                                                    <span class="value">
                                                        <bean:write name="SanPhamForm" property="tenThuongHieu"/>
                                                    </span>
                                                </li>
                                                <li>
                                                    <span class="key">Code:</span>
                                                    <span class="value">
                                                        <bean:write name="SanPhamForm" property="code"/>
                                                    </span>
                                                </li>
                                            </ul>

                                            <div class="clearfix"></div>

                                            <figcaption class="m-b-sm">
                                                <h5 class="subheader uppercase">Mô tả:</h5>
                                                <p><bean:write name="SanPhamForm" property="moTa"/></p>
                                            </figcaption>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6">
                                                    <h5 class="subheader uppercase">Màu sắc:</h5>
                                                    <div class="inline-middle styled-dd">
                                                        <select>
                                                            <option>-- Please Select --</option>
                                                            <option value="Black">Black</option>
                                                            <option value="Aubergine">Aubergine</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="space30 visible-xs"></div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <h5 class="subheader uppercase">Size:</h5>
                                                    <div class="inline-middle styled-dd">
                                                        <select>
                                                            <option>-- Please Select --</option>
                                                            <option value="xs">X-Small</option>
                                                            <option value="s">Small</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <ul class="inline-li li-m-r-l m-t-lg">
                                                <li>
                                                    <a href="cart.do" class="btn btn-default btn-lg btn-round add-to-cart">Thêm vào giỏ</a>
                                                </li>
                                                <li>
                                                    <a href="#">+ So sánh</a>
                                                </li>
                                            </ul>

                                        </figure>
                                    </article>
                                </section>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- FEATURED PRODUCTS -->
                <section class="section featured visible-items-4">
                    <div class="container">
                        <div class="row">
                            <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                <h3 class="section-title">Sản phẩm cùng loại</h3>
                                <p class="section-teaser">Lựa chọn các sản phẩm cùng loại</p>
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

                                <div class="owl-carousel owl-theme" data-visible-items="4" 
                                     data-navigation="true" data-lazyload="true">

                                    <logic:iterate id="sanPham" name="SanPhamForm" property="listSPCungLoai">
                                        <div class="product" data-product-id="<bean:write name="sanPham" property="maSP"/>">
                                            <div class="entry-media">
                                                <img data-src="<bean:write  name="sanPham" property="hinhAnh" />" alt="" class="lazyOwl thumb" />
                                                <div class="hover">
                                                    <a href="#" class="entry-url"></a>
                                                    <ul class="icons unstyled">
                                                        <logic:equal name="sanPham" property="dangKM" value="true">
                                                            <li>
                                                                <div class="circle ribbon ribbon-sale">Sale</div>
                                                            </li>
                                                        </logic:equal>
                                                        <logic:equal name="sanPham" property="sanPhamMoi" value="true">
                                                            <li>
                                                                <div class="circle ribbon ribbon-new">New</div>
                                                            </li>
                                                        </logic:equal>   
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
                                                    <a href="#" class="pull-left m-r">+ So sánh</a>
                                                </div>
                                            </div>
                                        </div>
                                    </logic:iterate>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/jquery.nouislider.js"></script>
        <script src="resource/js/owl.carousel.js"></script>
        <script src="resource/js/products.js"></script>
    </body>
</html>
