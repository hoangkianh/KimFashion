package com.kimfashion.service;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dto.SanPham;
import java.text.DecimalFormat;
import java.util.List;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 * REST Web Service
 *
 * @author HKA
 */
@Path("sanpham")
public class SanPhamService {

    private List<SanPham> listAllSanpham;

    public SanPhamService() {
        listAllSanpham = new SanPhamDAO().getAllSanPham();
    }

    private final int soSPTren1Trang = 2;

    @GET
    @Path("phanTrang")
    @Produces("text/plain;charset=UTF-8")
    public String phanTrang() {
        String html = "";
        int tongsoSP = listAllSanpham.size();
        int soTrang = (int) Math.ceil(tongsoSP / (soSPTren1Trang * 1.0));

        html += "<li><a class='round-icon prev' onclick='trangTruoc()' href='javascript:void(0)' data-toggle='tooltip' data-title='Trước'><i class='iconfont-angle-left'></i></a></li>";
                
        if (true) {
            
        }
        html += "<li><a href='javascript:void(0)' onclick='chuyenTrang(this.id)' class='page accent-color' id='1'>1</a></li>";

        for (int i = 1; i < soTrang; i++) {
            html += "<li><a href='javascript:void(0)' onclick='chuyenTrang(this.id)' class='page' id='" + (i + 1) + "'>" + (i + 1) + "</a></li>";
        }

        html += "<li><a class='round-icon next' onclick='trangTiep()' href='javascript:void(0)' data-toggle='tooltip' data-title='Tiếp'><i class='iconfont-angle-right'></i></a></li>";

        return html;
    }

    @GET
    @Path("getSanPham/{page}")
    @Produces("text/plain;charset=UTF-8")
    public String getSanPham(@PathParam("page") int trang) {

        String html = "";
        List<SanPham> list = new SanPhamDAO().getSanPhamPhanTrang(soSPTren1Trang, trang);

        for (SanPham sanPham : list) {
            html += "<div class='product' data-product-id='" + sanPham.getMaSP() + "' "
                    + " data-category='" + sanPham.getListMaLoai() + "'"
                    + " data-brand='th" + sanPham.getMaThuongHieu() + "'"
                    + " data-price='" + sanPham.getGiaBan() + "' "
                    + " data-colors='" + sanPham.getListMauSacString() + "'"
                    + " data-size='" + sanPham.getListSizeString() + "'>";
            html += "<div class='entry-media'><img data-src='" + sanPham.getHinhAnh() + "' alt='' class='lazyLoad thumb' />";
            html += "<div class='hover'>"
                    + "<a href='product-details.do?id=" + sanPham.getMaSP() + "' class='entry-url'></a>"
                    + "<ul class='icons unstyled'>";

            if (sanPham.isDangKM()) {
                html += "<li><div class='circle ribbon ribbon-sale'>Sale</div></li>";
            }

            if (sanPham.isSanPhamMoi()) {
                html += "<li><div class='circle ribbon ribbon-new'>New</div></li>";
            }

            html += "<li><a href='" + sanPham.getHinhAnh()
                    + "' class='circle' data-toggle='lightbox'><i class='iconfont-search'></i></a></li>"
                    + "<li><a href='cart.do' class='circle add-to-cart'><i class='iconfont-shopping-cart'></i></a></li>"
                    + "</ul></div></div>";

            html += "<div class='entry-main'>"
                    + "<h5 class='entry-title'>"
                    + "<a href='product-details.do?id=" + sanPham.getMaSP() + "/>'>" + sanPham.getTenSP()
                    + "</a></h5>"
                    + "<div class='entry-description visible-list'>"
                    + "<p>" + sanPham.getMoTa() + "</p></div>";

            html += "<div class='entry-price'>";

            DecimalFormat df = new DecimalFormat("###,### VND");
            if (sanPham.isDangKM()) {
                html += "<s class='entry-discount'>" + df.format(sanPham.getGiaBan()) + "</s>"
                        + "<strong class='accent-color price'>" + df.format(sanPham.getGiaBanKM()) + "</strong>";
            } else {
                html += "<strong class='price accent-color'>" + df.format(sanPham.getGiaBan()) + "</strong>";
            }

            html += "<a href='#' class='btn btn-round btn-default add-to-cart visible-list'>Thêm vào giỏ</a>"
                    + "</div>"
                    + "<div class='entry-links clearfix'>"
                    + "<a href='#' class='pull-center'>+ So sánh</a>"
                    + "</div></div></div></div>";
        }

        return html;
    }
}
