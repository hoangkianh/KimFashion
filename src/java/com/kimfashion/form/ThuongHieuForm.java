/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import com.kimfashion.dao.ThuongHieuDAO;
import com.kimfashion.dto.ThuongHieu;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class ThuongHieuForm extends org.apache.struts.action.ActionForm {

    private int maThuongHieu;
    private String tenThuongHieu;
    private List<ThuongHieu> listThuongHieu;

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();

        if (tenThuongHieu == null || tenThuongHieu.trim().length() == 0) {
            err.add("tenThuongHieu", new ActionMessage("Bạn chưa điền tên thương hiệu"));
        }
        return err;
    }

    public int getMaThuongHieu() {
        return maThuongHieu;
    }

    public void setMaThuongHieu(int maThuongHieu) {
        this.maThuongHieu = maThuongHieu;
    }

    public String getTenThuongHieu() {
        return tenThuongHieu;
    }

    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }

    public List<ThuongHieu> getListThuongHieu() {
        if (listThuongHieu == null || listThuongHieu.isEmpty()) {
            return new ThuongHieuDAO().getAllThuongHieu();
        }
        return listThuongHieu;
    }

    public void setListThuongHieu(List<ThuongHieu> listThuongHieu) {
        this.listThuongHieu = listThuongHieu;
    }
}
