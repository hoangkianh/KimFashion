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
        <title>Sửa sản phẩm | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Sửa sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <section class="section">
                    <div class="container">
                        <div class="row">
                            <div class="product-single-details" data-product-id="<bean:write name="SanPhamForm" property="maSP" />">
                                <!--                                 PRODUCT PREVIEW 
                                                                <div class="col-xs-12 col-sm-4">
                                                                    <div class="product-preview">
                                                                        <div class="big-image">
                                                                            <a href="<bean:write name="SanPhamForm" property="hinhAnh"/>" data-toggle="lightbox">
                                                                                <img src="<bean:write name="SanPhamForm" property="hinhAnh"/>"
                                                                                     alt="<bean:write name="SanPhamForm" property="tenSP"/>" />
                                                                            </a>
                                                                        </div>
                                                                        <ul class="thumbs unstyled clearfix">
                                <logic:iterate id="hinhAnh" name="SanPhamForm" property="listHinhAnh">
                                    <li>
                                        <a href="<bean:write name="hinhAnh" property="duongDan"/>">
                                            <img src="<bean:write name="hinhAnh" property="duongDan"/>" alt="" />
                                        </a>
                                    </li>
                                </logic:iterate>
                            </ul>
                        </div>
                    </div>
                    <div class="space40 visible-xs"></div>-->

                                <!-- PRODUCT DETAILS -->
                                <div class="col-xs-12 col-sm-8">
                                    <section class="product-details">
                                        <h3 class="uppercase text-bold text-center"><span>sửa thông tin sản phẩm</span></h3>
                                        <html:errors/>
                                        <html:form action="/SuaSanPham" method="POST" styleClass="form-horizontal" styleId="formSanPham">
                                            <input type="hidden" value="<bean:write name="SanPhamForm" property="maSP"/>"/>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="tenSP">Tên sản phẩm</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="tenSP" class="form-control" 
                                                           id="tenSP" placeholder="Tên đăng nhập"
                                                           value="<bean:write name="SanPhamForm" property="tenSP"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="code">Code</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="code" class="form-control" 
                                                           id="code" placeholder="Code"
                                                           value="<bean:write name="SanPhamForm" property="code"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="mauSac">Màu sắc</label>
                                                <div class="col-sm-5">
                                                    <input type="text" name="mauSac" class="form-control" 
                                                           id="mauSac" placeholder="Màu sắc"
                                                           value="<bean:write name="SanPhamForm" property="mauSac"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label">Giới tính</label>
                                                <div class="col-sm-8">
                                                    <div class="stylish-input">
                                                        <c:if test="${SanPhamForm.gioiTinh eq true}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="prettyCheckable" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="prettyCheckable" checked="checked" />Nữ</label>
                                                            </c:if>
                                                            <c:if test="${SanPhamForm.gioiTinh eq false}">
                                                            <label><input type="radio" name="gioiTinh" value="False" class="prettyCheckable" checked="checked" />Nam</label>
                                                            <label><input type="radio" name="gioiTinh" value="True" class="prettyCheckable" />Nữ</label>
                                                            </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="giaBan">Giá bán (VND)</label>
                                                <div class="col-sm-2">
                                                    <input type="text" name="giaBan" class="form-control" 
                                                           id="giaBan" placeholder="Giá bán"
                                                           value="<bean:write name="SanPhamForm" property="giaBan"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-8 col-sm-offset-4">
                                                    <c:if test="${SanPhamForm.sanPhamMoi eq true}">
                                                        <input type="checkbox" name="luuLai" class="prettyCheckable" data-label="Sản phẩm mới" checked="checked">
                                                    </c:if>
                                                    <c:if test="${SanPhamForm.sanPhamMoi eq false}">
                                                        <input type="checkbox" name="luuLai" class="prettyCheckable" data-label="Sản phẩm mới">
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-8 col-sm-offset-4">
                                                    <c:if test="${SanPhamForm.dangKM eq true}">
                                                        <input type="checkbox" name="luuLai" class="prettyCheckable" data-label="Đang khuyến mại" checked="checked">
                                                    </c:if>
                                                    <c:if test="${SanPhamForm.dangKM eq false}">
                                                        <input type="checkbox" name="luuLai" class="prettyCheckable" data-label="Đang khuyến mại">
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="giaBanKM">Giá bán KM (VND)</label>
                                                <div class="col-sm-2">
                                                    <input type="text" name="giaBanKM" class="form-control" 
                                                           id="giaBanKM" placeholder="Giá bán KM"
                                                           value="<bean:write name="SanPhamForm" property="giaBanKM"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="maLoaiSP">Phân loại</label>
                                                <div class="col-sm-8">
                                                    <div class="inline-middle styled-dd">
                                                        <html:select name="SanPhamForm" property="maLoaiSP" styleId="maLoaiSP">
                                                            <html:optionsCollection name="SanPhamForm" property="listLoaiSP" label="tenLoai" value="maLoai"/>
                                                        </html:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="maThuongHieu">Thương hiệu</label>
                                                <div class="col-sm-8">
                                                    <div class="inline-middle styled-dd">
                                                        <html:select name="SanPhamForm" property="maThuongHieu" styleId="maThuongHieu">
                                                            <html:optionsCollection name="SanPhamForm" property="listThuongHieu" label="tenThuongHieu" value="maThuongHieu"/>
                                                        </html:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="maBST">Thương hiệu</label>
                                                <div class="col-sm-8">
                                                    <div class="inline-middle styled-dd">
                                                        <html:select name="SanPhamForm" property="maBST" styleId="maBST">
                                                            <option>--Chọn bộ sưu tập--</option>
                                                            <html:optionsCollection name="SanPhamForm" property="listBoSuuTap" label="tenBST" value="maBST"/>
                                                        </html:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label" for="moTa">Mô tả</label>
                                                <div class="col-sm-8">
                                                    <div class="inline-middle">
                                                        <textarea id="moTa" class="form-control" name="moTa"
                                                                  style="height: 178px; width: 400px;"><bean:write name="SanPhamForm" property="moTa"/></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pull-right">
                                                <input type="submit" class="btn btn-primary btn-round" value="Sửa sản phẩm" />
                                                <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                            </div>
                                        </html:form>
                                        <article class="entry-content">
                                            <figure>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12">
                                                        <h5 class="subheader uppercase">Size:</h5>
                                                        <div class="inline-middle">
                                                            <logic:iterate id="size" name="SanPhamForm" property="listSize">
                                                                <bean:write name="size" property="tenSize"/>
                                                            </logic:iterate>
                                                        </div>
                                                    </div>
                                                </div>
                                            </figure>
                                        </article>
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
        <script src="resource/js/jquery-1.7.2.min.js"></script>
        <script src="resource/js/jquery.wysiwyg.js"></script>
        <script type="text/javascript">
            $(function()
            {
                $('#moTa').wysiwyg();
            });
        </script>
    </body>
</html>
