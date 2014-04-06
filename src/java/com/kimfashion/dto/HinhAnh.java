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
public class HinhAnh implements Serializable {
    private int maHinhAnh;
    private int maSP;
    private String duongDan;
    private boolean anhChinh;

    public HinhAnh() {
    }

    public HinhAnh(String duongDan, boolean anhChinh) {
        this.duongDan = duongDan;
        this.anhChinh = anhChinh;
    }

    public HinhAnh(int maHinhAnh, String duongDan, boolean anhChinh) {
        this.maHinhAnh = maHinhAnh;
        this.duongDan = duongDan;
        this.anhChinh = anhChinh;
    }
    public boolean isAnhChinh() {
        return anhChinh;
    }

    public void setAnhChinh(boolean anhChinh) {
        this.anhChinh = anhChinh;
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
}
