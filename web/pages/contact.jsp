<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Liên hệ với chúng tôi | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
        <link rel="stylesheet" href="resource/css/owl.carousel.css"/>
        <link rel="stylesheet" href="resource/css/owl.theme.css"/>
        <%@include file="../include/includeJS.jsp" %>
    </head>
    <body>
        <!-- PAGE -->
        <div id="page-wrapper">
            <%@include file="../include/header.jsp" %>
            <!-- BREADCRUMB -->
            <div class="breadcrumb-container">
                <div class="container">
                    <div class="relative">
                        <ul class="bc unstyled clearfix">
                            <li><a href="/KimFashion">Trang chủ</a></li>
                            <li class="active">Liên hệ</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">

                        <section class="section">
                            <section class="col-xs-12 col-sm-12">
                                <div id="gmap" class="gmap"></div>
                            </section>
                        </section>

                        <section class="section">
                            <section class="col-xs-12 col-sm-8 col-md-8">

                                <h3 class="uppercase text-bold"><span class="text-xs">Nhập thông tin liên hệ của bạn</span></h3>
                                <div class="row">
                                    <div id="frm-contact-us">
                                        <form id="contact-form" class="clearfix" role="form">
                                            <div class="col-xs-12 col-sm-12 col-md-5">
                                                <div class="form-group stylish-input">
                                                    <label for="contactName" class="required">Họ tên</label>
                                                    <input type="text" class="form-control" id="contactName" name="name" data-validate="^[Ç-í\w\s]{2,30}$" require />
                                                </div>
                                                <div class="form-group stylish-input">
                                                    <label for="contactEmail" class="required">Email</label>
                                                    <input type="email" class="form-control" id="contactEmail" name="email" data-validate="^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$" require />
                                                </div>
                                                <div class="form-group stylish-input">
                                                    <label for="contactSubject">Điện thoại</label>
                                                    <input type="text" class="form-control" name="subject" id="contactSubject" />
                                                </div>
                                            </div>
                                            <div class="space10 visible-xs visible-sm"></div>
                                            <div class="col-xs-12 col-sm-12 col-md-7">
                                                <div class="form-group stylish-input">
                                                    <label for="contactMSG" class="required">Lời nhắn</label>
                                                    <textarea id="contactMSG" class="form-control" name="message" style="height: 178px; width: 400px;" data-validate=".{2,400}$" required></textarea>
                                                </div>
                                            </div>
                                            <div class="space10"></div>
                                            <div class="col-xs-12 col-sm-12">
                                                <button class="btn btn-default btn-round pull-right">Gửi</button>
                                            </div>
                                        </form>

                                        <div class="space40"></div>
                                        <div class="clearfix"></div>
                                        <!-- CONTACT FORM ALERTS -->
                                        <div class="alert alert-success" id="contact_success" style="display: none;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <div class="alert-inner">
                                                <strong>Thanks,</strong> your message recieved successfully. We'll get back to you as soon as possible.
                                            </div>
                                        </div>

                                        <div class="alert alert-danger" id="contact_fail" style="display: none;">
                                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                                            <div class="alert-inner"></div>
                                        </div>
                                    </div>
                                </div>

                            </section>

                            <!-- SIDEBAR -->
                            <aside class="col-xs-12 col-sm-4 col-md-4">

                                <section class="sidebar">

                                    <section class="side-section">
                                        <h3 class="uppercase text-bold"><span class="text-xs">Liên hệ với KimFashion</span></h3>
                                        <div class="light-color text-xs">
                                            <ul class="menu iconed-list unstyled">
                                                <li>
                                                    <span class="list-icon"><i class="round-icon text-sm iconfont-map-marker"></i></span>
                                                    <div class="list-content">99 Nguyễn Chí Thanh - Q.Đống Đa - TP.Hà Nội</div>
                                                </li>
                                                <li>
                                                    <span class="list-icon"><i class="round-icon text-sm iconfont-phone"></i></span>
                                                    <div class="list-content">043 8374447</div>
                                                </li>
                                                <li>
                                                    <span class="list-icon"><i class="round-icon text-sm iconfont-envelope-alt"></i></span>
                                                    <div class="list-content">kimfashion@gmail.com</div>
                                                </li>
                                            </ul>
                                        </div>
                                    </section>
                                </section>

                            </aside>

                            <div class="clearfix"></div>
                        </section>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
        <script src="resource/js/gmap3.min.js"></script>
    </body>
</html>
