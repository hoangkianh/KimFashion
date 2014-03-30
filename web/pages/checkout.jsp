<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty cookie.cart}">
    <c:redirect url="/"/>
</c:if>
<c:choose>
    <c:when test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>
    </c:when>
    <c:otherwise>
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>
    </c:otherwise>
</c:choose>
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
                                    <c:if test="${empty sessionScope.kimfashion and empty cookie.kimfashion}">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        tài khoản
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="checkout-collapse1" class="panel-collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <html:form action="/dangnhap" method="POST" styleClass="form-horizontal" styleId="formDangNhap">
                                                                <fieldset>
                                                                    <legend class="title">tôi đã có tài khoản</legend>
                                                                    <div class="inner">
                                                                        <p>Tài khoản của tôi là</p>
                                                                        <div class="form-login">
                                                                            <div class="form-group stylish-input">
                                                                                <label class="col-sm-4 control-label" for="tenDangNhap">Tên đăng nhập</label>
                                                                                <div class="col-lg-7">
                                                                                    <input type="text" name="tenDangNhap" class="form-control" 
                                                                                           id="tenDangNhap" placeholder="Tên đăng nhập"
                                                                                           value="<bean:write name="DangNhapForm" property="tenDangNhap"/>"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group stylish-input">
                                                                                <label class="col-sm-4 control-label" for="password">Mật khẩu</label>
                                                                                <div class="col-lg-7">
                                                                                    <input type="password" name="password" class="form-control" 
                                                                                           id="password" placeholder="Mật khẩu" />
                                                                                    <a href="forgotpass.do" class="help-block">Quên mật khẩu?</a>
                                                                                    <input type="checkbox" name="luuLai" class="prettyCheckable" data-label="Nhớ tôi lại" >
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <button class="btn btn-primary btn-round padder">Đăng nhập và mua hàng</button>
                                                                    </div>
                                                                </fieldset>
                                                            </html:form>
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
                                    </c:if>
                                    <html:form action="/thanhtoan" method="POST" styleClass="form-horizontal" styleId="formThanhToan">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        thông tin xuất hóa đơn
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="checkout-collapse2">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputHoTen" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputHoTen" id="inputHoTen" value="<c:out value="${s[3]}"/>" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputAddress" id="inputAddress" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" name="inputEmail" id="inputEmail" value="<c:out value="${s[4]}"/>"  />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputDienThoai" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputDienThoai" id="inputDienThoai" />
                                                                </div>
                                                            </div>                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        <i class="iconfont-truck"></i>
                                                        thông tin giao hàng 
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group stylish-input">
                                                    <div class="col-sm-8 col-lg-8">
                                                        <input type="checkbox" id="checkBoxGiaoHang" name="luuLai"
                                                               class="prettyCheckable" checked="checked" 
                                                               data-label="Giao hàng tới địa chỉ trên hóa đơn" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="checkout-collapse3" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputHoTen1" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputHoTen1" id="inputHoTen1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress1" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputAddress1" id="inputAddress1" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail1" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" name="inputEmail1" id="inputEmail1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPhone1" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" name="inputPhone1" id="inputPhone1" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
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
                                                                    <th>
                                                                        <input type="submit" class="btn btn-default btn-round uppercase" value="Thanh toán"/>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </html:form>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/products.js"></script>
        <script type="text/javascript" src="resource/js/jquery.validate.min.js"></script>
        <script type="text/javascript">

            $.validator.addMethod("checkPhone", function(value, element) {
                var kq = false;
                if (/^[0][1-9][0-9]{8,9}$/.test(value)) {
                    kq = true;
                }
                return this.optional(element) || kq;
            }, "Bạn cần điền số điện thoại hợp lệ");

            $("#formThanhToan").validate({
                errorClass: "text-danger",
                rules: {
                    inputHoTen: {
                        required: true,
                    },
                    inputAddress: {
                        required: true,
                    },
                    inputEmail: {
                        required: true,
                        email: true
                    },
                    inputDienThoai: {
                        required: true,
                        checkPhone: true
                    },
                    inputHoTen1: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    },
                    inputAddress1: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    },
                    inputEmail1: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    },
                    inputDienThoai1: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        },
                        checkPhone: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    }
                },
                messages: {
                    inputHoTen: {
                        required: "Bạn cần điền họ tên của mình"
                    },
                    inputAddress: {
                        required: "Bạn cần điền địa chỉ của mình"
                    },
                    inputEmail: {
                        required: "Bạn cần điền email",
                        email: "Địa chỉ email không hợp lệ"
                    },
                    inputDienThoai: {
                        required: "Bạn cần điền số điện thoại của mình"
                    },
                    inputHoTen1: {
                        required: "Bạn cần điền họ tên người nhận"
                    },
                    inputAddress1:{
                        required: "Bạn cần điền địa chỉ người nhận"                        
                    },
                    inputEmail1: {
                        required: "Bạn cần điền email người nhận",
                        email: "Địa chỉ email không hợp lệ"
                    },
                    inputDienThoai1: {
                        required: "Bạn cần điền số điện thoại người nhận"
                    },
                }
            });

            $('#checkBoxGiaoHang').change(function() {
                $('#checkout-collapse3').collapse('toggle');
            });
        </script>
    </body>
</html>
