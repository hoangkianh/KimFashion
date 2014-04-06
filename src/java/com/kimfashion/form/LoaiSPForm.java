/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dao.LoaiSPDAO;
import com.kimfashion.dto.LoaiSP;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class LoaiSPForm extends org.apache.struts.action.ActionForm {
    
    private int maLoai;
    private String tenLoai;
    private boolean gioiTinh;
    private int maLoaiCha;
    private String tenLoaiCha;
    private List<LoaiSP> listLoaiSP;
       
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        
        if (tenLoai == null || tenLoai.trim().length() == 0) {
            err.add("tenLoai", new ActionMessage("Bạn chưa điền tên loại"));
        }
        
        return err;
    }

    public int getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(int maLoai) {
        this.maLoai = maLoai;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public int getMaLoaiCha() {
        return maLoaiCha;
    }

    public void setMaLoaiCha(int maLoaiCha) {
        this.maLoaiCha = maLoaiCha;
    }

    public List<LoaiSP> getListLoaiSP() {
        return listLoaiSP;
    }

    public void setListLoaiSP(List<LoaiSP> listLoaiSP) {
        this.listLoaiSP = listLoaiSP;
    }

    public List<LoaiSP> getListLoaiSPCha() {
        return new LoaiSPDAO().getAllLoaiSPCha();
    }
    
    public List<LoaiSP> getListLoaiSPCon() {
        return new LoaiSPDAO().getAllLoaiSPCon();
    }

    public String getTenLoaiCha() {
        LoaiSP loaiSPCha = new LoaiSPDAO().getLoaiSPByMaLoai(maLoaiCha);
        if (loaiSPCha != null) {
            tenLoaiCha = loaiSPCha.getTenLoai();
        }
        return tenLoaiCha;
    }

    public void setTenLoaiCha(String tenLoaiCha) {
        this.tenLoaiCha = tenLoaiCha;
    }
}
