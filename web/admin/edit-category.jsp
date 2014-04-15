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
                            <!-- Modal -->
                            <div class="modal fade" id="suaSize">
                                <div class="modal-dialog modal-sm">
                                    <html:form action="/SuaSizeSP"  method="POST" styleClass="form-horizontal" styleId="formSuaSize">
                                        <input type="hidden" name="maSP" value="<bean:write name="SanPhamForm" property="maSP" />"/>
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title">Sửa size sản phẩm</h4>
                                            </div>
                                            <div class="modal-body ">
                                                <input type="hidden" name="listSizeString" id="listSizeStr" value="<bean:write name="SanPhamForm" property="listSizeString" />"/>
                                                <label for="chkSize" class="text-danger text-xs"></label>
                                                <logic:iterate id="size" name="SanPhamForm" property="listAllSize">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="chkSize" class="chkSize" id="chk<bean:write name="size" property="maSize"/>" name="maSize"
                                                                   value="<bean:write name="size" property="maSize"/>" />
                                                            <bean:write name="size" property="tenSize"/>
                                                        </label>
                                                    </div>
                                                </logic:iterate>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-primary btn-round" value="Cập nhật" />
                                                <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
                                            </div>
                                        </div>
                                    </html:form>
                                </div>
                            </div>
                            <div class="product-single-details" data-product-id="<bean:write name="SanPhamForm" property="maSP" />">
                                <!--PRODUCT PREVIEW--> 
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
                                    <a href="edit-hinhanh.do?id=<bean:write name="SanPhamForm" property="maSP"/>" class="accent-color">
                                        <i class="iconfont-pencil"></i> Đổi hình ảnh sản phẩm
                                    </a>
                                    <div class="row">
                                        <label class="col-sm-2 text-bold uppercase" for="size">Size:</label>
                                        <div class="col-sm-5">
                                            <p>
                                                <logic:iterate id="size" name="SanPhamForm" property="listSize">
                                                    <bean:write name="size" property="tenSize"/>
                                                </logic:iterate>
                                                <a href="" class="accent-color" data-toggle="modal" data-target="#suaSize"><i class="iconfont-pencil"></i> Sửa</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="space40 visible-xs"></div>

                                <!-- PRODUCT DETAILS -->
                                <div class="col-xs-12 col-sm-5">
                                    <section class="product-details">
                                        <h3 class="uppercase text-bold text-center"><span>sửa thông tin sản phẩm</span></h3>
                                        <html:errors/>
                                        <html:form action="/SuaSanPham" method="POST" styleClass="form-horizontal" styleId="formSanPham">
                                            <input type="hidden" name="maSP" value="<bean:write name="SanPhamForm" property="maSP"/>"/>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-8 col-sm-offset-4 checkbox">
                                                    <label for="chkDaAn">
                                                        <html:checkbox name="SanPhamForm" property="daAn" styleId="chkDaAn">
                                                            <c:if test="${SanPhamForm.daAn eq true}"> Sản phẩm đang ẩn </c:if>
                                                            <c:if test="${SanPhamForm.daAn eq false}"> Ẩn sản phẩm </c:if>
                                                        </html:checkbox>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="tenSP">Tên sản phẩm</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="tenSP" class="form-control" 
                                                           id="tenSP" placeholder="Tên sản phẩm"
                                                           value="<bean:write name="SanPhamForm" property="tenSP"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="code">Code</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="code" class="form-control" 
                                                           id="code" placeholder="Code"
                                                           value="<bean:write name="SanPhamForm" property="code"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase" for="mauSac">Màu sắc</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="mauSac" class="form-control" 
                                                           id="mauSac" placeholder="Màu sắc"
                                                           value="<bean:write name="SanPhamForm" property="mauSac"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <label class="col-sm-4 control-label subheader uppercase">Giới tính</label>
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
                                                <label class="col-sm-4 control-label subheader uppercase" for="giaBan">Giá bán (VND)</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="giaBan" class="form-control" 
                                                           id="giaBan" placeholder="Giá bán"
                                                           value="<bean:write name="SanPhamForm" property="giaBan"/>"/>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-8 col-sm-offset-4 checkbox">
                                                    <label for="chksanPhamMoi">
                                                        <html:checkbox name="SanPhamForm" property="sanPhamMoi" styleId="chksanPhamMoi">
                                                            Sản phẩm mới
                                                        </html:checkbox>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group stylish-input">
                                                <div class="col-sm-8 col-sm-offset-4 checkbox">
                                                    <label for="chkKhuyenMai">
                                                        <html:checkbox name="SanPhamForm" property="dangKM" styleId="chkKhuyenMai">
                                                            Sản phẩm đang khuyến mại
                                                        </html:checkbox>
                                                    </label>
                                                </div>
                                            </div>
                                            <c:if test="${SanPhamForm.dangKM eq true}">
                                                <div class="form-group stylish-input collapse in" id="collapseKM">
                                                </c:if>
                                                <c:if test="${SanPhamForm.dangKM eq false}">
                                                    <div class="form-group stylish-input collapse" id="collapseKM">                                                
                                                    </c:if>
                                                    <label class="col-sm-4 control-label subheader uppercase" for="giaBanKM">Giá bán KM (VND)</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="giaBanKM" class="form-control" 
                                                               id="giaBanKM" placeholder="Giá bán KM"
                                                               value="<bean:write name="SanPhamForm" property="giaBanKM"/>"/>
                                                    </div>
                                                </div>
                                                <div class="form-group stylish-input">
                                                    <label class="col-sm-4 control-label subheader uppercase" for="maLoaiSP">Phân loại</label>
                                                    <div class="col-sm-8">
                                                        <div class="inline-middle styled-dd">
                                                            <html:select name="SanPhamForm" property="maLoaiSP" styleId="maLoaiSP">
                                                                <html:optionsCollection name="SanPhamForm" property="listLoaiSP" label="tenLoai" value="maLoai"/>
                                                            </html:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group stylish-input">
                                                    <label class="col-sm-4 control-label subheader uppercase" for="maThuongHieu">Thương hiệu</label>
                                                    <div class="col-sm-8">
                                                        <div class="inline-middle styled-dd">
                                                            <html:select name="SanPhamForm" property="maThuongHieu" styleId="maThuongHieu">
                                                                <html:optionsCollection name="SanPhamForm" property="listThuongHieu" label="tenThuongHieu" value="maThuongHieu"/>
                                                            </html:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group stylish-input">
                                                    <label class="col-sm-4 control-label subheader uppercase" for="maBST">Bộ sưu tập</label>
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
                                                    <label class="col-sm-4 control-label subheader uppercase" for="moTa">Mô tả</label>
                                                    <div class="col-sm-8">
                                                        <div class="inline-middle">
                                                            <textarea id="moTa" class="form-control" name="moTa"
                                                                      style="height: 178px; width: 400px;"><bean:write name="SanPhamForm" property="moTa"/></textarea>
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

            $.validator.addMethod("checkGia", function(value, element) {
                return this.optional(element) || value > 0;
            }, "Bạn cần điền giá chính xác");

            $("#formSanPham").validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenSP: {
                        required: true,
                        maxlength: 100,
                        minlength: 6
                    },
                    code: {
                        required: true
                    },
                    mauSac: {
                        required: true
                    },
                    giaBan: {
                        required: true,
                        digits: true,
                        checkGia: true
                    },
                    giaBanKM: {
                        required: {
                            depends: function() {
                                return $('#chkKhuyenMai').is(':checked');
                            }
                        },
                        digits: {
                            depends: function() {
                                return $('#chkKhuyenMai').is(':checked');
                            }
                        },
                        checkGia: {
                            depends: function() {
                                return $('#chkKhuyenMai').is(':checked');
                            }
                        }
                    }
                },
                messages: {
                    tenSP: {
                        required: "Bạn cần điền tên sản phẩm",
                        maxlength: "Tên sản phẩm dài tối đa 100 kí tự",
                        minlength: "Tên sản phẩm dài tối thiểu 6 kí tự"
                    },
                    code: {
                        required: "Bạn cần điền code của sản phẩm"
                    },
                    mauSac: {
                        required: "Bạn cần điền màu sắc sản phẩm"
                    },
                    giaBan: {
                        required: "Bạn cần điền giá bán sản phẩm",
                        digits: "Bạn cần điền giá chính xác"
                    },
                    giaBanKM: {
                        required: "Bạn cần điền giá bán khuyến mại",
                        digits: "Bạn cần điền giá chính xác"
                    }
                }
            });

            $('#chkKhuyenMai').change(function() {
                $('#collapseKM').collapse('toggle');
            });

            // lấy ra string của listSizeStr
            var listSizeStr = $('#listSizeStr').val();
            var sizeArray = listSizeStr.split('|');
            // select các checkbox 
            // duyệt qua list size của sp và list size trong csdl
            // nếu có 2 size giống nhau thì select checkbox
            for (i = 0; i < sizeArray.length - 1; i++) {
                $('#chk' + sizeArray[i]).prop('checked', true);
            }


            $('.chkSize').change(function() {
                listSizeStr = "";
                $('.chkSize:checked').each(function() {
                    listSizeStr += $(this).val() + "|";
                    $('#listSizeStr').val(listSizeStr);
                    console.log("a");
                });
            });

            $('#formSuaSize').validate({
                errorClass: "text-danger text-xs",
                rules: {
                    chkSize: {
                        required: true
                    }
                },
                messages: {
                    chkSize: {
                        required: "Bạn phải chọn ít nhất 1 size"
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
