<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
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
                            <li><a href="admin-product.do">Sản phẩm</a></li>
                            <li class="active">Danh sách sản phẩm</li>
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
                                    <a href="#" class="btn btn-primary btn-round">Thêm sản phẩm mới</a>
                                </p>

                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold">Danh sách sản phẩm</caption>
                                    <thead>
                                        <tr>
                                            <th>Sửa</th>
                                            <th>Ẩn</th>
                                            <th>Code</th>
                                            <th>Tên</th>
                                            <th>Ảnh</th>
                                            <th>Loại</th>
                                            <th>Thương hiệu</th>
                                            <th>Bộ sưu tập</th>
                                            <th>Giá bán</th>
                                            <th>Giá bán KM</th>
                                            <th>Đang khuyến mại</th>
                                            <th>Hàng mới về</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate id="sp" name="SanPhamForm" property="listSanPham">                                            
                                            <tr>
                                                <td>b</td>
                                                <td>c</td>
                                                <td>
                                                    <a href="edit-product.do?id=<bean:write name="sp" property="maSP"/>" 
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xem chi tiết">
                                                        <bean:write name="sp" property="code"/>
                                                    </a>
                                                </td>
                                                <td>c</td>
                                                <td>d</td>
                                                <td>e</td>
                                                <td>f</td>
                                                <td>h</td>
                                                <td>i</td>
                                                <td>i</td>
                                                <td>j</td>
                                                <td>k</td>
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
            $('#myTable').dataTable();
        </script>
    </body>
</html>
