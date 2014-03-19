/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dto.HinhAnh;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class HinhAnhForm extends org.apache.struts.action.ActionForm {
    
    private int maHinhAnh;
    private int maSP;
    private String duongDan;
    private boolean anhChinh;
    private List<HinhAnh> listHinhAnh;
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        if (maSP <= 0) {
           err.add("maSP", new ActionMessage("Bạn chưa chọn sản phẩm"));
        }
        
        if (duongDan == null || duongDan.trim().length() == 0) {
            err.add("duongDan", new ActionMessage("Bạn chưa điền đường dẫn"));
        }
        
        return err;
    }

    public int getMaHinhAnh() {
        return maHinhAnh;
    }

    public void setMaHinhAnh(int maHinhAnh) {
        this.maHinhAnh = maHinhAnh;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getDuongDan() {
        return duongDan;
    }

    public void setDuongDan(String duongDan) {
        this.duongDan = duongDan;
    }

    public boolean isAnhChinh() {
        return anhChinh;
    }

    public void setAnhChinh(boolean anhChinh) {
        this.anhChinh = anhChinh;
    }

    public List<HinhAnh> getListHinhAnh() {
        return listHinhAnh;
    }

    public void setListHinhAnh(List<HinhAnh> listHinhAnh) {
        this.listHinhAnh = listHinhAnh;
    }
}
