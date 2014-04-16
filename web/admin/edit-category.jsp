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
        <title>Sửa loại sản phẩm | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="admin-category.do">Loại sản phẩm</a></li>
                            <li class="active">Sửa loại sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <div class="product-single-details" data-product-id="<bean:write name="LoaiSPForm" property="maLoai" />">
                                <div class="col-xs-12 col-sm-3"></div>
                                <div class="col-xs-12 col-sm-6">
                                    <section class="product-details">
                                        <h3 class="uppercase text-bold text-center"><span>sửa thông tin loại sản phẩm</span></h3>
                                        <html:errors/>
                                        <html:form action="/SuaLoaiSP" method="POST" styleClass="form-horizontal" styleId="formLoaiSP">
                                            <input type="hidden" name="maLoai" value="<bean:write name="LoaiSPForm" property="maLoai"/>"/>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="tenLoai">Tên loại sản phẩm</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="tenLoai" class="form-control" 
                                                           id="tenLoai" placeholder="Tên loại sản phẩm"
                                                           value="<bean:write name="LoaiSPForm" property="tenLoai"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase">Giới tính</label>
                                                <div class="col-sm-8">
                                                    <div class="stylish-input">
                                                        <c:if test="${LoaiSPForm.gioiTinh eq true}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" checked="checked" />Nữ</label>
                                                            </c:if>
                                                            <c:if test="${LoaiSPForm.gioiTinh eq false}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" checked="checked" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" />Nữ</label>
                                                            </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label for="maLoaiCha" class="col-sm-4 control-label subheader uppercase">Loại sản phẩm cha</label>
                                                <div class="col-sm-8">    
                                                    <div class="inline-middle styled-dd">
                                                        <html:select name="LoaiSPForm" property="maLoaiCha" styleId="selectLoaiSPCha">
                                                            <html:optionsCollection name="LoaiSPForm" property="listLoaiSPChaByGioiTinh" label="tenLoai" value="maLoai"/>
                                                        </html:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <input type="submit" class="btn btn-primary btn-round" value="Cập nhật sản phẩm" />
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
            // kiểm tra tên loai trùng lặp
            $.validator.addMethod("checkTenLoaiSP", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkTenLoaiSP/" + value + "/" + $('input:radio[name=gioiTinh]:checked').val(),
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
            }, "Loại sản phẩm đã tồn tại. Bạn hãy điền tên loại SP khác.");

            $('#formLoaiSP').validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenLoai: {
                        required: true,
                        maxlength: 100,
                        minlength: 2,
                        checkTenLoaiSP: true
                    },
                    gioiTinh: {
                        checkTenLoaiSP: true
                    }
                },
                messages: {
                    tenLoai: {
                        required: "Bạn cần điền tên loại sản phẩm",
                        maxlength: "Tên loại sản phẩm dài tối đa 100 kí tự",
                        minlength: "Tên loại sản phẩm dài tối thiểu 2 kí tự"
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
