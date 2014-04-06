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
        <title>Thêm sản phẩm mới | KimFashion - Cửa hàng thời trang online</title>
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
                            <li class="active">Thêm sản phẩm mới</li>
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
                                <h3 class="uppercase text-bold text-center"><span>thêm sản phẩm mới</span></h3>
                                <html:errors/>
                                <html:form action="/ThemSanPham" method="POST" styleClass="form-horizontal" styleId="formSanPham">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        thông tin sản phẩm
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-6">
                                                        <div class="form-group stylish-input">
                                                            <label for="tenSP" class="col-sm-4 col-lg-4 control-label required">Tên sản phẩm</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="text" class="form-control" name="tenSP" id="tenSP"
                                                                       value="<bean:write name="SanPhamForm" property="tenSP"/>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="code" class="col-sm-4 col-lg-4 control-label required">Code</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="text" class="form-control" name="code" id="code"
                                                                       value="<bean:write name="SanPhamForm" property="code"/>" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="mauSac" class="col-sm-4 col-lg-4 control-label required">Màu sắc</label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <input type="text" class="form-control" name="mauSac" id="mauSac"
                                                                       value="<bean:write name="SanPhamForm" property="mauSac"/>" />
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
                                                            <label for="giaBan" class="col-sm-4 col-lg-4 control-label required">Giá bán (VND)</label>
                                                            <div class="col-sm-4 col-lg-4">
                                                                <input type="text" class="form-control" name="giaBan" id="giaBan"
                                                                       value="<bean:write name="SanPhamForm" property="giaBan"/>"  />
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="dangKM" class="col-sm-4 col-lg-4 control-label"></label>
                                                            <div class="col-sm-8 col-lg-8">
                                                                <label>
                                                                    <html:checkbox name="SanPhamForm" property="dangKM" styleId="chkDangKM"/>
                                                                    Sản phẩm khuyến mại
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input collapse" id="collapseKM">
                                                            <label for="giaBanKM" class="col-sm-4 col-lg-4 control-label required">Giá bán khuyến mại (VND)</label>
                                                            <div class="col-sm-4 col-lg-4">
                                                                <input type="text" class="form-control" name="giaBanKM" id="giaBanKM"
                                                                       value="<bean:write name="SanPhamForm" property="giaBanKM"/>"  />
                                                            </div>
                                                        </div>    
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-6">
                                                        <div class="form-group stylish-input">
                                                            <label for="maLoaiSP" class="col-sm-4 control-label required">Phân loại</label>
                                                            <div class="col-sm-8 cold-lg-8">
                                                                <html:select name="SanPhamForm" property="maLoaiSP" styleId="selectLoaiSP">
                                                                    <option value="">--Chọn loại sản phẩm--</option>
                                                                    <html:optionsCollection name="SanPhamForm" property="listLoaiSP" label="tenLoai" value="maLoai"/>
                                                                </html:select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="maThuongHieu" class="col-sm-4 control-label required">Thương hiệu</label>
                                                            <div class="col-sm-8 cold-lg-8">
                                                                <html:select name="SanPhamForm" property="maThuongHieu" styleId="selectThuongHieu">
                                                                    <option value="">--Chọn thương hiệu sản phẩm--</option>
                                                                    <html:optionsCollection name="SanPhamForm" property="listThuongHieu" label="tenThuongHieu" value="maThuongHieu"/>
                                                                </html:select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="maBST" class="col-sm-4 control-label">Bộ sưu tập</label>
                                                            <div class="col-sm-8 cold-lg-8">                                                                
                                                                <html:select name="SanPhamForm" property="maBST" styleId="selectBST">
                                                                    <option value="">--Chọn bộ sưu tập--</option>
                                                                    <html:optionsCollection name="SanPhamForm" property="listBoSuuTap" label="tenBST" value="maBST"/>
                                                                </html:select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group stylish-input">
                                                            <label for="moTa" class="col-sm-4 control-label">Mô tả</label>
                                                            <div class="col-sm-8 cold-lg-8">
                                                                <textarea id="moTa" class="form-control" name="moTa"
                                                                          style="height: 178px; width: 300px;"><bean:write name="SanPhamForm" property="moTa"/></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-xs-12 ">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        Size
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                                        <input type="hidden" name="listSizeStringSPMoi" id="listSizeStr" value="<bean:write name="SanPhamForm" property="listSizeStringSPMoi" />"/>
                                                        <label for="chkSize" class="text-danger text-xs"></label>
                                                        <logic:iterate id="size" name="SanPhamForm" property="listAllSize">
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox" class="chkSize" name="chkSize" id="chk<bean:write name="size" property="maSize"/>" name="maSize"
                                                                           value="<bean:write name="size" property="maSize"/>" />
                                                                    <bean:write name="size" property="tenSize"/>
                                                                </label>
                                                            </div>
                                                        </logic:iterate>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-xs-12 ">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a href="javascript:void(0);">
                                                        hình ảnh sản phẩm
                                                    </a>
                                                </h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                                        <c:forEach var="i" begin="0" end="4" >
                                                            <div class="form-group stylish-input">
                                                                <div class="col-sm-2">
                                                                    <a id="a-duongDan${i}" href="http://dummyimage.com/762x1100/FA6F57/fff.png&text=Kimfashion" data-toggle="lightbox">
                                                                        <img src="http://dummyimage.com/100x140/FA6F57/fff.png&text=Kimfashion" 
                                                                             id="img-duongDan${i}" width="100" class="img-thumbnail"/>
                                                                    </a>           
                                                                </div>
                                                                <c:if test="${i eq 0}">
                                                                    <i class="iconfont-check"></i> Đây là ảnh chính của sản phẩm
                                                                </c:if>
                                                                <div class="col-sm-6">
                                                                    <input type="text" name="duongDan${i}" class="form-control txtDuongDan" 
                                                                           id="duongDan${i}" placeholder="Đường dẫn hình ảnh"
                                                                           value="<bean:write name="SanPhamForm" property="duongDan${i}"/>"/>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-sm-offset-4">
                                                    <input type="submit" class="btn btn-primary btn-round" value="Thêm sản phẩm" />
                                                    <input type="reset" class="btn btn-default btn-round" value="Nhập lại" />
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
                    url: "service/sanpham/getLoaiSPByGioiTinh/" + $(this).val(),
                    async: false,
                    success: function(data) {
                        // xóa dữ liệu trong select box phân loại
                        $("#selectLoaiSP").empty();
                        $("#selectLoaiSP").append(data);
                    }
                });
                $.ajax({
                    type: "GET",
                    url: "service/sanpham/getBSTByGioiTinh/" + $(this).val(),
                    async: false,
                    success: function(data) {
                        // xóa dữ liệu trong select box bst
                        $("#selectBST").empty();
                        $("#selectBST").append(data);
                    }
                });
            });

            // ẩn/ hiện giá KM
            $('#chkDangKM').change(function() {
                $('#collapseKM').collapse('toggle');
            });

            // hàm validate giá
            $.validator.addMethod("checkGia", function(value, element) {
                return this.optional(element) || value > 0;
            }, "Bạn cần điền giá chính xác");

            // kiểm tra code trùng lặp
            $.validator.addMethod("checkCode", function(value, element) {
                var exist;
                $.ajax({
                    type: 'POST',
                    url: "service/checkexist/checkCode/" + value,
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
            }, "Code này đã tồn tại trong sản phẩm khác");

            $('#formSanPham').validate({
                errorClass: "text-danger text-xs",
                rules: {
                    tenSP: {
                        required: true,
                        maxlength: 100,
                        minlength: 6
                    },
                    code: {
                        required: true,
                        checkCode: true
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
                                return $('#chkDangKM').is(':checked');
                            }
                        },
                        digits: {
                            depends: function() {
                                return $('#chkDangKM').is(':checked');
                            }
                        },
                        checkGia: {
                            depends: function() {
                                return $('#chkDangKM').is(':checked');
                            }
                        }
                    },
                    maLoaiSP: {
                        required: true
                    },
                    maThuongHieu: {
                        required: true
                    },
                    chkSize: {
                        required: true
                    },
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
                    },
                    maLoaiSP: {
                        required: "Bạn cần chọn loại sản phẩm"
                    },
                    maThuongHieu: {
                        required: "Bạn cần chọn thương hiệu sản phẩm"
                    },
                    chkSize: {
                        required: "Bạn cần chọn ít nhất 1 size"
                    },
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

            /// hiển thị ảnh khi paste đường dẫn vào textbox
            $('.txtDuongDan').change(function() {
                // lấy ra id của textbox đó (duongDan0, duongDan1, duongDan2...)
                var id = $(this).attr('id');

                // lấy đường dẫn
                var duongDan = $(this).val();

                // thay thuộc tính src của thẻ img có id tương ứng
                $('#img-' + id).attr('src', duongDan);
                // thay thuộc tính href của thẻ a có id tương ứng
                $('#a-' + id).attr('href', duongDan);
                // nếu trường hợp ảnh lỗi thì in ra ảnh mặc định
                $('.img-thumbnail').error(function() {
                    $(this).unbind('error').attr('src', 'http://dummyimage.com/100x140/FA6F57/fff.png&text=Kimfashion');

                    // thay ảnh ở thẻ a
                    $('#a-' + id).attr('href', 'http://dummyimage.com/762x1100/FA6F57/fff.png&text=Kimfashion');
                });
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
        </script>
        <script src="resource/js/jquery-1.7.2.min.js"></script>
        <script src="resource/js/jquery.wysiwyg.js"></script>
        <script type="text/javascript">
            $('#moTa').wysiwyg();
            $.noConflict();
        </script>
    </body>
</html>
