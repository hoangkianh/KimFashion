<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- nếu chưa đăng nhập -->
<c:if test="${empty sessionScope.kimfashion and empty cookie.kimfashion}">
    <c:redirect url="/login.do" />
</c:if>
<c:if test="${not empty sessionScope.kimfashion or not empty cookie.kimfashion}">
    <c:if test="${not empty sessionScope.kimfashion}">
        <c:set var="s" value="${fn:split(sessionScope.kimfashion, '~')}"/>        
    </c:if>
    <c:if test="${not empty cookie.kimfashion}">
        <c:set var="s" value="${fn:split(cookie.kimfashion.value, '%7E')}"/>
    </c:if>
    <c:if test="${s[2] ne true}">
        <c:redirect url="/" />
    </c:if>
</c:if>
<!-- nếu không phải admin redirect sang trang chủ -->
<c:if test="${s[2] ne true}">
    <c:redirect url="/"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Sửa size | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/wysiwyg.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body>        
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header-admin.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li><a href="admin.do">Trang quản trị</a></li>
                            <li><a href="admin-size.do">Size</a></li>
                            <li class="active">Sửa size</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <div class="product-single-details" data-product-id="<bean:write name="SizeForm" property="maSize" />">
                                <div class="col-xs-12 col-sm-3"></div>
                                <div class="col-xs-12 col-sm-6">
                                    <section class="product-details">
                                        <h3 class="uppercase text-bold text-center"><span>sửa thông tin size</span></h3>
                                        <html:errors/>
                                        <html:form action="/SuaSize" method="POST" styleClass="form-horizontal" styleId="formSize">
                                            <input type="hidden" name="maSize" value="<bean:write name="SizeForm" property="maSize"/>"/>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="tenSize">Tên size</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="tenSize" class="form-control" 
                                                           id="tenSize" placeholder="Tên size"
                                                           value="<bean:write name="SizeForm" property="tenSize"/>"/>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <input type="submit" class="btn btn-primary btn-round" value="Cập nhật size" />
                                                <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                            </div>
                                        </html:form>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="resource/js/products.js"></script>
        <script type="text/javascript" src="resource/js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            // kiểm tra tên size trùng lặp
            $.validator.addMethod("checkTenSize", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkTenSize/" + value,
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
            }, "Size đã tồn tại. Bạn hãy điền tên size khác.");

            $("#formSize").validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenSize: {
                        required: true,
                        maxlength: 100,
                        minlength: 1,
                        checkTenSize: true
                    }
                },
                messages: {
                    tenSize: {
                        required: "Bạn cần điền tên size",
                        maxlength: "Tên size dài tối đa 100 kí tự",
                        minlength: "Tên size dài tối thiểu 1 kí tự"
                    }
                }
            });
        </script>
        <script src="resource/js/jquery-1.7.2.min.js"></script>
        <script src="resource/js/jquery.wysiwyg.js"></script>
        <script type="text/javascript">
            $('#moTa').wysiwyg();
            $.noConflict();
        </script>
    </body>
</html>
