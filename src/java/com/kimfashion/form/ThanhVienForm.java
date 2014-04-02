/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
    private String password2;
    private boolean gioiTinh;
    private String email;
    private String hoTen;
    private boolean laAdmin;
    private boolean xacNhan;
    private String maXacNhan;
    private List<ThanhVien> listThanhVien;

    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        String regex;
        Pattern pattern;
        Matcher matcher;
        ThanhVienDAO tvdao = new ThanhVienDAO();

        if (tenDangNhap == null || tenDangNhap.trim().length() == 0) {
            err.add("tenDangNhap", new ActionMessage("errors.required", "tên đăng nhập"));
        } else {
            if (tenDangNhap.trim().length() < 6 || tenDangNhap.trim().length() > 20) {
                err.add("tenDangNhap", new ActionMessage("errors.rangelength", "Tên đăng nhập", "6", "20"));
            } else {
                regex = "^[a-zA-Z0-9_]*$";
                pattern = Pattern.compile(regex);
                matcher = pattern.matcher(tenDangNhap);

                if (!matcher.matches()) {
                    err.add("tenDangNhap", new ActionMessage("errors.specialcharacter", "Tên đăng nhập"));
                } else {
                    if (tvdao.getThanhVienByTenDN(tenDangNhap) != null) {
                        err.add("tenDangNhap", new ActionMessage("errors.exist", "Tên đăng nhập"));
                    }
                }
            }
        }

        if (password == null || password.trim().length() == 0) {
            err.add("password", new ActionMessage("errors.required", "Mật khẩu"));
        } else {
            if (password.trim().length() < 6 || password.trim().length() > 20) {
                err.add("password", new ActionMessage("errors.rangelength", "Mật khẩu", "từ 6", "20"));
            }
        }

        if (password2 == null || !password2.equals(password)) {
            err.add("password2", new ActionMessage("errors.equalTo", "Mật khẩu"));
        }

        if (email == null || email.trim().length() == 0) {
            err.add("email", new ActionMessage("errors.required", "email"));
        } else {
            if (email.trim().length() < 6 || email.trim().length() > 100) {
                err.add("email", new ActionMessage("errors.rangelength", "Email", "từ 6", "100"));
            } else {
                regex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
                pattern = Pattern.compile(regex);
                matcher = pattern.matcher(email);

                if (!matcher.matches()) {
                    err.add("email", new ActionMessage("errors.email"));
                } else {
                    if (tvdao.getThanhVienByEmail(email) != null) {
                        err.add("email", new ActionMessage("errors.exist", "Email"));
                    }
                }
            }
        }
        if (hoTen == null || hoTen.trim().length() == 0) {
            err.add("hoTen", new ActionMessage("errors.required", "họ tên"));
        }

        return err;
    }

    public boolean isXacNhan() {
        return xacNhan;
    }

    public void setXacNhan(boolean xacNhan) {
        this.xacNhan = xacNhan;
    }

    public String getMaXacNhan() {
        return maXacNhan;
    }

    public void setMaXacNhan(String maXacNhan) {
        this.maXacNhan = maXacNhan;
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

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
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
