/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.BoSuuTapDAO;
import com.kimfashion.form.BoSuuTapForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class DeleteBoSuuTap extends org.apache.struts.action.Action {

   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
         BoSuuTapForm boSuuTapForm = (BoSuuTapForm) form;
        BoSuuTapDAO bstdao = new BoSuuTapDAO();
        int maBST = boSuuTapForm.getMaBST();
        
        // xóa bst
        if (!bstdao.deleteBoSuuTap(maBST)) {
            return mapping.findForward("DeleteBoSuuTapNotOK");
        }

        return mapping.findForward("DeleteBoSuuTapOK");
    }
}
