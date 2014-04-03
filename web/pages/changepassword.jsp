<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.kimfashion and empty cookie.kimfashion}">
    <c:redirect url="/" />
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Đổi mật khẩu | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">đổi mật khẩu</li>
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
                                    <ul class="nav nav-tabs nav-stacked">
                                        <li><a href="updateinfo.do">Cập nhật thông tin</a></li>															
                                        <li class="active"><a href="#">Đổi mật khẩu</a></li>															
                                    </ul>
                                </section>
                            </aside>

                            <section class="col-xs-12 col-sm-5 col-md-5 col-sm-offset-1">
                                <h3 class="uppercase text-bold text-center"><span>đổi mật khẩu</span></h3>
                                <html:errors/>
                                <html:form action="/CapNhatMatKhau" method="POST" styleClass="form-horizontal" styleId="formCapNhat">
                                    <div class="form-group stylish-input">
                                        <label class="col-sm-5 control-label" for="password">Mật khẩu cũ</label>
                                        <div class="col-sm-7">
                                            <input type="password" name="password" class="form-control" 
                                                   id="password" placeholder="Mật khẩu cũ"/>
                                        </div>
                                    </div>
                                    <div class="form-group stylish-input">
                                        <label class="col-sm-5 control-label" for="passwordMoi">Mật khẩu mới</label>
                                        <div class="col-sm-7">
                                            <input type="password" name="passwordMoi" class="form-control" 
                                                   id="passwordMoi" placeholder="Mật khẩu mới"/>
                                        </div>
                                    </div>
                                    <div class="form-group stylish-input">
                                        <label class="col-sm-5 control-label" for="passwordMoi2">Nhập lại mật khẩu mới</label>
                                        <div class="col-sm-7">
                                            <input type="password" name="passwordMoi2" class="form-control" 
                                                   id="passwordMoi2" placeholder="Nhập lại mật khẩu mới"/>
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <input type="submit" class="btn btn-primary" value="Cập nhật"/>
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
             $("#formCapNhat").validate({
                errorClass: "text-danger",
                rules: {
                    password: {
                        required: true,
                    },
                    passwordMoi: {
                        required: true,
                        maxlength: 30,
                        minlength: 6
                    },
                    passwordMoi2: {
                        equalTo: "#passwordMoi"
                    }
                },
                messages: {
                    password: {
                        required: "Bạn cần điền mật khẩu",
                    },
                    passwordMoi: {
                        required: "Bạn cần điền mật khẩu",
                        maxlength: "Mật khẩu dài tối đa 30 kí tự",
                        minlength: "Mật khẩu dài tối thiểu 6 kí tự"
                    },
                    passwordMoi2: {
                        equalTo: "Mật khẩu nhập lại không chính xác"
                    }
                }
            });
        </script>
    </body>
</html>
