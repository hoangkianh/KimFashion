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
        <title>Thương hiệu | KimFashion - Cửa hàng thời trang online</title>
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
                            <li><a href="admin-brand.do">Thương hiệu</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div id="delete-confirm" class="modal fade">
                <div class="modal-dialog">
                    <html:form styleId="deleteForm" method="POST" action="/DeleteThuongHieu">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3>Xóa thương hiệu</h3>                    
                            </div>
                            <div class="modal-body">
                                <html:hidden styleId="maThuongHieu" name="ThuongHieuForm" property="maThuongHieu"/>
                                <p>Bạn có muốn xóa thương hiệu này không?</p>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-primary btn-round" value="Xóa" />
                                    <input type="reset" class="btn btn-default btn-round" value="Hủy" data-dismiss="modal"/>
                                </div>
                            </div>
                        </div>
                    </html:form>
                </div>
            </div>
            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <section class="section">
                            <section class="col-xs-12 col-sm-12 col-md-12">
                                <p>
                                    <a href="add-brand.do" class="btn btn-primary btn-round">Thêm thương hiệu mới</a>
                                </p>

                                <table id="myTable" class="table table-striped table-bordered table-hover table-condensed">
                                    <caption class="uppercase text-bold"><h3>Danh sách thương hiệu</h3></caption>
                                    <thead>
                                        <tr>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th class="sorting_disabled">&nbsp;</th>
                                            <th>Tên thương hiệu </th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <logic:iterate id="th" name="ThuongHieuForm" property="listThuongHieu">                                            
                                            <tr>
                                                <td align="center">
                                                    <a href="edit-brand.do?id=<bean:write name="th" property="maThuongHieu"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Sửa thông tin thương hiệu">
                                                        <i class="iconfont-edit"></i>
                                                    </a>
                                                </td>
                                                 <td align="center">
                                                    <a href="#delete-confirm" class="delete"
                                                       id="<bean:write name="th" property="maThuongHieu"/>"
                                                       rel="tooltip" data-toggle="tooltip" data-placement="top" title="Xóa">
                                                        <i class="iconfont-trash text-danger"></i>
                                                    </a>
                                                </td>
                                                <td><bean:write name="th" property="tenThuongHieu"/></td>
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
                "aaSorting": [[2, 'asc']] // sort theo tên thương hiệu
            });
            
            $("a.delete").click(function() {
                $('#delete-confirm').modal();

                var maThuongHieu = $(this).attr('id');
                $("#maThuongHieu").val(maThuongHieu);
                return false;
            });
        </script>
    </body>
</html>
