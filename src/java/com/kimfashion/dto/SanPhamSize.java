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
public class SanPhamSize implements Serializable {
    private int maSP;
    private int maSize;

    public SanPhamSize() {
    }

    public SanPhamSize(int maSP, int maSize) {
        this.maSP = maSP;
        this.maSize = maSize;
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

}
