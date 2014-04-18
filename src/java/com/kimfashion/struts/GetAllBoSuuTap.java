/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.BoSuuTapDAO;
import com.kimfashion.dto.BoSuuTap;
import com.kimfashion.form.BoSuuTapForm;
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
public class GetAllBoSuuTap extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        BoSuuTapForm boSuuTapForm = (BoSuuTapForm) form;
        List<BoSuuTap> list = new BoSuuTapDAO().getAllBoSuuTap();
        boSuuTapForm.setListBST(list);
        return mapping.findForward("GetBoSuuTapOK");
    }
}
