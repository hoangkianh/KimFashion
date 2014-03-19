/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import com.kimfashion.dto.ThanhVien;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class ThanhVienForm extends org.apache.struts.action.ActionForm {

    private int maTV;
    private String tenDangNhap;
    private String password;
    private boolean gioiTinh;
    private String email;
    private String hoTen;
    private boolean laAdmin;
    private List<ThanhVien> listThanhVien;

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();

        if (password == null || password.trim().length() == 0) {
            err.add("password", new ActionMessage("Bạn chưa điền password"));
        } else {
            if (password.trim().length() < 6 || password.trim().length() > 20) {
                err.add("password", new ActionMessage("Password từ 6 - 20 kí tự"));
            }
        }
        
        if (email == null || email.trim().length() == 0) {
            err.add("email", new ActionMessage("Bạn chưa điền email"));
        } else {
            if (email.trim().length() < 6 || email.trim().length() > 20) {
                err.add("email", new ActionMessage("Email từ 6 - 100 kí tự"));
            }
        }
        if (hoTen == null || hoTen.trim().length() == 0) {
            err.add("hoTen", new ActionMessage("Bạn chưa điền họ tên"));
        } 
        
        return err;
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

    public List<ThanhVien> getListThanhVien() {
        return listThanhVien;
    }

    public void setListThanhVien(List<ThanhVien> listThanhVien) {
        this.listThanhVien = listThanhVien;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

}
