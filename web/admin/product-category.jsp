<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
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
        <title>Loại sản phẩm | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="admin-category.do">Loại Sản phẩm</a></li>
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
                                    <a href="add-category.do" class="btn btn-primary btn-round">Thêm loại sản phẩm mới</a>
                                </p>

                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold">Danh sách loại sản phẩm</caption>
                                    <thead>
                                        <tr>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th>Tên loại </th>                                            
                                            <th>Giới tính</th>                                            
                                            <th>Tên loại Cha</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate id="loaiSP" name="LoaiSPForm" property="listLoaiSP">                                            
                                            <tr>
                                                <td align="center">
                                                    <a href="edit-category.do?id=<bean:write name="loaiSP" property="maLoai"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Sửa thông tin loại sản phẩm">
                                                        <i class="iconfont-edit"></i>
                                                    </a>
                                                </td>
                                                <td><bean:write name="loaiSP" property="tenLoai"/></td>
                                                <td>
                                                    <c:if test="${loaiSP.gioiTinh eq true}">
                                                        Nữ
                                                    </c:if>
                                                    <c:if test="${loaiSP.gioiTinh eq false}">
                                                        Nam
                                                    </c:if>
                                                </td>
                                                <td><bean:write name="loaiSP" property="tenLoaiCha"/></td>
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
                "aaSorting": [[1, 'asc']] // sort theo tên loại sp
            });
        </script>
    </body>
</html>
