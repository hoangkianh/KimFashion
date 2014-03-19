/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dto.SanPhamSize;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class SanPhamSizeForm extends org.apache.struts.action.ActionForm {
    
    private int maSP;
    private int maSize;
    private int soLuongNhap;
    private int soLuongBan;
    private List<SanPhamSize> listSanPhamSize;
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        
        if (maSize <= 0) {
            err.add("maSize", new ActionMessage("Bạn chưa chọn size"));
        }
        
        if (soLuongNhap <= 0) {
            err.add("soLuongNhap", new ActionMessage("Bạn chưa điền số lượng nhập"));
        }
        
        if (soLuongBan <= 0) {
            err.add("soLuongBan", new ActionMessage("Bạn chưa điền số lượng bán"));
        }
        
        return err;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public int getMaSize() {
        return maSize;
    }

    public void setMaSize(int maSize) {
        this.maSize = maSize;
    }

    public int getSoLuongNhap() {
        return soLuongNhap;
    }

    public void setSoLuongNhap(int soLuongNhap) {
        this.soLuongNhap = soLuongNhap;
    }

    public int getSoLuongBan() {
        return soLuongBan;
    }

    public void setSoLuongBan(int soLuongBan) {
        this.soLuongBan = soLuongBan;
    }

    public List<SanPhamSize> getListSanPhamSize() {
        return listSanPhamSize;
    }

    public void setListSanPhamSize(List<SanPhamSize> listSanPhamSize) {
        this.listSanPhamSize = listSanPhamSize;
    }
    
    
}
