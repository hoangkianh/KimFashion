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
        <title>Cập nhật thông tin | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">Cập nhật thông tin</li>
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
                                        <li class="active"><a href="#">Cập nhật thông tin</a></li>															
                                        <li><a href="changepassword.do">Đổi mật khẩu</a></li>															
                                    </ul>
                                </section>
                            </aside>

                            <section class="col-xs-12 col-sm-5 col-md-5 col-sm-offset-1">
                                <h3 class="uppercase text-bold text-center"><span>cập nhật thông tin của bạn</span></h3>
                                <html:errors/>
                                <html:form action="/CapNhatThongTinTV" method="POST" styleClass="form-horizontal" styleId="formCapNhat">
                                    <div class="form-group stylish-input">
                                        <label class="col-sm-4 control-label" for="hoTen">Họ tên</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="hoTen" class="form-control" 
                                                   id="hoTen" placeholder="Họ tên"
                                                   value="<bean:write name="ThanhVienForm" property="hoTen"/>"/>
                                        </div>
                                    </div>
                                    <div class="form-group stylish-input">
                                        <label class="col-sm-4 control-label">Giới tính</label>
                                        <div class="col-sm-8">
                                            <div class="stylish-input">
                                                <c:if test="${ThanhVienForm.gioiTinh eq true}">
                                                    <label><input type="radio" name="gioiTinh" value="False" class="prettyCheckable" />Nam</label>
                                                    <label><input type="radio" name="gioiTinh" value="True" class="prettyCheckable" checked="checked" />Nữ</label>
                                                </c:if>
                                                <c:if test="${ThanhVienForm.gioiTinh eq false}">
                                                    <label><input type="radio" name="gioiTinh" value="False" class="prettyCheckable" checked="checked" />Nam</label>
                                                    <label><input type="radio" name="gioiTinh" value="True" class="prettyCheckable" />Nữ</label>
                                                </c:if>
                                            </div>
                                            <small class="text-xs text-muted">Chúng tôi sẽ tìm những sản phẩm phù hợp với bạn</small>
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
                    hoTen: {
                        required: true
                    }
                },
                messages: {
                    hoTen: {
                        required: "Bạn cần điền họ tên"
                    }
                }
            });
        </script>
    </body>
</html>
