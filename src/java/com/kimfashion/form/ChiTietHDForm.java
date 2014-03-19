/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import com.kimfashion.dto.ChiTietHD;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class ChiTietHDForm extends org.apache.struts.action.ActionForm {

    private int maHD;
    private int maSP;
    private int maSize;
    private int soLuong;
    private int donGia;
    private List<ChiTietHD> listChiTietHD;

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();

        if (maSP <= 0) {
            err.add("maSP", new ActionMessage("Bạn chưa chọn sản phẩm"));
        }

        if (maSize <= 0) {
            err.add("maSize", new ActionMessage("Bạn chưa chọn size"));
        }

        if (soLuong <= 0) {
            err.add("soLuong", new ActionMessage("Bạn chưa điền số lượng"));
        }
        
        if (donGia <= 0) {
            err.add("donGia", new ActionMessage("Bạn chưa điền đơn giá"));
        }
        
        return err;
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
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

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public List<ChiTietHD> getListChiTietHD() {
        return listChiTietHD;
    }

    public void setListChiTietHD(List<ChiTietHD> listChiTietHD) {
        this.listChiTietHD = listChiTietHD;
    }

}
