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
    private int maHinhAnh0;
    private String duongDan0;
    private int maHinhAnh1;
    private String duongDan1;
    private int maHinhAnh2;
    private String duongDan2;
    private int maHinhAnh3;
    private String duongDan3;
    private int maHinhAnh4;
    private String duongDan4;
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

    public String getDuongDan0() {
        return duongDan0;
    }

    public void setDuongDan0(String duongDan0) {
        this.duongDan0 = duongDan0;
    }

    public String getDuongDan1() {
        return duongDan1;
    }

    public void setDuongDan1(String duongDan1) {
        this.duongDan1 = duongDan1;
    }

    public String getDuongDan2() {
        return duongDan2;
    }

    public void setDuongDan2(String duongDan2) {
        this.duongDan2 = duongDan2;
    }

    public String getDuongDan3() {
        return duongDan3;
    }

    public void setDuongDan3(String duongDan3) {
        this.duongDan3 = duongDan3;
    }

    public String getDuongDan4() {
        return duongDan4;
    }

    public void setDuongDan4(String duongDan4) {
        this.duongDan4 = duongDan4;
    }

    public int getMaHinhAnh0() {
        return maHinhAnh0;
    }

    public void setMaHinhAnh0(int maHinhAnh0) {
        this.maHinhAnh0 = maHinhAnh0;
    }

    public int getMaHinhAnh1() {
        return maHinhAnh1;
    }

    public void setMaHinhAnh1(int maHinhAnh1) {
        this.maHinhAnh1 = maHinhAnh1;
    }

    public int getMaHinhAnh2() {
        return maHinhAnh2;
    }

    public void setMaHinhAnh2(int maHinhAnh2) {
        this.maHinhAnh2 = maHinhAnh2;
    }

    public int getMaHinhAnh3() {
        return maHinhAnh3;
    }

    public void setMaHinhAnh3(int maHinhAnh3) {
        this.maHinhAnh3 = maHinhAnh3;
    }

    public int getMaHinhAnh4() {
        return maHinhAnh4;
    }

    public void setMaHinhAnh4(int maHinhAnh4) {
        this.maHinhAnh4 = maHinhAnh4;
    }
}
