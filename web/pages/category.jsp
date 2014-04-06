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
        <title><bean:write name="SanPhamForm" property="tenLoaiSP"/> | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/jquery.nouislider.css"/>
        <link rel="stylesheet" href="resource/css/isotope.css"/>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body class="products-view">
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">Sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <div class="m-t-b clearfix">
                            <!-- SIDEBAR LỌC SẢN PHẨM -->
                            <aside class="col-xs-12 col-sm-4 col-md-3">
                                <section class="sidebar push-up">

                                    <!-- BRANDS -->
                                    <section class="side-section bg-white">
                                        <header class="side-section-header">
                                            <h3 class="side-section-title">THƯƠNG HIỆU</h3>
                                        </header>

                                        <div class="side-section-content">
                                            <ul id="brands-list" class="vmenu unstyled">
                                                <jsp:useBean id="thuongHieuForm" class="com.kimfashion.form.ThuongHieuForm"></jsp:useBean>
                                                <logic:iterate id="thuongHieu" collection="${thuongHieuForm.listThuongHieu}">
                                                    <li>
                                                        <input type="checkbox" id="check-th${thuongHieu.maThuongHieu}" class="prettyCheckable" data-labelPosition="right"
                                                               data-label="${thuongHieu.tenThuongHieu}" value="th${thuongHieu.maThuongHieu}" />
                                                    </li>
                                                </logic:iterate>
                                            </ul>
                                        </div>
                                    </section>

                                    <!-- PRODUCT FILTER -->
                                    <section class="side-section bg-white">
                                        <header class="side-section-header">
                                            <h3 class="side-section-title">Tìm kiếm</h3>
                                        </header>

                                        <!-- PRICE RANGE SLIDER -->
                                        <div id="filter-by-price" class="side-section-content">
                                            <h4 class="side-section-subheader">theo giá</h4>
                                            <div class="range-slider-container">
                                                <div class="range-slider" data-min="0" data-max="1000000" data-step="100000" data-currency="VND"></div>
                                                <div class="range-slider-value clearfix">
                                                    <span>Giá: &ensp;</span>
                                                    <span class="min"></span>
                                                    <span class="max"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- FILTER BY SIZE -->
                                        <div id="filter-by-size" class="side-section-content">
                                            <h4 class="side-section-subheader">theo kích cỡ</h4>
                                            <ul class="inline-li li-m-lg text-center unstyled">
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size XS"><small>XS</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="XS" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size S"><small>S</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="S" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size M"><small>M</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="M" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size L"><small>L</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="L" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size XL"><small>XL</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="XL" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon" data-toggle="tooltip" data-title="Size XX"><small>XXL</small></a>
                                                    <input type="checkbox" class="filter-checkbox filter-size" value="XXL" />
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- FILTER BY COLOR -->
                                        <div id="filter-by-color" class="side-section-content">
                                            <h4 class="side-section-subheader">theo màu sắc</h4>
                                            <ul class="inline-li li-m-sm text-center unstyled">
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Đen" style="background: #000;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Đen" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Trắng" style="background: #fff; border-color: #acacac;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Trắng" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Xanh lá" style="background: #60bd0d;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Xanh lá" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Đỏ" style="background: #ff5757;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Đỏ" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Xanh dương" style="background: #173b65;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Xanh dương" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Kem" style="background: #cbbcac;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Kem" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Tím" style="background: #a613c5;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Tím" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Ghi" style="background: #e5e5e8;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Ghi" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Cam" style="background: #fa6f57;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Cam" />
                                                </li>
                                                <li>
                                                    <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="Hồng" style="background: #f74dae;"></a>
                                                    <input type="checkbox" class="filter-checkbox filter-color" value="Hồng" />
                                                </li>
                                            </ul>
                                        </div>
                                    </section>

                                    <!-- SP BÁN CHẠY -->
                                    <section class="side-section bg-white">
                                        <header class="side-section-header">
                                            <h3 class="side-section-title">bán chạy</h3>
                                        </header>
                                        <div class="side-section-content">
                                            <ul class="product-medialist li-m-t unstyled clearfix">
                                                <logic:iterate id="sanPham" name="SanPhamForm" property="listSPBanChay">
                                                    <li>
                                                        <div class="item clearfix">
                                                            <a href="<bean:write name="sanPham" property="hinhAnh"/>" data-toggle="lightbox" class="entry-thumbnail">
                                                                <img src="<bean:write name="sanPham" property="hinhAnh"/>" alt="" />
                                                            </a>
                                                            <h5 class="entry-title">
                                                                <a href="product-details.do?id=<bean:write name="sanPham" property="maSP"/>">
                                                                    <bean:write name="sanPham" property="tenSP"/>
                                                                </a>
                                                            </h5>
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
                                                            <logic:notEqual name="sanPham" property="dangKM" value="true">
                                                                <strong class="price accent-color">
                                                                    <fmt:formatNumber value="${sanPham.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                                    VND
                                                                </strong>
                                                            </logic:notEqual>
                                                        </div>
                                                    </li>
                                                </logic:iterate>
                                            </ul>
                                        </div>
                                    </section>
                                </section>
                            </aside>

                            <section class="col-xs-12 col-sm-8 col-md-9">
                                <section class="products-wrapper">
                                    <header class="products-header">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 center-xs">
                                                <!-- KIỂU HIỂN THỊ -->
                                                <ul class="unstyled inline-li li-m-r-l-sm pull-left">
                                                    <li><a class="round-icon active" href="#" data-toggle="tooltip" data-layout="grid" data-title="Xem dạng lưới"><i class="iconfont-th"></i></a></li>
                                                    <li><a class="round-icon" href="#" data-toggle="tooltip" data-layout="list" data-title="Xem dạng danh sách"><i class="iconfont-list"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </header>

                                    <!-- Hiển thị sản phẩm -->
                                    <div class="products-layout grid m-t-b add-cart" data-product=".product" 
                                         data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" 
                                         data-url=".entry-title > a" data-price=".entry-price > .price">
                                        <logic:iterate id="sanPham" name="SanPhamForm" property="listSanPham">
                                            <div class="product" data-product-id="<bean:write name="sanPham" property="maSP"/>" 
                                                 data-category="<bean:write name="sanPham" property="listMaLoai"/>"
                                                 data-brand="th<bean:write name="sanPham" property="maThuongHieu"/>"
                                                 data-price="<bean:write name="sanPham" property="giaBan"/>" 
                                                 data-colors="<bean:write name="sanPham" property="listMauSacString"/>"
                                                 data-size="<bean:write name="sanPham" property="listSizeString"/>"
                                                 data-code="<bean:write name="sanPham" property="code"/>">
                                                <div class="entry-media">
                                                    <img data-src="<bean:write name="sanPham" property="hinhAnh"/>" alt="" class="lazyLoad thumb" />
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
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="entry-main">
                                                    <h5 class="entry-title">
                                                        <a href="product-details.do?id=<bean:write name="sanPham" property="maSP"/>">
                                                            <bean:write name="sanPham" property="tenSP"/>
                                                        </a>
                                                    </h5>
                                                    <div class="entry-description visible-list">
                                                        <p><bean:write name="sanPham" property="moTa" filter="false"/></p>
                                                    </div>
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
                                                        <a href="cart.do" class="btn btn-round btn-default add-to-cart visible-list">Thêm vào giỏ</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </logic:iterate>
                                    </div>
                                </section>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/jquery.nouislider.js"></script>
        <script src="resource/js/jquery.isotope.min.js"></script>
        <script src="resource/js/products.js"></script>
    </body>
</html>