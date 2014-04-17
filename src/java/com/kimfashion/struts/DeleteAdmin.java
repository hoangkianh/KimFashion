/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.form.ThanhVienForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class DeleteAdmin extends org.apache.struts.action.Action {

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

        ThanhVienDAO thanhVienDAO = new ThanhVienDAO();

        try {
            int maTV = Integer.parseInt(request.getParameter("id"));
            ThanhVien tv = thanhVienDAO.getThanhVienByMaTV(maTV);
            
            if (tv == null) {
                return mapping.findForward("DeleteAdminNotOK");                
            }
            
            tv.setLaAdmin(false);
            
            if (!thanhVienDAO.updateThanhVien(tv)) {
                return mapping.findForward("DeleteAdminNotOK");                
            }
        } catch (NumberFormatException ex) {
            return mapping.findForward("DeleteAdminNotOK");
        }

        return mapping.findForward("DeleteAdminOK");
    }
}
