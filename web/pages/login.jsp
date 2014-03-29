<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
    <c:if test="${not empty sessionScope.blackpoints}">
        <c:set var="s" value="${fn:split(sessionScope.blackpoints, '~')}"/>        
    </c:if>
    <c:if test="${not empty cookie.blackpoints}">
        <c:set var="s" value="${fn:split(cookie.blackpoints.value, '~')}"/>
    </c:if>
    <c:choose>
        <c:when test="${s[2] eq true}">
            <c:redirect url="/dashboard.do" />                
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
        <title>Đăng nhập | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Đăng nhập</li>
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
                                <h3 class="uppercase text-bold"><span>đăng nhập</span></h3>
                                <html:form action="/dangnhap" method="POST" styleClass="form-horizontal" styleId="formDangNhap">
                                    <p class="text-danger"><bean:write name="DangNhapForm" property="error"/></p>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="tenDangNhap">Tên đăng nhập</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="tenDangNhap" class="form-control" 
                                                   id="tenDangNhap" placeholder="Tên đăng nhập"
                                                   value="<bean:write name="DangNhapForm" property="tenDangNhap"/>"/>
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
                                        <label class="checkbox pull-right">
                                            <input type="checkbox" name="luuLai" >
                                            Nhớ tôi lại
                                        </label>
                                        <a href="forgotpass.do">Quên mật khẩu</a>
                                    </div>
                                    <div class="pull-right">
                                        <input type="submit" class="btn btn-primary" value="Đăng nhập"/>
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

            $("#formDangNhap").validate({
                errorClass: "text-danger",
                rules: {
                    tenDangNhap: {
                        required: true,
                        maxlength: 30,
                        minlength: 6
                    },
                    password: {
                        required: true,
                        maxlength: 30,
                        minlength: 6
                    }
                },
                messages: {
                    tenDangNhap: {
                        required: "Bạn cần điền tên đăng nhập",
                        maxlength: "Tên đăng nhập dài tối đa 30 kí tự",
                        minlength: "Tên đăng nhập dài tối thiểu 6 kí tự"
                    },
                    password: {
                        required: "Bạn cần điền mật khẩu",
                        maxlength: "Mật khẩu dài tối đa 30 kí tự",
                        minlength: "Mật khẩu dài tối thiểu 6 kí tự"
                    }
                }
            });
        </script>
    </body>
</html>
