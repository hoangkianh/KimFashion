/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.HinhAnhDAO;
import com.kimfashion.dto.HinhAnh;
import com.kimfashion.form.HinhAnhForm;
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
public class GetAllHinhAnhBySanPham extends org.apache.struts.action.Action {

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
        HinhAnhForm hinhAnhForm = (HinhAnhForm) form;
        HinhAnhDAO hinhAnhDAO = new HinhAnhDAO();
        
        // lấy id của sp
        try {
            int maSP = Integer.parseInt(request.getParameter("id"));
            List<HinhAnh> list = hinhAnhDAO.getAllHinhAnhByMaSP(maSP);
            hinhAnhForm.setListHinhAnh(list);
            hinhAnhForm.setMaSP(maSP);
            
        } catch (NumberFormatException e) {
            return mapping.findForward("GetHinhAnhNotOK");
        }
        
        return mapping.findForward("GetHinhAnhOK");
    }
}
