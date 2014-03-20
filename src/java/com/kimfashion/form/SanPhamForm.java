package com.kimfashion.form;

import com.kimfashion.dao.HinhAnhDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dao.SizeDAO;
import com.kimfashion.dto.HinhAnh;
import com.kimfashion.dto.SanPham;
import com.kimfashion.dto.SanPhamSize;
import com.kimfashion.dto.Size;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author KimHue
 */
public class SanPhamForm extends org.apache.struts.action.ActionForm {

    private int maSP;
    private String code;
    private String tenSP;
    private boolean gioiTinh;
    private int maThuongHieu;
    private int maLoaiSP;
    private int maBST;
    private String moTa;
    private int giaNhap;
    private int giaBan;
    private int giaBanKM;
    private boolean sanPhamMoi;
    private boolean dangKM;
    private boolean daAn;
    private double xepHang;
    private int soLuotDanhGia;
    private String mauSac;
    private String hinhAnh;
    private String tenThuongHieu;
    private List<SanPham> listSanPham;

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();

        if (code == null || code.trim().length() == 0) {
            err.add("code", new ActionMessage("Bạn chưa điền tên code sản phẩm"));
        } else {
            if (code.trim().length() < 4 || code.trim().length() > 20) {
                err.add("code", new ActionMessage("Code sản phẩm từ 4 - 20 kí tự"));
            }
        }

        if (tenSP == null || tenSP.trim().length() == 0) {
            err.add("tenSP", new ActionMessage("Bạn chưa điền tên sản phẩm"));
        } else {
            if (tenSP.trim().length() < 4 || tenSP.trim().length() > 100) {
                err.add("tenSP", new ActionMessage("Tên sản phẩm từ 4 - 100 kí tự"));
            }
        }

        if (maThuongHieu <= 0) {
            err.add("maThuongHieu", new ActionMessage("Bạn chưa chọn thương hiệu"));
        }

        if (maLoaiSP <= 0) {
            err.add("maLoaiSP", new ActionMessage("Bạn chưa chọn loại sản phẩm"));
        }
        
        if (moTa.trim().length() > 255) {
            err.add("moTa", new ActionMessage("Mô tả sản phẩm tối đa 255 kí tự (mô tả của bạn có " + moTa.trim().length() + ")"));
        }
        
        if (giaNhap <= 0) {
            err.add("giaNhap", new ActionMessage("Bạn chưa điền giá nhập"));            
        }
        
        if (giaBan <= 0) {
            err.add("giaBan", new ActionMessage("Bạn chưa điền giá bán"));            
        }
        
        if (dangKM && giaBanKM <= 0) {
            err.add("giaBanKM", new ActionMessage("Bạn chưa điền giá bán khuyến mại"));
        }
        
        if (mauSac == null || mauSac.trim().length() == 0) {
            err.add("mauSac", new ActionMessage("Bạn chưa điền tên màu sắc sản phẩm"));
        } else {
            if (mauSac.trim().length() < 3 || mauSac.trim().length() > 100) {
                err.add("mauSac", new ActionMessage("Màu sắc sản phẩm từ 3 - 100 kí tự"));
            }
        }
        return err;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public int getMaThuongHieu() {
        return maThuongHieu;
    }

    public void setMaThuongHieu(int maThuongHieu) {
        this.maThuongHieu = maThuongHieu;
    }

    public int getMaLoaiSP() {
        return maLoaiSP;
    }

    public void setMaLoaiSP(int maLoaiSP) {
        this.maLoaiSP = maLoaiSP;
    }

    public int getMaBST() {
        return maBST;
    }

    public void setMaBST(int maBST) {
        this.maBST = maBST;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(int giaNhap) {
        this.giaNhap = giaNhap;
    }

    public int getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(int giaBan) {
        this.giaBan = giaBan;
    }

    public int getGiaBanKM() {
        return giaBanKM;
    }

    public void setGiaBanKM(int giaBanKM) {
        this.giaBanKM = giaBanKM;
    }

    public boolean isSanPhamMoi() {
        return sanPhamMoi;
    }

    public void setSanPhamMoi(boolean sanPhamMoi) {
        this.sanPhamMoi = sanPhamMoi;
    }

    public boolean isDangKM() {
        return dangKM;
    }

    public void setDangKM(boolean dangKM) {
        this.dangKM = dangKM;
    }

    public boolean isDaAn() {
        return daAn;
    }

    public void setDaAn(boolean daAn) {
        this.daAn = daAn;
    }

    public double getXepHang() {
        return xepHang;
    }

    public void setXepHang(double xepHang) {
        this.xepHang = xepHang;
    }

    public int getSoLuotDanhGia() {
        return soLuotDanhGia;
    }

    public void setSoLuotDanhGia(int soLuotDanhGia) {
        this.soLuotDanhGia = soLuotDanhGia;
    }

    public String getMauSac() {
        return mauSac;
    }

    public void setMauSac(String mauSac) {
        this.mauSac = mauSac;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public List<SanPham> getListSanPham() {
        return listSanPham;
    }

    public void setListSanPham(List<SanPham> listSanPham) {
        this.listSanPham = listSanPham;
    }
    
    public List<SanPham> getListSPMoi(){
        return new SanPhamDAO().getSanPhamMoi();
    }
    public List<SanPham> getListSPKhuyenMai(){
        return new SanPhamDAO().getSanPhamKhuyenMai();
    }
    public List<SanPham> getListSPCungLoai(){
        return new SanPhamDAO().getSanPhamCungLoai(maLoaiSP, maSP);
    }
    public List<HinhAnh> getListHinhAnh(){
        return new HinhAnhDAO().getAllHinhAnhByMaSP(maSP);
    }
    public List<Size> getListSize(){
        List<Size> list = new ArrayList<Size>();
        List<SanPhamSize> listSPSize = new SanPhamSizeDAO().getAllSizeBySanPham(maSP);
        SizeDAO sizeDAO = new SizeDAO();
        
        for (SanPhamSize sanPhamSize : listSPSize) {
            Size s = sizeDAO.getSizeByMaSize(sanPhamSize.getMaSize());
            list.add(s);
        }
        return list;
    }

    public String getTenThuongHieu() {
        return tenThuongHieu;
    }

    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }
}
