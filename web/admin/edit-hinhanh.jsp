<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Thay đổi hình ảnh | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="admin-product.do">Sản phẩm</a></li>
                            <li class="active">Đổi hình ảnh</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="uppercase text-bold text-center"><span>đổi hình ảnh sản phẩm</span></h3>
                                <h5 class="text-center"><small>có 5 hình ảnh cho 1 sản phẩm</small></h5>
                                <html:errors/>
                                <input type="hidden" name="maSP" value="<bean:write name="HinhAnhForm" property="maSP"/>"/>
                                <html:form action="/SuaHinhAnh" method="POST" styleClass="form-horizontal" styleId="formSanPham">
                                    <div class="col-sm-offset-3">
                                        <logic:iterate id="hinhAnh" name="HinhAnhForm" property="listHinhAnh" indexId="i">
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-2">
                                                    <a href="<bean:write name="hinhAnh" property="duongDan"/>" data-toggle="lightbox">
                                                        <img src="<bean:write name="hinhAnh" property="duongDan"/>" width="100" class="img-thumbnail"/>
                                                    </a>                                    
                                                </div>
                                                <c:if test="${i eq 0}">
                                                    <i class="iconfont-check"></i> Đây là ảnh chính của sản phẩm
                                                </c:if>
                                                <div class="col-sm-6">
                                                    <input type="hidden" name="maHinhAnh${i}" value="<bean:write name="hinhAnh" property="maHinhAnh"/>"/>
                                                    <input type="text" name="duongDan${i}" class="form-control" 
                                                           id="duongDan${i}" placeholder="Đường dẫn hình ảnh"
                                                           value="<bean:write name="hinhAnh" property="duongDan"/>"/>
                                                </div>
                                            </div>
                                        </logic:iterate>
                                    </div>
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <input type="submit" class="btn btn-primary btn-round" value="Cập nhật hình ảnh" />
                                        <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                    </div>
                                </html:form>
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

            $("#formSanPham").validate({
                errorClass: "text-danger text-xs",
                rules: {
                    duongDan0: {
                        required: true
                    },
                    duongDan1: {
                        required: true
                    },
                    duongDan2: {
                        required: true
                    },
                    duongDan3: {
                        required: true
                    },
                    duongDan4: {
                        required: true
                    }
                },
                messages: {
                    duongDan0: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    },
                    duongDan1: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    },
                    duongDan2: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    },
                    duongDan3: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    },
                    duongDan4: {
                        required: "Bạn cần điền đường dẫn ảnh"
                    }
                }
            });
        </script>
    </body>
</html>
