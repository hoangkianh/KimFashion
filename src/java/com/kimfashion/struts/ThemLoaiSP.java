/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.LoaiSPDAO;
import com.kimfashion.dto.LoaiSP;
import com.kimfashion.form.LoaiSPForm;
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
public class ThemLoaiSP extends org.apache.struts.action.Action {

   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        LoaiSPForm loaiSPForm = (LoaiSPForm) form;
        LoaiSPDAO loaiSPDAO = new LoaiSPDAO();
        
        LoaiSP loaiSP = new LoaiSP();
        
        BeanUtils.copyProperties(loaiSP, loaiSPForm);
        
        if (!loaiSPDAO.addNewLoaiSP(loaiSP)) {
            return mapping.findForward("ThemLoaiSPNotOK");

        }
        return mapping.findForward("ThemLoaiSPOK");
    }
}
