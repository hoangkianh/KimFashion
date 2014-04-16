/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.ThuongHieuDAO;
import com.kimfashion.dto.ThuongHieu;
import com.kimfashion.form.ThuongHieuForm;
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
public class SuaThuongHieu extends org.apache.struts.action.Action {

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
        
        ThuongHieuForm thuongHieuForm = (ThuongHieuForm) form;
        ThuongHieuDAO thdao = new ThuongHieuDAO();

        ThuongHieu th = thdao.getThuongHieuByMaTH(thuongHieuForm.getMaThuongHieu());

        if (th == null) {
            return mapping.findForward("CapNhatThuongHieuNotOK");
        }

        BeanUtils.copyProperties(th, thuongHieuForm);

        if (!thdao.updateThuongHieu(th)) {
            return mapping.findForward("CapNhatThuongHieuNotOK");
        }

        return mapping.findForward("CapNhatThuongHieuOK");
    }
}
