/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dto.HoaDon;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class HoaDonForm extends org.apache.struts.action.ActionForm {

    private int maHD;
    private String ngayLapHD;
    private String ngayGiaoHang;
    private int maTV;
    private String diaChiTV;
    private String dienThoaiTV;
    private String hoTenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiGiaoHang;
    private boolean trangThai;
    private String ghiChu;
    private List<HoaDon> listHoaDon;
   
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
                
        if (sdtNguoiNhan == null || sdtNguoiNhan.trim().length() == 0) {
            err.add("sdtNguoiNhan", new ActionMessage("Bạn chưa điền số điện thoại người nhận"));
        }
        
        if (diaChiGiaoHang == null || diaChiGiaoHang.trim().length() == 0) {
            err.add("diaChiGiaoHang", new ActionMessage("Bạn chưa điền địa chỉ giao hàng"));
        }
        return err;
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

    public List<HoaDon> getListHoaDon() {
        return listHoaDon;
    }

    public void setListHoaDon(List<HoaDon> listHoaDon) {
        this.listHoaDon = listHoaDon;
    }

    public String getDiaChiTV() {
        return diaChiTV;
    }

    public void setDiaChiTV(String diaChiTV) {
        this.diaChiTV = diaChiTV;
    }    

    public String getDienThoaiTV() {
        return dienThoaiTV;
    }

    public void setDienThoaiTV(String dienThoaiTV) {
        this.dienThoaiTV = dienThoaiTV;
    }

    public String getHoTenNguoiNhan() {
        return hoTenNguoiNhan;
    }

    public void setHoTenNguoiNhan(String hoTenNguoiNhan) {
        this.hoTenNguoiNhan = hoTenNguoiNhan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
