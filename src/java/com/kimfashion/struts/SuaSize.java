/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.SizeDAO;
import com.kimfashion.dto.Size;
import com.kimfashion.form.SizeForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author KimHue
 */
public class SuaSize extends org.apache.struts.action.Action {

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
        
        SizeForm sizeForm = (SizeForm) form;
        SizeDAO sizeDAO = new SizeDAO();

        Size s = sizeDAO.getSizeByMaSize(sizeForm.getMaSize());

        if (s == null) {
            return mapping.findForward("CapNhatSizeNotOK");
        }

        BeanUtils.copyProperties(s, sizeForm);

        if (!sizeDAO.updateSize(s)) {
            return mapping.findForward("CapNhatSizeNotOK");
        }

        return mapping.findForward("CapNhatSizeOK");
    }
}
