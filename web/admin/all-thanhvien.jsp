<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
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
        <title>Danh sách thành viên | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
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
                            <li class="active">Thành viên</li>
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
                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold"><h3>danh sách thành viên</h3></caption>
                                    <thead>
                                        <tr>
                                            <th>Tên đăng nhập</th>
                                            <th>Email</th>
                                            <th>Họ tên</th>
                                            <th>Giới tính</th>
                                            <th class="sorting_disabled">Đã xác nhận</th>
                                            <th class="sorting_disabled">Là admin</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate name="ThanhVienForm" id="tv" property="listThanhVien">
                                            <tr>
                                                <td><bean:write name="tv" property="tenDangNhap"/></td>
                                                <td><bean:write name="tv" property="email"/></td>
                                                <td><bean:write name="tv" property="hoTen"/></td>
                                                <td align="center">
                                                    <c:if test="${tv.gioiTinh eq false}">
                                                        Nam
                                                    </c:if>
                                                    <c:if test="${tv.gioiTinh eq true}">
                                                        Nữ
                                                    </c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${tv.xacNhan eq true}">
                                                        <i class="iconfont-check-sign text-success"
                                                           rel="tooltip" data-toggle="tooltip" data-placement="top" title="Tài khoản đã xác nhận"></i>
                                                    </c:if>
                                                </td>
                                                <td align="center">
                                                    <c:if test="${tv.laAdmin eq true}">
                                                        <i class="iconfont-check-sign text-success"
                                                           rel="tooltip" data-toggle="tooltip" data-placement="top" title="Tài khoản admin"></i>
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
        <%@include file="../include/footer.jsp" %><script type="text/javascript">
            $('[rel=tooltip]').tooltip();
            $('#myTable').dataTable({
                "aaSorting": [[0, 'asc']] // sort tên đăng nhập
            });
        </script>
    </body>
</html>
