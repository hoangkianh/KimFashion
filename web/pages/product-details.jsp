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
                            <li><a href="products.do">Sản phẩm</a></li>
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
                                        <a href="<bean:write name="SanPhamForm" property="hinhAnh"/>" data-toggle="lightbox">
                                            <img src="<bean:write name="SanPhamForm" property="hinhAnh"/>" alt="<bean:write name="SanPhamForm" property="tenSP"/>" />
                                        </a>
                                    </div>
                                    <ul class="thumbs unstyled clearfix">
                                        <logic:iterate id="hinhAnh" name="SanPhamForm" property="listHinhAnh">
                                            <li>
                                                <a href="<bean:write name="hinhAnh" property="duongDan"/>">
                                                    <img src="<bean:write name="hinhAnh" property="duongDan"/>" alt="" />
                                                </a>
                                            </li>
                                        </logic:iterate>
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
                                                <logic:equal name="SanPhamForm" property="dangKM" value="true">
                                                    <s class="entry-discount">
                                                        <fmt:formatNumber value="${SanPhamForm.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                        VND
                                                    </s>
                                                    <strong class="accent-color price">
                                                        <fmt:formatNumber value="${SanPhamForm.giaBanKM}" type="NUMBER" maxFractionDigits="3" />
                                                        VND
                                                    </strong>
                                                </logic:equal>
                                                <logic:notEqual name="SanPhamForm" property="dangKM" value="true">
                                                    <fmt:formatNumber value="${SanPhamForm.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                    VND
                                                </logic:notEqual>
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
                                                <p><bean:write name="SanPhamForm" property="moTa" filter="false"/></p>
                                            </figcaption>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12">
                                                    <h5 class="subheader uppercase">Màu sắc:</h5>
                                                    <p><bean:write name="SanPhamForm" property="mauSac" filter="false"/></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12">
                                                    <h5 class="subheader uppercase">Size:</h5>
                                                    <div class="inline-middle styled-dd">
                                                        <select>
                                                            <option>-- Hãy chọn size --</option>
                                                            <logic:iterate id="size" name="SanPhamForm" property="listSize">
                                                                <option value="<bean:write name="size" property="maSize"/>"><bean:write name="size" property="tenSize"/></option>
                                                            </logic:iterate>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <ul class="inline-li li-m-r-l m-t-lg">
                                                <li>
                                                    <a href="cart.do" class="btn btn-default btn-lg btn-round add-to-cart">Thêm vào giỏ</a>
                                                </li>
                                                <li>
                                                    <a href="compare.do">+ So sánh</a>
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
                            <!-- BEGIN CAROUSEL -->
                            <div id="featured-products" class="add-cart" data-product=".product" data-thumbnail=".entry-media .thumb"
                                 data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">
                                <logic:notEmpty name="SanPhamForm" property="listSPCungLoai">

                                    <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                                        <h3 class="section-title">Sản phẩm cùng loại</h3>
                                        <p class="section-teaser">Lựa chọn các sản phẩm cùng loại</p>
                                    </header>

                                    <div class="clearfix"></div>
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
                                                    <img data-src="<bean:write name="sanPham" property="hinhAnh" />" alt="" class="lazyOwl thumb" />
                                                    <div class="hover">
                                                        <a href="product-details.do?id=<bean:write name="sanPham" property="maSP"/>" class="entry-url"></a>
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
                                                                <a href="<bean:write name="sanPham" property="hinhAnh"/>" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                            </li>
                                                            <li>
                                                                <a href="cart.do" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                            </li>
                                                        </ul>
                                                        <div class="rate-bar">
                                                            <input type="range" value="<bean:write name="sanPham" property="xepHang"/>" step="0.5" id="backing<bean:write name="sanPham" property="maSP"/>" />
                                                            <div class="rateit" data-rateit-backingfld="#backing<bean:write name="sanPham" property="maSP"/>" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="entry-main">
                                                    <h5 class="entry-title">
                                                        <a href="product-details.do?id=<bean:write name="sanPham" property="maSP"/>">
                                                            <bean:write name="sanPham" property="tenSP"/>
                                                        </a>
                                                    </h5>
                                                    <div class="entry-price">
                                                        <logic:equal name="sanPham" property="dangKM" value="true">
                                                            <s class="entry-discount">
                                                                <fmt:formatNumber value="${sanPham.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                                VND
                                                            </s>
                                                            <strong class="accent-color price">
                                                                <fmt:formatNumber value="${sanPham.giaBanKM}" type="NUMBER" maxFractionDigits="3" />
                                                                VND
                                                            </strong>
                                                        </logic:equal>
                                                        <logic:equal name="sanPham" property="sanPhamMoi" value="true">
                                                            <strong class="price">
                                                                <fmt:formatNumber value="${sanPham.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                                VND
                                                            </strong>
                                                        </logic:equal>
                                                    </div>
                                                    <div class="entry-links clearfix">
                                                        <a href="#" class="pull-center">+ So sánh</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </logic:iterate>
                                    </div>
                                </logic:notEmpty>
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
