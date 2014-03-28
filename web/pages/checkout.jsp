<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty cookie.cart}">
    <c:redirect url="/"/>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Thanh toán | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
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
                            <li class="active">Thanh toán</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <div class="m-t-b clearfix">

                            <!-- SIDEBAR -->
                            <aside class="col-xs-12 col-sm-4 col-md-3">
                                <section class="side-section">
                                    <h3 class="uppercase text-bold"><span class="text-xs">Bạn nên xem</span></h3>

                                    <ul class="nav nav-tabs nav-stacked">
                                        <li><a href="products.do">Danh mục sản phẩm</a></li>															
                                        <li><a href="https://facebook.com/pages/KimFashion"><i class="iconfont-facebook-sign"></i> Facebook của chúng tôi</a></li>
                                        <li><a href="about.do">Giới thiệu cửa hàng</a></li>														
                                        <li><a href="contact.do">Liên hệ</a></li>															
                                    </ul>
                                </section>
                            </aside>

                            <section class="col-xs-12 col-sm-8 col-md-9">
                                <div class="panel-group checkout" id="checkout-collapse">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="javascript:void(0);">
                                                    <span class="step">01</span>
                                                    tài khoản
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse1" class="panel-collapse">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <form class="form-horizontal">
                                                            <fieldset>
                                                                <legend class="title">tôi đã có tài khoản</legend>
                                                                <div class="inner">
                                                                    <p>Tài khoản của tôi là</p>
                                                                    <div class="form-login">
                                                                        <div class="form-group stylish-input">
                                                                            <label for="inputTenDangNhap" class="col-xs-12 col-sm-3 control-label required">Email</label>
                                                                            <div class="col-lg-7">
                                                                                <input type="text" class="form-control" id="inputTenDangNhap">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group stylish-input">
                                                                            <label for="inputPassword" class="col-xs-12 col-sm-3 control-label required">Password</label>
                                                                            <div class="col-lg-7">
                                                                                <input type="password" class="form-control" id="inputPassword">
                                                                                <a href="#" class="help-block">Quên mật khẩu?</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <button class="btn btn-primary btn-round padder">Đăng nhập và mua hàng</button>
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                    <div class="space40 visible-xs"></div>
                                                    <div class="col-xs-12 col-sm-6">
                                                        <fieldset>
                                                            <legend class="title">Tôi chưa có tài khoản</legend>
                                                            <div class="inner">
                                                                <p>Hãy làm theo hướng dẫn trong trang đăng ký tài khoản</p>
                                                                <div class="space20 clearfix"></div>
                                                                <a href="register.do" class="btn btn-default btn-round uppercase padder">Đăng ký và mua hàng</a>
                                                            </div>
                                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="javascript:void(0);">
                                                    <span class="step">02</span>
                                                    thông tin khách hàng
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse2">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputHoTen" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputHoTen" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputAddress" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" id="inputEmail" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputDienThoai" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputDienThoai" />
                                                                </div>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="javascript:void(0);">
                                                    <span class="step">03</span>
                                                    thông tin giao hàng
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse3" class="panel-collapse">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputHoTen1" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputHoTen1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress1" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputAddress1" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail1" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" id="inputEmail1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPhone1" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputPhone1" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="javascript:void(0);">
                                                    <span class="step">04</span>
                                                    đơn hàng
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse6" class="panel-collapse">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-10 col-sm-10 center-sm">
                                                        <table class="shop-summary text-right">
                                                            <tr>
                                                                <th>TỔNG CỘNG:</th>
                                                                <td id="tongCong"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>VẬN CHUYỂN:</th>
                                                                <td id="vanChuyen"></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h5><small>(Đơn hàng lớn hơn 1 triệu đồng sẽ được miễn phí vận chuyển)</small></h5>
                                                                </td>
                                                            </tr>
                                                            <tr class="total">
                                                                <th>Thành tiền:</th>
                                                                <td id="thanhTien"></td>
                                                            </tr>
                                                            <tr>
                                                                <th><a href="#" class="btn btn-default btn-round uppercase">Thanh toán</a></th>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/products.js"></script>
    </body>
</html>
