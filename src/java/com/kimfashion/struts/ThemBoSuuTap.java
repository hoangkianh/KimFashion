/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.BoSuuTapDAO;
import com.kimfashion.dto.BoSuuTap;
import com.kimfashion.form.BoSuuTapForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class ThemBoSuuTap extends org.apache.struts.action.Action {

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
        
          BoSuuTapForm boSuuTapForm = (BoSuuTapForm) form;
        BoSuuTapDAO  bstdao = new BoSuuTapDAO();
        
        BoSuuTap bst = new BoSuuTap();
        
        BeanUtils.copyProperties(bst, boSuuTapForm);
        
        if (!bstdao.addNewBoSuuTap(bst)) {
            return mapping.findForward("ThemBoSuuTapNotOK");

        }
        return mapping.findForward("ThemBoSuuTapOK");
    }
}
