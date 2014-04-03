<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Chi tiết sản phẩm | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
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
                            <li><a href="admin.do">Trang quản trị</a></li>
                            <li><a href="admin-product.do">Sản phẩm</a></li>
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
                            <div class="product-single-details" data-product-id="<bean:write name="SanPhamForm" property="maSP" />">
                                <!-- PRODUCT PREVIEW -->
                                <div class="col-xs-12 col-sm-4">
                                    <div class="product-preview">
                                        <div class="big-image">
                                            <a href="<bean:write name="SanPhamForm" property="hinhAnh"/>" data-toggle="lightbox">
                                                <img src="<bean:write name="SanPhamForm" property="hinhAnh"/>"
                                                     alt="<bean:write name="SanPhamForm" property="tenSP"/>" />
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
                                    <section class="product-details">
                                        <header class="entry-header">
                                            <h3 class="entry-title uppercase">
                                                <a href="product-details.do?id=<bean:write name="SanPhamForm" property="maSP"/>">
                                                    <bean:write name="SanPhamForm" property="tenSP"/>
                                                </a>
                                            </h3>
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
                                                        <strong class="accent-color price">
                                                            <fmt:formatNumber value="${SanPhamForm.giaBan}" type="NUMBER" maxFractionDigits="3" />
                                                            VND
                                                        </strong>
                                                    </logic:notEqual>
                                                </span>
                                                <ul class="entry-meta unstyled">
                                                    <li>
                                                        <span class="key">Thương hiệu:</span>
                                                        <span class="value">
                                                            <a href="product-brand.do?id=<bean:write name="SanPhamForm" property="maThuongHieu" />"><bean:write name="SanPhamForm" property="tenThuongHieu"/></a>
                                                        </span>
                                                    </li>
                                                    <c:if test="${SanPhamForm.maBST gt 0}">
                                                        <li>
                                                            <span class="key">Bộ sưu tập:</span>
                                                            <span class="value">
                                                                <a href="product-collection.do?id=<bean:write name="SanPhamForm" property="maBST" />"><bean:write name="SanPhamForm" property="tenBST"/></a>
                                                            </span>
                                                        </li>
                                                    </c:if>
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
                                                        <div class="inline-middle">
                                                            <logic:iterate id="size" name="SanPhamForm" property="listSize">
                                                                <bean:write name="size" property="tenSize"/>
                                                            </logic:iterate>
                                                        </div>
                                                    </div>
                                                </div>
                                                <ul class="inline-li li-m-r-l m-t-lg">
                                                    <li>
                                                        <a href="edit-product.do?id=<bean:write name="SanPhamForm" property="maSP"/>" 
                                                           class="btn btn-primary btn-lg btn-round">Sửa sản phẩm</a>
                                                    </li>
                                                    <li>
                                                        <a href="admin-product.do" class="btn btn-default btn-lg btn-round">Quay lại danh sách</a>
                                                    </li>
                                                </ul>
                                            </figure>
                                        </article>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/products.js"></script>
    </body>
</html>
