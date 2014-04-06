/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dto.SanPham;
import com.kimfashion.form.SanPhamForm;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author KimHue
 */
public class TimKiem extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        SanPhamForm sanPhamForm = (SanPhamForm) form;
        SanPhamDAO sanPhamDAO = new SanPhamDAO();

        String timKiem = sanPhamForm.getTimKiem();
        List<SanPham> list = sanPhamDAO.timKiem(timKiem);

        if (list.size() > 0) {
            sanPhamForm.setListSanPham(list);
            return mapping.findForward("TimKiemOK");
        }
        return mapping.findForward("TimKiemNotOK");
    }
}
