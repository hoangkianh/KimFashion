jQuery(function($) {

    // hiển thị tổng đơn hàng ở trang thanh toán checkout.jsp
    function hienThiCheckOut() {
        var cookie = $.cookie('cart');
        if (cookie === undefined)
        {
            return;
        }
        cookie = $.parseJSON(cookie);

        var tongCong = 0,
                vanChuyen = 0,
                thanhTien = 0;

        for (var sp in cookie) {
            var gia = cookie[sp].price.replace(/[^0-9\.]+/g, '');
            tongCong += parseInt(gia) * parseInt(cookie[sp].qty);
        }

        if (tongCong <= 1000000) {
            vanChuyen = 50000;
        }
        thanhTien = tongCong + vanChuyen;

        $('.shop-summary #tongCong').text(formatNumber(tongCong) + ' VND');
        if (vanChuyen == 0) {
            $('.shop-summary #vanChuyen').text('Miễn phí');
        } else {
            $('.shop-summary #vanChuyen').html(formatNumber(vanChuyen) + ' VND');
        }
        $('.shop-summary #thanhTien').text(formatNumber(thanhTien) + ' VND');
    }
    hienThiCheckOut();//gọi hàm hiển thị

    // cookie được tạo trong trang minified.js (dòng 3530 - 3537): 
    /*
     | ----------------------------------------------------------------------------------
     | xóa sản phẩm trong giỏ hàng, sản phẩm được xóa khỏi cookie
     | ----------------------------------------------------------------------------------
     */
    $(document).on('click', '.tbl-cart .close', function() {
        $(this).closest('tr').fadeOut(500, function() {
            $(this).remove();
            update_cart_total();
            if ($('.tbl-cart tbody tr:not(.empty-cart)').length == 0)
            {
                $('.tbl-cart .empty-cart').removeClass('hide');
            }
        });
    });

    /*
     | ----------------------------------------------------------------------------------
     | xóa sản phẩm trong giỏ hàng trên header
     | ----------------------------------------------------------------------------------
     */
    $(document).on("click", "#sub-cart .close", function() {
        var id = $(this).closest(".item").data("product-id");

        var p = $('.tbl-cart').find('tr[data-product-id=' + id + ']');
        p.fadeOut(400, function() {
            $(this).remove();
            update_cart_total();
        });
    });


    /*
     | ----------------------------------------------------------------------------------
     | Hiển thị sản phẩm trong cookie
     | ----------------------------------------------------------------------------------
     */
    function formatNumber(nStr)
    {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    function output_cookie()
    {
        var cookie = $.cookie('cart');
        if (cookie === undefined)
        {
            $('#checkout-btn').attr('href', 'javascript:void(0)');
            return;
        }
        cookie = $.parseJSON(cookie);


        for (var sp in cookie)
        {
            temp = cookie[sp].price;
            temp = temp.replace(/[^0-9\.]+/g, '');
            temp = parseInt(temp) * cookie[sp].qty;

            var $new = $('<tr data-product-id="' + cookie[sp].id + '" data-size="' + cookie[sp].size + '"> \
							<td> \
								<a class="entry-thumbnail" href="' + cookie[sp].thumbnail + '" data-toggle="lightbox">\
									<img src="' + cookie[sp].thumbnail + '" alt="' + cookie[sp].title + '" /> \
								</a> \
								<a class="entry-title" href="' + cookie[sp].url + '">' + cookie[sp].title + '</a> \
							</td> \
                                                        <td><span class="unit-size">' + cookie[sp].tenSize + '</span></td> \
							<td><span class="unit-price">' + cookie[sp].price + '</span></td> \
							<td> \
								<div class="qty-btn-group"> \
									<button type="button" class="down"><i class="iconfont-caret-down inline-middle"></i></button> \
									<input type="text" value="' + cookie[sp].qty + '" /> \
									<button type="button" class="up"><i class="iconfont-caret-up inline-middle"></i></button> \
								</div> \
							</td> \
							<td class="hidden-xs"><strong class="text-bold row-total">' + formatNumber(temp) + ' VND</strong></td> \
							<td class="hidden-xs"><div class="item" data-product-id="' + cookie[sp].id + '" data-size="' + cookie[sp].size + '"><button type="button" class="close" aria-hidden="true">×</button></div></td> \
						</tr>');

            $new.appendTo($('.tbl-cart tbody'));
            $new.find('[data-toggle="lightbox"]').magnificPopup({
                type: 'image'
            });
        }

        update_cart_total();
    }
    output_cookie();


    /*
     | ----------------------------------------------------------------------------------
     | cập nhật số lượng
     | ----------------------------------------------------------------------------------
     */
    $('.qty-btn-group button').on('click', function() {
        var $this = $(this),
                $input = $this.siblings('input'),
                val = parseInt($input.val());

        val = ($this.hasClass('up')) ? ++val : --val;
        if (isNaN(val) || val < 0)
            val = 0;

        $input.val(val);

        var $row = $this.closest('tr'),
                unit_price = $row.find('.unit-price').text(),
                row_total = unit_price.replace(/[^0-9\.]+/g, '');
        row_total = parseInt(row_total) * val;

        $row.find('.row-total').text(formatNumber(row_total) + ' VND');

        update_cart_total();
    });


    /*
     | ----------------------------------------------------------------------------------
     | cập nhật tổng tiền
     | ----------------------------------------------------------------------------------
     */
    function update_cart_total()
    {
        var total = 0;

        $('.tbl-cart .row-total').each(function() {
            temp = $(this).text();
            temp = temp.replace(/[^0-9\.]+/g, '');
            temp = parseInt(temp);

            if (!isNaN(temp))
            {
                total += temp;
            }
        });

        $('.shopcart-total .cart-total > .pull-right').text(formatNumber(total) + ' VND');
        if (total === 0) {
            $('#checkout-btn').attr('href', 'javascript:void(0)');
        }
    }


    /*
     | ----------------------------------------------------------------------------------
     | Product Single Page - Change Product Preview Image
     | ----------------------------------------------------------------------------------
     */
    $('.product-preview .thumbs > li > a').on('click', function(e) {
        e.preventDefault();
        var $preview = $('.product-preview .big-image');
        $preview.find('a').attr('href', $(this).attr('href'));
        $preview.find('img').attr('src', $(this).children().attr('src'));
    });


    /*
     | ----------------------------------------------------------------------------------
     | Setup Product Grid Layout
     | ----------------------------------------------------------------------------------
     */
    function phanTrang() {
        $.ajax({
            type: "GET",
            url: "service/sanpham/phanTrang",
            async: false,
            success: function(msg) {
                $('.paginator').html(msg);
            }
        });
    }
    phanTrang();

    var $product_layout = $('.products-layout');

    $('.page').click(function() {
        setupProduct();
        $('.paginator li .accent-color').removeClass('accent-color');
        $(this).addClass('accent-color');
        return false;
    });

    $('.prev').click(function() {
        setupProduct();
        var p = $('.paginator li .accent-color');
        var trangMoi = p.parent().prev().children();
        if (trangMoi.hasClass('page'))
        {
            p.removeClass('accent-color');
            trangMoi.addClass('accent-color');
        }
        return false;
    });

    $('.next').click(function() {
        setupProduct();
        var p = $('.paginator li .accent-color');
        var trangMoi = p.parent().next().children();
        if (trangMoi.hasClass('page'))
        {
            p.removeClass('accent-color');
            trangMoi.addClass('accent-color');
        }
        return false;
    });


    function setupProduct() {
        var itemW = 270,
                productW = $product_layout.width();

        x = parseInt(productW / itemW);
        var new_itemW = parseInt(productW / x).toString() + 'px';
        if (x === 1)
        {
            new_itemW = '100%';
        }
        $product_layout.find('.product').each(function() {
            var $this = $(this);

            $this = (!$this.parent().hasClass('mix-item')) ?
                    $this.wrap('<div class="mix-item" />').parent()
                    : $this.parent();
            $this.children().css('visibility', 'visible');

            var $lazyLoad = $this.find('.lazyLoad');
            if ($lazyLoad.length)
            {
                $this.addClass('loading');
            }

            $this.css({
                'width': new_itemW
            });
            $this.children().animate({
                opacity: 1,
                visibility: 'visible'
            }, 800, 'easeInQuad');

            $lazyLoad.attr('src', $lazyLoad.data('src')).imagesLoaded(function() {
                $lazyLoad.removeAttr('data-src');
                $this.removeClass('loading');
            });
        });
    }


    if ($product_layout.length)
    {
        setupProduct();
    }


    $('[data-layout="list"]').click(function() {
        $product_layout.removeClass('grid').addClass('list').isotope('reLayout');
        return false;
    });

    $('[data-layout="grid"]').click(function() {
        $product_layout.addClass('grid').removeClass('list').isotope('reLayout');
        return false;
    });

    $('[data-layout="list"], [data-layout="grid"]').click(function() {
        $(this).closest('ul').find('.active').removeClass('active');
        $(this).addClass('active');
        return false;
    });


    /*
     | ----------------------------------------------------------------------------------
     | Isotope Filter - Filter by Category and Brands
     | ----------------------------------------------------------------------------------
     */
    filterCheckbox($('#category-list'), 'category');
    filterCheckbox($('#brands-list'), 'brand');
    filterCheckbox($('#filter-by-color'), 'colors');
    filterCheckbox($('#filter-by-size'), 'size');

    function filterCheckbox($container, type)
    {
        $container.find('input[type="checkbox"]').on('change', function() {
            var filters = [];
            $container.find('input[type="checkbox"]:checked').each(function() {
                this_filter = $(this).val();
                if (filters.indexOf(this_filter) === -1 && this_filter !== undefined)
                {
                    filters.push(this_filter);
                }
            });


            var products = $product_layout.find('.mix-item').filter(function() {
                if (filters.length == 0)
                    return true;
                var $this = $(this),
                        filter = $this.find(' > .product').data(type),
                        filter_arr;

                if (filter !== undefined)
                {
                    filter_arr = filter.split('|');
                    for (var i = 0; i < filter_arr.length; i++)
                    {
                        if (filters.indexOf(filter_arr[i]) !== -1)
                            return true;
                    }
                    return false;
                }
            });

            $product_layout.isotope({
                filter: products
            });
        });
    }


    /*
     | ----------------------------------------------------------------------------------
     | Isotope Filter - Filter by Price
     | ----------------------------------------------------------------------------------
     */
    function priceSlider(value)
    {
        var products = $product_layout.find('.mix-item').filter(function() {
            var price = $(this).find(' > .product').data('price');
            if (price === undefined)
                return false;
            return (price >= value[0] && price < value[1]) ? true : false;
        });

        $product_layout.isotope({
            filter: products
        });
    }


    /*
     | ----------------------------------------------------------------------------------
     | Set input value of filters
     | ----------------------------------------------------------------------------------
     */
    $('#filter-by-size li > a, #filter-by-color li > a').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        $this.toggleClass('active');
        $this.siblings('.filter-checkbox').prop('checked', $this.hasClass('active')).trigger('change');
    });


    /*
     | ----------------------------------------------------------------------------------
     | Add Helper Classes to Vertical Menu
     | ----------------------------------------------------------------------------------
     */
    $('.vmenu li').each(function() {
        if ($(this).find('ul').length)
        {
            $(this).addClass('has-submenu');
        }
    });


    /*
     | ----------------------------------------------------------------------------------
     | jQuery Range slider - noUiSlider
     | Git: https://github.com/leongersen/noUiSlider
     | URL: http://refreshless.com/nouislider/
     | ----------------------------------------------------------------------------------
     */
    $('.range-slider').each(function() {
        var $this = $(this),
                configs = new Array();

        configs['min'] = ($this.data('min') === undefined) ? 0 : $this.data('min');
        configs['max'] = ($this.data('max') === undefined) ? 100 : $this.data('max');
        configs['start'] = ($this.data('start') === undefined) ? [configs['min'], configs['max']] : $this.data('start');
        configs['step'] = ($this.data('step') === undefined) ? 1 : $this.data('step');
        configs['currency'] = ($this.data('currency') === undefined) ? '$' : $this.data('currency');

        $this.noUiSlider({
            range: [configs['min'], configs['max']],
            start: configs['start'],
            step: configs['step'],
            connect: true,
            handles: 2,
            slide: function() {
                var values = $(this).val();

                $this.siblings('.range-slider-value').find('> .min').text(formatNumber(values[0]) + ' ' + configs['currency']);
                $this.siblings('.range-slider-value').find('> .max').text(formatNumber(values[1]) + ' ' + configs['currency']);
            },
            serialization: {
                to: ['min-price', 'max-price'],
                resolution: 1,
                mark: ","
            },
        }).change(function() {
            priceSlider($(this).val());
        });

        $this.siblings('.range-slider-value').find('> .min').text(formatNumber($this.val()[0]) + ' ' + configs['currency']);
        $this.siblings('.range-slider-value').find('> .max').text(formatNumber($this.val()[1]) + ' ' + configs['currency']);
    });

});