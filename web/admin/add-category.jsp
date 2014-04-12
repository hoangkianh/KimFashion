<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Thêm loại sản phẩm mới | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Thêm loại sản phẩm mới</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 col-md-12">
                                <h3 class="uppercase text-bold text-center"><span>thêm loại sản phẩm mới</span></h3>
                                <html:errors/>
                                <html:form action="/ThemLoaiSP" method="POST" styleClass="form-horizontal" styleId="formLoaiSP">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        thông tin loại sản phẩm
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-6">
                                                        <div class="form-group stylish-input">
                                                            <label for="tenLoai" class="col-sm-4 col-lg-4 control-label required">Tên loại sản phẩm</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="text" class="form-control" name="tenLoai" id="tenLoai"
                                                                       value="<bean:write name="LoaiSPForm" property="tenLoai"/>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="maLoaiCha" class="col-sm-4 control-label">Loại sản phẩm cha</label>
                                                            <div class="col-sm-8 cold-lg-8">                                                                
                                                                <html:select name="LoaiSPForm" property="maLoaiCha" styleId="selectLoaiSPCha">
                                                                    <option value="">--Chọn loại sản phẩm cha--</option>
                                                                    <html:optionsCollection name="LoaiSPForm" property="listLoaiSPChaByGioiTinh" label="tenLoai" value="maLoai"/>
                                                                </html:select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="gioiTinh" class="col-sm-4 col-lg-4 control-label required">Giới tính</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" checked="checked" data-label="Nam" />
                                                                <input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" data-label="Nữ" />
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8 col-sm-offset-4">
                                                            <input type="submit" class="btn btn-primary btn-round" value="Thêm loại sản phẩm" />
                                                            <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </html:form>
                            </section>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script type="text/javascript" src="resource/js/jquery.validate.min.js"></script>
        <script type="text/javascript">
            $('.chkGioiTinh').change(function() {
                $.ajax({
                    type: "GET",
                    url: "service/sanpham/getLoaiSPChaByGioiTinh/" + $(this).val(),
                    async: false,
                    success: function(data) {
                        // xóa dữ liệu trong select box phân loại
                        $("#selectLoaiSPCha").empty();
                        $("#selectLoaiSPCha").append(data);
                    }
                });
            });

            
           
            $('#formLoaiSP').validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenLoai: {
                        required: true,
                        maxlength: 100,
                        minlength: 6
                    },
                    
                },
                messages: {
                    tenLoai: {
                        required: "Bạn cần điền tên loại sản phẩm",
                        maxlength: "Tên loại sản phẩm dài tối đa 100 kí tự",
                        minlength: "Tên loại sản phẩm dài tối thiểu 6 kí tự"
                    }
                }
            });
        </script>
    </body>
</html>
