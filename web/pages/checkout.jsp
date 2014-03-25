<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <title>Thanh toán | KimFashion - Cửa hàng thời trang online</title>
        <%@include file="../include/includeCSS.jsp" %>
        <link rel="stylesheet" href="resource/css/innerpage.css"/>
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
                            <li class="active">Thanh toán</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- SITE MAIN CONTENT -->
            <main id="main-content" role="main">
                <div class="container">
                    <div class="row">
                        <div class="m-t-b clearfix">

                            <!-- SIDEBAR -->
                            <aside class="col-xs-12 col-sm-4 col-md-3">
                                <section class="side-section">
                                    <h3 class="uppercase text-bold"><span class="text-xs">Bạn nên xem</span></h3>

                                    <ul class="nav nav-tabs nav-stacked">
                                        <li><a href="">Homepage</a></li>															
                                        <li><a href="">About us</a></li>															
                                        <li><a href="">Shop</a></li>															
                                        <li><a href="">Single Product Details</a></li>															
                                        <li><a href="">Contact us</a></li>															
                                    </ul>
                                </section>
                            </aside>

                            <section class="col-xs-12 col-sm-8 col-md-9">
                                <div class="panel-group checkout" id="checkout-collapse">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse1">
                                                    <span class="step">01</span>
                                                    Thông tin của bạn
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse1" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6">
                                                        <form>
                                                            <fieldset>
                                                                <legend class="title">Tôi chưa có tài khoản</legend>
                                                                <div class="inner">
                                                                    <p>Checkout Options:</p>
                                                                    <div class="form-account">
                                                                        <div class="radio">
                                                                            <input type="radio" name="customer" id="radio-register" class="prettyCheckable" checked="checked" data-label="Register Account" />
                                                                        </div>
                                                                        <div class="radio">
                                                                            <input type="radio" name="customer" id="radio-guest" class="prettyCheckable" data-label="Guest Checkout" />
                                                                        </div>
                                                                    </div>
                                                                    <p class="light-color">Mauris dapibus quam id turpis dignissim rutrum. Phasellus placerat nunc [...]</p>
                                                                    <div class="space20 clearfix"></div>
                                                                    <button class="btn btn-default btn-round uppercase padder">Continue</button>
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                    <div class="space40 visible-xs"></div>
                                                    <div class="col-xs-12 col-sm-6">
                                                        <form class="form-horizontal">
                                                            <fieldset>
                                                                <legend class="title">Returning Customer</legend>
                                                                <div class="inner">
                                                                    <p>I'm a Returning Customer</p>
                                                                    <div class="form-login">
                                                                        <div class="form-group stylish-input">
                                                                            <label for="inputEmail" class="col-xs-12 col-sm-3 control-label required">Email</label>
                                                                            <div class="col-lg-7">
                                                                                <input type="text" class="form-control" id="inputEmail">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group stylish-input">
                                                                            <label for="inputPassword" class="col-xs-12 col-sm-3 control-label required">Password</label>
                                                                            <div class="col-lg-7">
                                                                                <input type="password" class="form-control" id="inputPassword">
                                                                                <a href="#" class="help-block">Forgot your password?</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <button class="btn btn-primary btn-round padder">Login</button>
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse2">
                                                    <span class="step">02</span>
                                                    Billing Infomation
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputFirstname" class="col-sm-4 col-lg-4 control-label required">First Name</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputFirstname" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputLastname" class="col-sm-4 col-lg-4 control-label required">Last Name</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputLastname" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail2" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" id="inputEmail2" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPhone" class="col-sm-4 col-lg-4 control-label required">Telephone</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputPhone" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputFax" class="col-sm-4 col-lg-4 control-label">Fax</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputFax" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCompany" class="col-sm-4 col-lg-4 control-label">Company</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputCompany" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress1" class="col-sm-4 col-lg-4 control-label required">Address 1</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputAddress1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress2" class="col-sm-4 col-lg-4 control-label">Address 2</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputAddress2" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCity" class="col-sm-4 col-lg-4 control-label required">City</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputCity" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPostcode" class="col-sm-4 col-lg-4 control-label required">Post Code</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="inputPostcode" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCountry" class="col-sm-4 col-lg-4 control-label required">Country</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <select class="form-control" id="inputCountry">	
                                                                        <option>select country</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputState" class="col-sm-4 col-lg-4 control-label required">Region/state</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <select class="form-control" id="inputState">
                                                                        <option>select state/region</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="space20 clearfix"></div>
                                                    <button class="btn btn-primary">Continue</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse3">
                                                    <span class="step">03</span>
                                                    Delivery Details
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputFirstname" class="col-sm-4 col-lg-4 control-label required">First Name</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputLastname" class="col-sm-4 col-lg-4 control-label required">Last Name</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text2" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputEmail2" class="col-sm-4 col-lg-4 control-label required">E-Mail</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="email" class="form-control" id="Email1" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPhone" class="col-sm-4 col-lg-4 control-label required">Telephone</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text3" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputFax" class="col-sm-4 col-lg-4 control-label">Fax</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text4" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCompany" class="col-sm-4 col-lg-4 control-label">Company</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text5" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6">
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress1" class="col-sm-4 col-lg-4 control-label required">Address 1</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text6" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputAddress2" class="col-sm-4 col-lg-4 control-label">Address 2</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text7" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCity" class="col-sm-4 col-lg-4 control-label required">City</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text8" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputPostcode" class="col-sm-4 col-lg-4 control-label required">Post Code</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <input type="text" class="form-control" id="Text9" />
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputCountry" class="col-sm-4 col-lg-4 control-label required">Country</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <select class="form-control" id="Select1">	
                                                                        <option>select country</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group stylish-input">
                                                                <label for="inputState" class="col-sm-4 col-lg-4 control-label required">Region/state</label>
                                                                <div class="col-sm-8 col-lg-8">
                                                                    <select class="form-control" id="Select2">
                                                                        <option>select state/region</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="space20 clearfix"></div>
                                                    <button class="btn btn-primary">Continue</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse4">
                                                    <span class="step">04</span>
                                                    Payment Method
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse4" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="paymethod" role="form">
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="deliverymethod1" class="prettyCheckable" name="deliverymethod" data-label="Method 1" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="deliverymethod2" class="prettyCheckable" name="deliverymethod" data-label="Method 2" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="deliverymethod3" class="prettyCheckable" name="deliverymethod" data-label="Method 3" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="space20 clearfix"></div>
                                                    <button class="btn btn-primary">Continue</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse5">
                                                    <span class="step">05</span>
                                                    Delivery Methods
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse5" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="paymethod" role="form">
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="paymethod1" class="prettyCheckable" name="paymethod" data-label="Direct Bank Transfer" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="paymethod2" class="prettyCheckable" name="paymethod" data-label="C.O.D" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="form-group stylish-input">
                                                        <input type="radio" id="paymethod3" class="prettyCheckable" name="paymethod" data-label="PayPal" />
                                                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit.</p>
                                                    </div>
                                                    <div class="space20 clearfix"></div>
                                                    <button class="btn btn-primary">Continue</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#checkout-collapse" href="#checkout-collapse6">
                                                    <span class="step">06</span>
                                                    Account & Billing Details
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="checkout-collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 pull-right center-sm">
                                                        <table class="shop-summary">
                                                            <tr>
                                                                <th>Sub Total:</th>
                                                                <td>$1170.00</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Eco tax (-2.00)</th>
                                                                <td>$2.00</td>
                                                            </tr>
                                                            <tr>
                                                                <th>Vat (10.0 %):</th>
                                                                <td>$117.00</td>
                                                            </tr>
                                                            <tr class="total">
                                                                <th>Total:</th>
                                                                <td>$1053.00</td>
                                                            </tr>
                                                            <tr>
                                                                <th><a href="#" class="btn btn-default btn-round uppercase">Checkout</a></th>
                                                                <td><a href="#" class="btn btn-primary btn-round uppercase">Continue Shopping</a></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="../include/footer.jsp" %>
    </body>
</html>
