<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
    <c:if test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>        
    </c:if>
    <c:if test="${not empty cookie.kimfashion}">
        <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
    </c:if>
    <c:choose>
        <c:when test="${s[2] eq true}">
            <c:redirect url="/admin.do" />                
        </c:when>
        <c:otherwise>
            <c:redirect url="/" />                
        </c:otherwise>
    </c:choose>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>ĐĂNG KÝ THÀNH VIÊN | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Đăng ký thành viên</li>
                        </ul>
                    </div>
                </div>
            </div>
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

                            <section class="col-xs-12 col-sm-5 col-md-5 col-sm-offset-1">
                                <h3 class="uppercase text-bold text-center"><span>đăng ký làm thành viên</span></h3>
                                <html:errors/>
                                <html:form action="/dangky" method="POST" styleClass="form-horizontal" styleId="formDangKy">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="tenDangNhap">Tên đăng nhập</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="tenDangNhap" class="form-control" 
                                                   id="tenDangNhap" placeholder="Tên đăng nhập"
                                                   value="<bean:write name="ThanhVienForm" property="tenDangNhap"/>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="password">Mật khẩu</label>
                                        <div class="col-sm-8">
                                            <input type="password" name="password" class="form-control" 
                                                   id="password" placeholder="Mật khẩu" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="matKhau2">Nhập lại mật khẩu</label>
                                        <div class="col-sm-8">
                                            <input type="password" name="password2" class="form-control" 
                                                   id="matKhau2" placeholder="Nhập lại mật khẩu"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="email">Email</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="email" class="form-control"
                                                   id="email" placeholder="kimfashion@example.com"
                                                   value="<bean:write name="ThanhVienForm" property="email"/>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="hoTen">Họ tên</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="hoTen" class="form-control" 
                                                   id="hoTen" placeholder="Họ tên"
                                                   value="<bean:write name="ThanhVienForm" property="hoTen"/>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Giới tính</label>
                                        <div class="col-sm-8">
                                            <div class="stylish-input">
                                                <label><input type="radio" name="gioiTinh" value="False" class="prettyCheckable" checked="checked" />Nam</label>
                                                <label><input type="radio" name="gioiTinh" value="True" class="prettyCheckable" />Nữ</label>
                                            </div>
                                            <small class="text-xs text-muted">Chúng tôi sẽ tìm những sản phẩm phù hợp với bạn</small>
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <input type="submit" class="btn btn-primary" value="Đăng ký"/>
                                        <input type="reset" class="btn btn-default" value="Nhập lại"/>
                                    </div>
                                </html:form>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script type="text/javascript" src="resource/js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            $.validator.addMethod("userNameRegex", function(value, element, regex) {
                return this.optional(element) || regex.test(value);
            }, "Tên đăng nhập chỉ bao gồm a-z 0-9 _");

            $.validator.addMethod("checkUser", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkUser/" + value,
                    dataType: "text",
                    async: false,
                    success: function(data) {
                        if (data === "true") {
                            exist = true;
                        } else {
                            exist = false;
                        }
                    }
                });
                return this.optional(element) || exist;
            }, "Tên đăng nhập này đã được sử dụng");

            $.validator.addMethod("checkEmail", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkEmail/" + value,
                    dataType: "text",
                    async: false,
                    success: function(data) {
                        if (data === "true") {
                            exist = true;
                        } else {
                            exist = false;
                        }
                    }
                });
                return this.optional(element) || exist;
            }, "Email này đã được đăng kí");

            $("#formDangKy").validate({
                errorClass: "text-danger",
                rules: {
                    tenDangNhap: {
                        required: true,
                        maxlength: 30,
                        minlength: 6,
                        userNameRegex: /^[a-zA-Z0-9_]*$/,
                        checkUser: true
                    },
                    hoTen: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true,
                        checkEmail: true
                    },
                    password: {
                        required: true,
                        maxlength: 30,
                        minlength: 6
                    },
                    password2: {
                        equalTo: "#password"
                    }
                },
                messages: {
                    tenDangNhap: {
                        required: "Bạn cần điền tên đăng nhập",
                        maxlength: "Tên đăng nhập dài tối đa 30 kí tự",
                        minlength: "Tên đăng nhập dài tối thiểu 6 kí tự"
                    },
                    hoTen: {
                        required: "Bạn cần điền họ tên"
                    },
                    email: {
                        required: "Bạn cần điền email",
                        email: "Địa chỉ email không hợp lệ"
                    },
                    password: {
                        required: "Bạn cần điền mật khẩu",
                        maxlength: "Mật khẩu dài tối đa 30 kí tự",
                        minlength: "Mật khẩu dài tối thiểu 6 kí tự"
                    },
                    password2: {
                        equalTo: "Mật khẩu nhập lại không chính xác"
                    }
                }
            });
        </script>
    </body>
</html>
