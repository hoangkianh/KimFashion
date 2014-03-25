/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.dto;

import java.io.Serializable;

/**
 *
 * @author Kim Hue
 */
public class BoSuuTap implements Serializable{
    private int maBST;
    private boolean gioiTinh;
    private String tenBST;
    private String anhDaiDien;

    public int getMaBST() {
        return maBST;
    }

    public void setMaBST(int MaBST) {
        this.maBST = MaBST;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean GioiTinh) {
        this.gioiTinh = GioiTinh;
    }

    public String getTenBST() {
        return tenBST;
    }

    public void setTenBST(String TenBST) {
        this.tenBST = TenBST;
    }

    public String getAnhDaiDien() {
        return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
        this.anhDaiDien = anhDaiDien;
    }
    
    
}
