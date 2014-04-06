/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dto.SanPham;
import com.kimfashion.form.SanPhamForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Kim Hue
 */
public class SuaSanPham extends org.apache.struts.action.Action {

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
        SanPhamForm sanPhamForm = (SanPhamForm) form;
        SanPhamDAO spDao = new SanPhamDAO();

        SanPham sp = spDao.getSanPhamByMaSPAdmin(sanPhamForm.getMaSP());

        if (sp == null) {
            return mapping.findForward("CapNhatSanPhamNotOK");
        }

        if (sanPhamForm.isDangKM() == false) {
            sanPhamForm.setGiaBanKM(0);
        }
        
        BeanUtils.copyProperties(sp, sanPhamForm);
        
        if (!spDao.updateSanPham(sp)) {
            return mapping.findForward("CapNhatSanPhamNotOK");
        }

        return mapping.findForward("CapNhatSanPhamOK");
    }
}
