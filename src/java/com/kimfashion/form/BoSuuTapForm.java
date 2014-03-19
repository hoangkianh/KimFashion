/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dao.BoSuuTapDAO;
import com.kimfashion.dto.BoSuuTap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class BoSuuTapForm extends org.apache.struts.action.ActionForm {

    private int maBST;
    private boolean gioiTinh;
    private String tenBST;  
    private String anhDaiDien;  
    private List<BoSuuTap> listBST;
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        
        if (tenBST == null || tenBST.trim().length() == 0) {
            err.add("tenBST", new ActionMessage("Bạn chưa điền tiền bộ sản phẩm"));
        }else{
            if (tenBST.trim().length() < 4 || tenBST.trim().length() > 100) {
                err.add("tenBST", new ActionMessage("Tên bộ sưu tập từ 4 - 100 kí tự"));
            }
        }
        return err;
    }

    public int getMaBST() {
        return maBST;
    }

    public void setMaBST(int maBST) {
        this.maBST = maBST;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getTenBST() {
        return tenBST;
    }

    public void setTenBST(String tenBST) {
        this.tenBST = tenBST;
    }

    public List<BoSuuTap> getListBST() {
        return listBST;
    }

    public void setListBST(List<BoSuuTap> listBST) {
        this.listBST = listBST;
    }

    public String getAnhDaiDien() {
        return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
        this.anhDaiDien = anhDaiDien;
    }
    
    public List<BoSuuTap> getListRandomBST(){
        return new BoSuuTapDAO().getBoSuuTapRandom();
    }
}
