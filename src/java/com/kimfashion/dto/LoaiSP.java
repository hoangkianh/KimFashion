/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.dto;

import com.kimfashion.dao.LoaiSPDAO;
import java.io.Serializable;

/**
 *
 * @author Kim Hue
 */
public class LoaiSP implements Serializable {
    private int maLoai;
    private String tenLoai;
    private String tenLoaiCha;
    private boolean gioiTinh;
    private int maLoaiCha;

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
