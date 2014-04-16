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
        <title>Trang quản trị | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/jquery.dataTables.css"/>
        <%@include file="../include/includeJS.jsp" %>
        <script src="resource/js/jquery.dataTables.min.js"></script>
        <script src="resource/js/jquery.dataTables.extend.js"></script>
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
                            <li class="active">Sản phẩm</li>
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
                                <p>
                                    <a href="add-product.do" class="btn btn-primary btn-round">Thêm sản phẩm mới</a>
                                </p>

                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold"><h3>Danh sách sản phẩm</h3></caption>
                                    <thead>
                                        <tr>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th>Code</th>
                                            <th>Tên</th>
                                            <th class="sorting_disabled">Ảnh</th>
                                            <th>Loại</th>
                                            <th>Thương hiệu</th>
                                            <th>Giá bán</th>
                                            <th class="sorting_disabled">Đang KM</th>
                                            <th class="sorting_disabled">Hàng mới về</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate id="sp" name="SanPhamForm" property="listSanPham">
                                            <tr>
                                                <td align="center">
                                                    <a href="edit-product.do?id=<bean:write name="sp" property="maSP"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Sửa thông tin sản phẩm">
                                                        <i class="iconfont-edit"></i>
                                                    </a>
                                                </td>
                                                <td align="center">
                                                    <c:choose>
                                                        <c:when  test="${sp.daAn eq true}">
                                                            <a href="show-product.do?id=<bean:write name="sp" property="maSP"/>"
                                                               rel="tooltip" data-toggle="tooltip" data-placement="top" title="Hiện sản phẩm">
                                                                <i class="iconfont-eye-open text-info"></i>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="hide-product.do?id=<bean:write name="sp" property="maSP"/>"
                                                               rel="tooltip" data-toggle="tooltip" data-placement="top" title="Ẩn sản phẩm này">
                                                                <i class="iconfont-eye-close text-danger"></i>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td align="center">
                                                    <a href="delete-product.do?id=<bean:write name="sp" property="maSP"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xóa sản phẩm">
                                                        <i class="iconfont-trash"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="accent-color" href="details-product.do?id=<bean:write name="sp" property="maSP"/>" 
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem chi tiết">
                                                        <bean:write name="sp" property="code"/>
                                                    </a>
                                                </td>
                                                <td><bean:write name="sp" property="tenSP"/></td>
                                                <td>
                                                    <a href="<bean:write name="sp" property="hinhAnh"/>" data-toggle="lightbox">
                                                        <img width="50" src="<bean:write name="sp" property="hinhAnh"/>"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="accent-color" href="product-category.do?cat=<bean:write name="sp" property="maLoaiSP"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem tất cả sản phẩm <bean:write name="sp" property="tenLoaiSP"/>">
                                                        <bean:write name="sp" property="tenLoaiSP"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="accent-color" href="product-brand.do?id=<bean:write name="sp" property="maThuongHieu"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem tất cả sản phẩm thuộc thương hiệu <bean:write name="sp" property="tenThuongHieu"/>">
                                                        <bean:write name="sp" property="tenThuongHieu" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sp.dangKM eq true}">
                                                            <fmt:formatNumber value="${sp.giaBanKM}" type="NUMBER" maxFractionDigits="3" /> VND
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${sp.giaBan}" type="NUMBER" maxFractionDigits="3" /> VND                                                            
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${sp.dangKM eq true}">
                                                        <i class="iconfont-check text-success"></i>
                                                    </c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${sp.sanPhamMoi eq true}">
                                                        <i class="iconfont-check text-success"></i>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </logic:iterate>
                                    </tbody>
                                </table>
                            </section>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script type="text/javascript">
            $('[rel=tooltip]').tooltip();
            $('#myTable').dataTable({
                "aaSorting": [[3, 'asc']] // sort theo tên sp
            });
        </script>
    </body>
</html>
