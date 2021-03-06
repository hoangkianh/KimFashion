<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:choose>
    <c:when test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>
    </c:when>
    <c:otherwise>
        <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
    </c:otherwise>
</c:choose>
<!-- SITE HEADER -->
<header id="site-header" role="banner">
    <!-- MAIN HEADER -->
    <div class="main-header-wrapper">
        <div class="container">
            <div class="main-header">
                <div class="actions">
                    <!--USER MENU-->
                    <nav id="tiny-menu" class="clearfix">
                        <ul class="user-menu">
                            <li><a href="updateinfo.do">${s[1]}</a></li>
                            <li><a href="logout.do">Đăng xuất</a></li>
                        </ul>
                    </nav>
                </div>

                <!-- LOGO -->
                <div class="logo-wrapper">
                    <a href="/" class="logo" title="KimFashion - Cửa hàng thời trang online">
                        <img src="resource/img/logo.png" alt="Kim Fashion - Cửa hàng thời trang online"/>
                    </a>
                </div>
                <!-- MENU CHO ADMIN -->
                <c:if test="${s[2] eq true}">                    
                    <nav id="site-menu" role="navigation">
                        <ul class="main-menu hidden-sm hidden-xs">
                            <li>
                                <a href="admin.do">
                                    <i class="iconfont-bookmark"></i>
                                </a>
                                <div class="mega-menu" data-col-lg="9" data-col-md="9">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h4 class="menu-title">quản lý sản phẩm</h4>
                                            <ul class="mega-sub">
                                                <li><a href="admin-product.do">Danh sách sản phẩm</a></li>
                                                <li><a href="admin-category.do">Loại sản phẩm</a></li>
                                                <li><a href="admin-brand.do">Thương hiệu</a></li>
                                                <li><a href="admin-collection.do">Bộ sưu tập</a></li>
                                                <li><a href="admin-size.do">Size</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-4">
                                            <h4 class="menu-title">quản lý hóa đơn</h4>
                                            <ul class="mega-sub">
                                                <li><a href="all-order.do">Tất cả hóa đơn</a></li>
                                                <li><a href="all-tt.do">Hóa đơn đã thanh toán</a></li>
                                                <li><a href="all-chuatt.do">Hóa đơn chưa thanh toán</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-4">
                                            <h4 class="menu-title">Quản lý thành viên</h4>
                                            <ul class="mega-sub">
                                                <li><a href="all-thanhvien.do">Danh sách thành viên</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="/">Quay lại cửa hàng</a>
                            </li>
                        </ul>

                        <div id="mobile-menu" class="dl-menuwrapper visible-xs visible-sm">
                            <button class="dl-trigger"><i class="iconfont-reorder round-icon"></i></button>
                            <ul class="dl-menu">
                                <li>
                                    <a href="javsacript:void(0);">Sản phẩm</a> 
                                    <ul class="dl-submenu">
                                        <li><a href="admin-product.do">Danh sách sản phẩm</a></li>
                                        <li><a href="admin-category.do">Loại sản phẩm</a></li>
                                        <li><a href="admin-brand.do">Thương hiệu</a></li>
                                        <li><a href="admin-collection.do">Bộ sưu tập</a></li>
                                        <li><a href="admin-size.do">Size</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>
</header>