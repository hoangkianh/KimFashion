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
public class ThanhVien implements Serializable {
    private int maTV;
    private String tenDangNhap;
    private String password;
    private boolean gioiTinh;
    private String email;
    private String hoTen;
    private boolean laAdmin;

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public int getMaTV() {
        return maTV;
    }

    public void setMaTV(int maTV) {
        this.maTV = maTV;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public boolean isLaAdmin() {
        return laAdmin;
    }

    public void setLaAdmin(boolean laAdmin) {
        this.laAdmin = laAdmin;
    }

}
