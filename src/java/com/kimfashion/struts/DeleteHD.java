/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.ChiTietHDDAO;
import com.kimfashion.dao.HoaDonDAO;
import com.kimfashion.form.HoaDonForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Kim Hue
 */
public class DeleteHD extends org.apache.struts.action.Action {

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
        HoaDonForm hoaDonForm = (HoaDonForm) form;
        HoaDonDAO hoaDonDAO = new HoaDonDAO();
        ChiTietHDDAO chiTietHDDAO = new ChiTietHDDAO();
        
        int maHD = hoaDonForm.getMaHD();
        
        // xóa chi tiết HD trước
        if (!chiTietHDDAO.deleteChiTietHD(maHD)) {
            return mapping.findForward("DeleteHDNotOK");            
        }
        
        // xóa tiếp hóa đơn
        if (!hoaDonDAO.deleteHoaDon(maHD)) {
            return mapping.findForward("DeleteHDNotOK");            
        }        
        
        return mapping.findForward("DeleteHDOK");
    }
}
