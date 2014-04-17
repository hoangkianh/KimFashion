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
        <title>Sửa bộ sưu tập | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Sửa bộ sưu tập</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <div class="product-single-details" data-product-id="<bean:write name="BoSuuTapForm" property="maBST" />">
                                <div class="col-xs-12 col-sm-3"></div>
                                <div class="col-xs-12 col-sm-6">
                                    <section class="product-details">
                                        <h3 class="uppercase text-bold text-center"><span>sửa thông tin bộ sưu tập</span></h3>
                                        <html:errors/>
                                        <html:form action="/SuaBoSuuTap" method="POST" styleClass="form-horizontal" styleId="formBST">
                                            <input type="hidden" name="maBST" value="<bean:write name="BoSuuTapForm" property="maBST"/>"/>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="tenBST">Tên bộ sưu tập</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="tenBST" class="form-control" 
                                                           id="tenBST" placeholder="Tên bộ sưu tập"
                                                           value="<bean:write name="BoSuuTapForm" property="tenBST"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase">Giới tính</label>
                                                <div class="col-sm-8">
                                                    <div class="stylish-input">
                                                        <c:if test="${BoSuuTapForm.gioiTinh eq true}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" checked="checked" />Nữ</label>
                                                            </c:if>
                                                            <c:if test="${BoSuuTapForm.gioiTinh eq false}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="chkGioiTinh prettyCheckable" checked="checked" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="chkGioiTinh prettyCheckable" />Nữ</label>
                                                            </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-2">
                                                    <a id="a-anhDaiDien" href="<bean:write name="BoSuuTapForm" property="anhDaiDien"/>" data-toggle="lightbox">
                                                        <img src="<bean:write name="BoSuuTapForm" property="anhDaiDien"/>"
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
                                                <input type="submit" class="btn btn-primary btn-round" value="Cập nhật bộ sưu tập" />
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
            // kiểm tra tên BST trùng lặp
            $.validator.addMethod("checkTenBST", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkTenBST/" + value + "/" + $('input:radio[name=gioiTinh]:checked').val(),
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
            }, "Bộ sưu tập này đã tồn tại. Bạn hãy điền tên BST khác.");

            $("#formBST").validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenBST: {
                        required: true,
                        maxlength: 100,
                        minlength: 6,
                        checkTenBST: true
                    },
                    gioiTinh: {
                        checkTenBST: true
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
        <script src="resource/js/jquery-1.7.2.min.js"></script>
        <script src="resource/js/jquery.wysiwyg.js"></script>
        <script type="text/javascript">
            $('#moTa').wysiwyg();
            $.noConflict();
        </script>
    </body>
</html>
