/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author HKA
 */
public class CapNhatMatKhauForm extends org.apache.struts.action.ActionForm {

    private String password;
    private String passwordMoi;
    private String passwordMoi2;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordMoi() {
        return passwordMoi;
    }

    public void setPasswordMoi(String passwordMoi) {
        this.passwordMoi = passwordMoi;
    }

    public String getPasswordMoi2() {
        return passwordMoi2;
    }

    public void setPasswordMoi2(String passwordMoi2) {
        this.passwordMoi2 = passwordMoi2;
    }
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();

        if (passwordMoi == null || passwordMoi.trim().length() == 0) {
            err.add("newPass", new ActionMessage("errors.required", "Mật khẩu mới"));
        } else {
            if (passwordMoi.trim().length() < 6 || passwordMoi.trim().length() > 30) {
                err.add("password", new ActionMessage("errors.rangelength", "Mật khẩu mới", "từ 6", "20"));
            }
        }

        // validate confirm password
        if (passwordMoi2 != null && !passwordMoi2.equals(passwordMoi2)) {
            err.add("password2", new ActionMessage("errors.equalTo", "Mật khẩu nhập lại"));
        }
        return err;
    }
}
