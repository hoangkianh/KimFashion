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
 * @author Kim Hue
 */
public class GetSPTrongBST extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        try {
            int maBST = Integer.parseInt(request.getParameter("id"));
            List<SanPham> list = new SanPhamDAO().getSPTrongBST(maBST);
            SanPhamForm sanPhamForm = (SanPhamForm) form;
            sanPhamForm.setListSanPham(list);
            sanPhamForm.setMaBST(maBST);
            
        } catch (Exception e) {
            e.printStackTrace();
            return mapping.findForward("GetBoSuuTapNotOK");
        }

        return mapping.findForward("GetBoSuuTapOK");
    }
}
