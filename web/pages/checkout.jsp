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
        <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
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
        <link rel="stylesheet" href="resource/css/bootstrap-datetimepicker.min.css"/>
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
                            <li><a href="/">Trang chủ</a></li>
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
                                        <li><a href="https://www.facebook.com/pages/Kim-Fashion/"><i class="iconfont-facebook-sign"></i> Facebook của chúng tôi</a></li>
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
                                    <c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
                                        <html:form action="/thanhtoan" method="POST" styleClass="form-horizontal" styleId="formThanhToan">
                                            <input type="hidden" name="maTV" value="<c:out value="${s[0]}"/>"/>
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
                                                                    <label for="hoTen" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="hoTen" id="hoTen" value="<c:out value="${s[3]}"/>" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group stylish-input">
                                                                    <label for="diaChiNguoiMua" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="diaChiNguoiMua" id="diaChiNguoiMua" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-6">
                                                                <div class="form-group stylish-input">
                                                                    <label for="email" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="email" class="form-control" name="email" id="email" value="<c:out value="${s[4]}"/>"  />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group stylish-input">
                                                                    <label for="sdtNguoiMua" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="sdtNguoiMua" id="sdtNguoiMua" />
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
                                                <div class="panel-body">
                                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                                        <div class="form-group stylish-input">
                                                            <div class="col-sm-4 col-lg-4">
                                                                <input type="checkbox" id="checkBoxGiaoHang" name="luuLai"
                                                                       class="prettyCheckable" checked="checked" 
                                                                       data-label="Giao hàng tới địa chỉ trên hóa đơn" >
                                                            </div>
                                                            <div class="col-sm-6 col-lg-6">
                                                                <div class="form-group stylish-input">
                                                                    <label for="ngayGiaoHang" class="col-sm-4 col-lg-4 control-label required">Ngày giao hàng</label>
                                                                    <div class="col-sm-8 col-lg-8 date input-group" id="datetimepicker1">
                                                                        <input type="text" class="form-control" name="ngayGiaoHang" id="ngayGiaoHang" 
                                                                               data-format="dd/MM/yyyy" />
                                                                        <span class="input-group-addon"><i data-time-icon="iconfont-time" data-date-icon="iconfont-calendar"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="checkout-collapse3" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-12 col-md-6">
                                                                <div class="form-group stylish-input">
                                                                    <label for="hoTenNguoiNhan" class="col-sm-4 col-lg-4 control-label required">Họ tên</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="hoTenNguoiNhan" id="hoTenNguoiNhan" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group stylish-input">
                                                                    <label for="diaChiGiaoHang" class="col-sm-4 col-lg-4 control-label required">Địa chỉ</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="diaChiGiaoHang" id="diaChiGiaoHang" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group stylish-input">
                                                                    <label for="sdtNguoiNhan" class="col-sm-4 col-lg-4 control-label required">Điện thoại</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <input type="text" class="form-control" name="sdtNguoiNhan" id="sdtNguoiNhan" />
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
                                                            <div class="col-xs-6 col-sm-6 center-sm">
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
                                                                        <c:choose>
                                                                            <c:when  test="${empty sessionScope.kimfashion and empty cookie.kimfashion}">
                                                                                <td colspan="2">
                                                                                    <p>Hãy trở thành thành viên của Kimfashion để có thể thanh toán</p>
                                                                                </td>   
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <th>
                                                                                    <input type="submit" class="btn btn-default btn-round uppercase" value="Thanh toán"/>
                                                                                </th>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="col-xs-6 col-sm-6 center-sm">
                                                                <div class="form-group">
                                                                    <label for="ghiChu" class="col-sm-4 col-lg-4 control-label">Ghi chú</label>
                                                                    <div class="col-sm-8 col-lg-8">
                                                                        <textarea class="form-control" name="ghiChu" rows="10"></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </html:form>
                                    </c:if>
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
        <script src="resource/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript">

            $.validator.addMethod("checkPhone", function(value, element) {
                var kq = false;
                if (/^[0][1-9][0-9]{8,9}$/.test(value)) {
                    kq = true;
                }
                return this.optional(element) || kq;
            }, "Bạn cần điền số điện thoại hợp lệ");
            
            // kiểm tra ngày giao hàng có trước ngày hôm nay k?
            $.validator.addMethod("checkDate", function(value, element) {
                var kq = false;
                var dateString = value.split("/"); // cắt chuỗi theo dấu phân cách / VD: 30/12/2014 --> 30, 12, 2014
                
                // chuyển lại thành 2014, 12, 30 để đúng định dạng Date trong javascript
                // dateString[1] - 1 vì tháng tính từ 0 - 11. VD: dateString[1] = 12, ==> dateString[1] - 1= 11 (11 là tháng thứ 12 tính từ 0)
                var ngayGiaoHang = new Date(dateString[2], dateString[1] - 1, dateString[0]).getTime();
                
                var ngayHomNay = new Date().getTime(); // getTime() lấy ra timestamp của ngày
                
                if (ngayGiaoHang >= ngayHomNay) { // so sánh, nếu ngày giao hàng >= ngày hôm nay --> OK
                    kq = true;
                }
                
                return this.optional(element) || kq;
            }, "Ngày giao hàng không thể trước ngày hôm nay");

            $("#formThanhToan").validate({
                errorClass: "text-danger",
                rules: {
                    hoTen: {
                        required: true,
                    },
                    diaChiNguoiMua: {
                        required: true,
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    sdtNguoiMua: {
                        required: true,
                        checkPhone: true
                    },
                    ngayGiaoHang: {
                        required: true,
                        checkDate: true
                    },
                    hoTenNguoiNhan: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    },
                    diaChiGiaoHang: {
                        required: {
                            depends: function() {
                                return !$('#checkBoxGiaoHang').is(':checked');
                            }
                        }
                    },
                    sdtNguoiNhan: {
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
                    },
                    ghiChu: {
                        maxlength: 200
                    }
                },
                messages: {
                    hoTen: {
                        required: "Bạn cần điền họ tên của mình"
                    },
                    diaChiNguoiMua: {
                        required: "Bạn cần điền địa chỉ của mình"
                    },
                    email: {
                        required: "Bạn cần điền email",
                        email: "Địa chỉ email không hợp lệ"
                    },
                    sdtNguoiMua: {
                        required: "Bạn cần điền số điện thoại của mình"
                    },
                    hoTenNguoiNhan: {
                        required: "Bạn cần điền họ tên người nhận"
                    },
                    ngayGiaoHang: {
                        required: "Bạn cần chọn ngày giao hàng"
                    },
                    diaChiGiaoHang: {
                        required: "Bạn cần điền địa chỉ giao hàng"
                    },
                    sdtNguoiNhan: {
                        required: "Bạn cần điền số điện thoại người nhận"
                    },
                    ghiChu: {
                        maxlength: "Ghi chú dài tối đa 200 kí tự"
                    }
                }
            });

            $('#checkBoxGiaoHang').change(function() {
                $('#checkout-collapse3').collapse('toggle');
            });

            $('#datetimepicker1').datetimepicker({
                language: 'vi-VN',
                pickTime: false
            });
        </script>
    </body>
</html>
