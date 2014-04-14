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
        <title>Thêm bộ sưu tập mới | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="admin-collection.do">Bộ sưu tập</a></li>
                            <li class="active">Thêm bộ sưu tập mới</li>
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
                                <h3 class="uppercase text-bold text-center"><span>thêm bộ sưu tập mới</span></h3>
                                <html:errors/>
                                <html:form action="/ThemBoSuuTap" method="POST" styleClass="form-horizontal" styleId="formBST">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        thông tin bộ sưu tập
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-6">
                                                        <div class="form-group stylish-input">
                                                            <label for="tenBST" class="col-sm-4 col-lg-4 control-label required">Tên bộ sưu tập</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="text" class="form-control" name="tenBST" id="tenBST"
                                                                       value="<bean:write name="BoSuuTapForm" property="tenBST"/>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="gioiTinh" class="col-sm-4 col-lg-4 control-label required">Giới tính</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" checked="checked" data-label="Nam" />
                                                                <input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" data-label="Nữ" />
                                                            </div>
                                                        </div> 
                                                        <div class="form-group stylish-input">
                                                            <label for="anhDaiDien" class="col-sm-4 col-lg-4 control-label required">Hình ảnh</label>
                                                            <div class="col-sm-2">
                                                                <a id="a-anhDaiDien" href="http://dummyimage.com/762x1100/FA6F57/fff.png&text=Kimfashion" data-toggle="lightbox">
                                                                    <img src="http://dummyimage.com/100x140/FA6F57/fff.png&text=Kimfashion" 
                                                                         id="img-anhDaiDien" width="100" class="img-thumbnail"/>
                                                                </a>           
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <input type="text" name="anhDaiDien" class="form-control txtDuongDan" 
                                                                       id="anhDaiDien" placeholder="Đường dẫn hình ảnh"
                                                                       value="<bean:write name="BoSuuTapForm" property="anhDaiDien"/>"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8 col-sm-offset-4">
                                                            <input type="submit" class="btn btn-primary btn-round" value="Thêm bộ sưu tập" />
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

            $('#formBST').validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenBST: {
                        required: true,
                        maxlength: 100,
                        minlength: 6
                    },
                    anhDaiDien: {
                        required: true
                    }
                },
                messages: {
                    tenBST: {
                        required: "Bạn cần điền tên bộ sưu tập",
                        maxlength: "Tên bộ sưu tập dài tối đa 100 kí tự",
                        minlength: "Tên bộ sưu tập dài tối thiểu 6 kí tự"
                    },
                    anhDaiDien: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    }
                }
            });
            
            /// hiển thị ảnh khi paste đường dẫn vào textbox
            $('.txtDuongDan').change(function() {
                
                // lấy đường dẫn
                var duongDan = $(this).val();

                // thay thuộc tính src của thẻ img có id tương ứng
                $('#img-anhDaiDien').attr('src', duongDan);
                // thay thuộc tính href của thẻ a có id tương ứng
                $('#a-anhDaiDien').attr('href', duongDan);
                // nếu trường hợp ảnh lỗi thì in ra ảnh mặc định
                $('.img-thumbnail').error(function() {
                    $(this).unbind('error').attr('src', 'http://dummyimage.com/100x140/FA6F57/fff.png&text=Kimfashion');

                    // thay ảnh ở thẻ a
                    $('#a-anhDaiDien').attr('href', 'http://dummyimage.com/762x1100/FA6F57/fff.png&text=Kimfashion');
                });
            });
        </script>
    </body>
</html>
