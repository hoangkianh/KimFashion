<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- SITE HEADER -->
<header id="site-header" role="banner">
    <!-- HEADER TOP -->
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-7">
                    <!-- CONTACT INFO -->
                    <div class="contact-info">
                        <i class="iconfont-headphones round-icon"></i>
                        <strong>(043) 8374447</strong>
                        <span>(Thứ 2 - CN: 9h - 21h)</span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-5">
                    <ul class="actions unstyled clearfix">
                        <li>
                            <!-- SEARCH BOX -->
                            <div class="search-box">
                                <form action="#" method="post">
                                    <div class="input-iconed prepend">
                                        <button class="input-icon"><i class="iconfont-search"></i></button>
                                        <label for="input-search" class="placeholder">Tìm kiếm…</label>
                                        <input type="text" name="search-text" id="input-search" class="round-input full-width" required />
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li data-toggle="sub-header" data-target="#sub-social">
                            <!-- SOCIAL ICONS -->
                            <a href="javascript:void(0);" id="social-icons">
                                <i class="iconfont-share round-icon"></i>
                            </a>
                            <div id="sub-social" class="sub-header">
                                <ul class="social-list unstyled text-center">
                                    <li><a href="https://www.facebook.com/pages/Kim-Fashion/1402400103359807"><i class="iconfont-facebook round-icon"></i></a></li>
                                    <li><a href="https://twitter.com/kimhue1012"><i class="iconfont-twitter round-icon"></i></a></li>
                                    <li><a href="https://plus.google.com/u/0/108003680879148344644"><i class="iconfont-google-plus-sign round-icon"></i></a></li>
                                </ul>
                            </div>
                        </li>
                        <li data-toggle="sub-header" data-target="#sub-cart">
                            <!-- SHOPPING CART -->
                            <a href="javascript:void(0);" id="total-cart">
                                <i class="iconfont-shopping-cart round-icon"></i>
                            </a>
                            <div id="sub-cart" class="sub-header">
                                <div class="cart-header">
                                    <span>Giỏ hàng đang trống</span>
                                    <small><a href="cart.do">(Xem tất cả)</a></small>
                                </div>
                                <ul class="cart-items product-medialist unstyled clearfix"></ul>
                                <div class="cart-footer">
                                    <div class="cart-total clearfix">
                                        <span class="pull-left uppercase">Tổng cộng</span>
                                        <span class="pull-right total">0 VND</span>
                                    </div>
                                    <div class="text-right">
                                        <a href="cart.do" class="btn btn-default btn-round view-cart">Xem giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- ADD TO CART MESSAGE -->
        <div class="cart-notification">
            <ul class="unstyled"></ul>
        </div>
    </div>

    <!-- MAIN HEADER -->
    <div class="main-header-wrapper">
        <div class="container">
            <div class="main-header">
                <div class="actions">
                    <!--USER MENU-->
                    <nav id="tiny-menu" class="clearfix">
                        <ul class="user-menu">
                            <li><a href="cart.do">Giỏ hàng</a></li>
                            <li><a href="checkout.do">Thanh toán</a></li>
                            <li><a href="#">Đăng xuất</a></li>
                        </ul>
                    </nav>
                </div>

                <!-- LOGO -->
                <div class="logo-wrapper">
                    <a href="/KimFashion" class="logo" title="KimFashion - Cửa hàng thời trang online">
                        <img src="resource/img/logo.png" alt="Kim Fashion - Cửa hàng thời trang online"/>
                    </a>
                </div>

                <!-- MENU-->
                <nav id="site-menu" role="navigation">
                    <ul class="main-menu hidden-sm hidden-xs">
                        <li class="active">
                            <a href="/KimFashion">Trang chủ</a>
                        </li>
                        <li>
                            <a href="#">Thời trang nữ</a>
                            <div class="mega-menu" data-col-lg="12" data-col-md="12">
                                <div class="row">
                                    <jsp:useBean id="loaiSPForm" class="com.kimfashion.form.LoaiSPForm"></jsp:useBean>
                                    <logic:iterate id="loaiSPCha" collection="${loaiSPForm.listLoaiSPCha}">
                                        <logic:equal name="loaiSPCha" property="gioiTinh" value="true">
                                            <div class="col-md-3">
                                                <h4 class="menu-title">${loaiSPCha.tenLoai}</h4>
                                                <ul class="mega-sub">
                                                    <logic:iterate id="loaiSPCon" collection="${loaiSPForm.listLoaiSPCon}">
                                                        <logic:equal name="loaiSPCon" property="maLoaiCha" value="${loaiSPCha.maLoai}">
                                                            <li>
                                                                <html:link action="category" paramId="cat" paramName="loaiSPCon" paramProperty="maLoai">
                                                                    ${loaiSPCon.tenLoai}
                                                                </html:link>
                                                            </li>
                                                        </logic:equal>
                                                    </logic:iterate>
                                                </ul>
                                            </div>
                                        </logic:equal>
                                    </logic:iterate>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="#">Thời trang nam</a>
                            <div class="mega-menu" data-col-lg="12" data-col-md="12">
                                <div class="row">
                                    <logic:iterate id="loaiSPCha" collection="${loaiSPForm.listLoaiSPCha}">
                                        <logic:equal name="loaiSPCha" property="gioiTinh" value="false">
                                            <div class="col-md-3">
                                                <h4 class="menu-title">${loaiSPCha.tenLoai}</h4>
                                                <ul class="mega-sub">
                                                    <logic:iterate id="loaiSPCon" collection="${loaiSPForm.listLoaiSPCon}">
                                                        <logic:equal name="loaiSPCon" property="maLoaiCha" value="${loaiSPCha.maLoai}">
                                                            <li>
                                                                <html:link action="category" paramId="cat" paramName="loaiSPCon" paramProperty="maLoai">
                                                                    ${loaiSPCon.tenLoai}
                                                                </html:link>
                                                            </li>
                                                        </logic:equal>
                                                    </logic:iterate>
                                                </ul>
                                            </div>
                                        </logic:equal>
                                    </logic:iterate>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="about.do">Giới thiệu</a>
                        </li>
                        <li>
                            <a href="contact.do">Liên hệ</a>
                        </li>
                    </ul>
                    <!-- MOBILE MENU -->
                    <div id="mobile-menu" class="dl-menuwrapper visible-xs visible-sm">
                        <button class="dl-trigger"><i class="iconfont-reorder round-icon"></i></button>
                        <ul class="dl-menu">
                            <li class="active">
                                <a href="javsacript:void(0);">Trang chủ</a>
                            </li>
                            <li>
                                <a href="javsacript:void(0);">Thời trang nữ</a>
                                <ul class="dl-submenu">
                                    <logic:iterate id="loaiSPCha" collection="${loaiSPForm.listLoaiSPCha}">
                                        <logic:equal name="loaiSPCha" property="gioiTinh" value="true">
                                            <li>
                                                <a href="#">${loaiSPCha.tenLoai}</a>
                                                <ul class="dl-submenu">
                                                    <logic:iterate id="loaiSPCon" collection="${loaiSPForm.listLoaiSPCon}">
                                                        <logic:equal name="loaiSPCon" property="maLoaiCha" value="${loaiSPCha.maLoai}">
                                                            <li>
                                                                <html:link action="category" paramId="cat" paramName="loaiSPCon" paramProperty="maLoai">
                                                                    ${loaiSPCon.tenLoai}
                                                                </html:link>
                                                            </li>
                                                        </logic:equal>
                                                    </logic:iterate>
                                                </ul>
                                            </li>
                                        </logic:equal>
                                    </logic:iterate>
                                </ul>
                            </li>
                            <li>
                                <a href="javsacript:void(0);">Thời trang nam</a>
                                <ul class="dl-submenu">
                                    <logic:iterate id="loaiSPCha" collection="${loaiSPForm.listLoaiSPCha}">
                                        <logic:equal name="loaiSPCha" property="gioiTinh" value="false">
                                            <li>
                                                <a href="#">${loaiSPCha.tenLoai}</a>
                                                <ul class="dl-submenu">
                                                    <logic:iterate id="loaiSPCon" collection="${loaiSPForm.listLoaiSPCon}">
                                                        <logic:equal name="loaiSPCon" property="maLoaiCha" value="${loaiSPCha.maLoai}">
                                                            <li>
                                                                <html:link action="category" paramId="cat" paramName="loaiSPCon" paramProperty="maLoai">
                                                                    ${loaiSPCon.tenLoai}
                                                                </html:link>
                                                            </li>
                                                        </logic:equal>
                                                    </logic:iterate>
                                                </ul>
                                            </li>
                                        </logic:equal>
                                    </logic:iterate>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>