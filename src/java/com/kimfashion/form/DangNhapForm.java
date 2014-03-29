/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

/**
 *
 * @author HKA
 */
public class DangNhapForm extends org.apache.struts.action.ActionForm {
    
    private String tenDangNhap;
    private String password;
    private String error;
    private boolean luuLai;

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public boolean isLuuLai() {
        return luuLai;
    }

    public void setLuuLai(boolean luuLai) {
        this.luuLai = luuLai;
    }
}
