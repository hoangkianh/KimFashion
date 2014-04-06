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
 * @author HKA
 */
public class GetSPByThuongHieu extends org.apache.struts.action.Action {


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
            int maThuongHieu = Integer.parseInt(request.getParameter("id"));
            List<SanPham> list = new SanPhamDAO().getSanPhamByThuongHieu(maThuongHieu);
            SanPhamForm sanPhamForm = (SanPhamForm) form;
            sanPhamForm.setListSanPham(list);
            sanPhamForm.setMaThuongHieu(maThuongHieu);
        } catch (Exception e) {
            return mapping.findForward("GetSanPhamNotOK");
        }
        
        
        return mapping.findForward("GetSanPhamOK");
    }
}
