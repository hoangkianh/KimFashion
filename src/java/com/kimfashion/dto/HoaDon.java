package com.kimfashion.dto;

import com.kimfashion.dao.ThanhVienDAO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author KimHue
 */
public class HoaDon implements Serializable {
    private int maHD;
    private String ngayLapHD;
    private String ngayGiaoHang;
    private int maTV;
    private String hoTenNguoiNhan;
    private String sdtNguoiMua;
    private String sdtNguoiNhan;
    private String diaChiGiaoHang;
    private boolean trangThai;
    private String ghiChu;
    private List<ChiTietHD> listChiTietHD;

    public List<ChiTietHD> getListChiTietHD() {
        return listChiTietHD;
    }

    public void setListChiTietHD(List<ChiTietHD> listChiTietHD) {
        this.listChiTietHD = listChiTietHD;
    }

    public String getHoTenNguoiMua() {
        ThanhVien tv = new ThanhVienDAO().getThanhVienByMaTV(maTV);
        if (tv != null) {
            return tv.getHoTen();
        }
        return "";
    }
    
    public String getEmailNguoiMua() {
        ThanhVien tv = new ThanhVienDAO().getThanhVienByMaTV(maTV);
        if (tv != null) {
            return tv.getEmail();
        }
        return "";
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getHoTenNguoiNhan() {
        return hoTenNguoiNhan;
    }

    public void setHoTenNguoiNhan(String hoTenNguoiNhan) {
        this.hoTenNguoiNhan = hoTenNguoiNhan;
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public String getNgayLapHD() {
        return ngayLapHD;
    }

    public void setNgayLapHD(String ngayLapHD) {
        this.ngayLapHD = ngayLapHD;
    }

    public String getNgayGiaoHang() {
        return ngayGiaoHang;
    }

    public void setNgayGiaoHang(String ngayGiaoHang) {
        this.ngayGiaoHang = ngayGiaoHang;
    }

    public int getMaTV() {
        return maTV;
    }

    public void setMaTV(int maTV) {
        this.maTV = maTV;
    }

    public String getSdtNguoiMua() {
        return sdtNguoiMua;
    }

    public void setSdtNguoiMua(String sdtNguoiMua) {
        this.sdtNguoiMua = sdtNguoiMua;
    }
    

    public String getSdtNguoiNhan() {
        return sdtNguoiNhan;
    }

    public void setSdtNguoiNhan(String sdtNguoiNhan) {
        this.sdtNguoiNhan = sdtNguoiNhan;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public boolean isTrangThai() {
        return trangThai;
    }

    public void setTrangThai(boolean trangThai) {
        this.trangThai = trangThai;
    }
}
