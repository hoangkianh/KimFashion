package com.kimfashion.dto;

import com.kimfashion.dao.LoaiSPDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dao.SizeDAO;
import com.kimfashion.dao.ThuongHieuDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KimHue
 */
public class SanPham implements Serializable {
    
    private int maSP;
    private String code;
    private String tenSP;
    private String tenBST;
    private boolean gioiTinh;
    private int maThuongHieu;
    private int maLoaiSP;
    private int maBST;
    private String moTa;
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
    private String tenLoaiSP;
    
    public String getTenLoaiSP() {
        LoaiSP loaiSP = new LoaiSPDAO().getLoaiSPByMaLoai(maLoaiSP);
        if (loaiSP != null) {
            tenLoaiSP = loaiSP.getTenLoai();
        }
        return tenLoaiSP;
    }
    
    public void setTenLoaiSP(String tenLoaiSP) {
        this.tenLoaiSP = tenLoaiSP;
    }
    
    public String getHinhAnh() {
        return hinhAnh;
    }
    
    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
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
    
    public String getTenThuongHieu() {
        ThuongHieu th = new ThuongHieuDAO().getThuongHieuByMaTH(maThuongHieu);
        if (th != null) {
            tenThuongHieu = th.getTenThuongHieu();
        }
        return tenThuongHieu;
    }
    
    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }
    
    public String getTenBST() {
        return tenBST;
    }
    
    public void setTenBST(String tenBST) {
        this.tenBST = tenBST;
    }
    
    public List<Size> getListSize() {
        List<Size> list = new ArrayList<Size>();
        List<SanPhamSize> listSPSize = new SanPhamSizeDAO().getAllSizeBySanPham(maSP);
        SizeDAO sizeDAO = new SizeDAO();
        
        for (SanPhamSize sanPhamSize : listSPSize) {
            Size s = sizeDAO.getSizeByMaSize(sanPhamSize.getMaSize());
            list.add(s);
        }
        return list;
    }

    /**
     * Lấy ra list size để sử dụng trong javascript
     *
     * @return chuỗi size. VD: S|M|L|XL|
     */
    public String getListSizeString() {
        String str = "";
        for (Size size : getListSize()) {
            str += size.getTenSize() + "|";
        }
        return str;
    }

    /**
     * Lấy ra màu sắc để sử dụng trong javascript Thay dấu , thành |
     *
     * @return chuỗi màu sắc. VD: xanh lá|tím|hồng
     */
    public String getListMauSacString() {
        String str = mauSac.replace(",", "|");
        return str;
    }

    /**
     * lấy ra chuỗi mã loại để sử dụng trong javascript
     *
     * @return mã loại cha|mã loại con. VD: 1|12
     */
    public String getListMaLoai() {
        String str = "";
        LoaiSP loaiSP = new LoaiSPDAO().getLoaiSPByMaLoai(maLoaiSP);
        if (loaiSP != null) {
            str += loaiSP.getMaLoaiCha() + "|" + loaiSP.getMaLoai();
        }
        return str;
    }
}
