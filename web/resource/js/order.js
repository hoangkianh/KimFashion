jQuery(function($) {
    $('.qty-btn-group-order button').on('click', function() {
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

        $row.find('.row-total').text(formatNumber(row_total));

        update_total();

        var maSP = $row.data('product-id');
        var maSize = $row.data('size');
        update_listChiTietHDString(maSP, maSize, val);
    });

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
        return x1 + x2 + ' VND';
    }

    function update_total()
    {
        var total = 0;

        $('.tbl-order .row-total').each(function() {
            temp = $(this).text();
            temp = temp.replace(/[^0-9\.]+/g, '');
            temp = parseInt(temp);

            if (!isNaN(temp))
            {
                total += temp;
            }
        });

        $('.all-row-total').text(formatNumber(total));
        var shipfee = 0;
        if (total <= 1000000) {
            shipfee = 50000;
        }
        $('.ship-fee').text(formatNumber(shipfee));
        $('.order-total').text(formatNumber(total + shipfee));
    }

    function update_listChiTietHDString(maSP, maSize, val) {
        var str = $('#listChiTietHDString').val();
        var newStr = "";
        var arrayChiTietHD = str.split("|");
        for (i = 0; i < arrayChiTietHD.length - 1; i++) {
            var chiTietHD = arrayChiTietHD[i].split("~");
            var maSPStr = chiTietHD[0];
            var maSizeStr = chiTietHD[1];
            var soLuong = chiTietHD[2];
            var donGia = chiTietHD[3];
            
            if (parseInt(maSPStr) === maSP 
                    && parseInt(maSizeStr) === maSize) {
                // cập nhật sl mới
                soLuong = val;
            }
            newStr += maSPStr + "~" + maSizeStr + "~" + soLuong + "~" + donGia + "|";
        }

        $('#listChiTietHDString').val(newStr);
    }
});