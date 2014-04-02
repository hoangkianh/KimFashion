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
        <title>Quên mật khẩu | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Quên mật khẩu</li>
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
                                <h3 class="uppercase text-bold text-center"><span>quên mật khẩu</span></h3>
                                <html:errors/>
                                <html:form action="/QuenMatKhau" method="POST" styleClass="form-horizontal" styleId="formQuenMK">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Email của bạn</label>
                                        <input type="text" name="email" class="form-control" 
                                               id="email" placeholder="kimfashion@example.com" />
                                    </div>
                                    <div class="pull-right">
                                        <input type="submit" class="btn btn-primary" value="Gửi"/>
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
            $.validator.addMethod("checkEmail", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkEmail/" + value,
                    dataType: "text",
                    async: false,
                    success: function(data) {
                        if (data === "false") {
                            exist = true;
                        } else {
                            exist = false;
                        }
                    }
                });
                return this.optional(element) || exist;
            }, "Email này chưa được đăng kí");

            $("#formQuenMK").validate({
                errorClass: "text-danger",
                rules: {
                    email: {
                        required: true,
                        email: true,
                        checkEmail: true
                    }
                },
                messages: {
                    email: {
                        required: "Bạn cần điền email",
                        email: "Địa chỉ email không hợp lệ"
                    }
                }
            });
        </script>
    </body>
</html>
