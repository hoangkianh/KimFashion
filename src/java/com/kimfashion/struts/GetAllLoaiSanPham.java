/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.LoaiSPDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dto.LoaiSP;
import com.kimfashion.dto.SanPham;
import com.kimfashion.form.LoaiSPForm;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Kim Hue
 */
public class GetAllLoaiSanPham extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        LoaiSPForm loaiSPForm = (LoaiSPForm) form;
        List<LoaiSP> list = new LoaiSPDAO().getAllLoaiSP();

        if (list.size() > 0) {
            loaiSPForm.setListLoaiSP(list);
            return mapping.findForward("GetLoaiSPOK");

        }
        return mapping.findForward("GetLoaiSPNotOK");
    }
}
