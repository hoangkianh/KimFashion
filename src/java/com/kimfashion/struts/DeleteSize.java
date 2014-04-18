/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dao.SizeDAO;
import com.kimfashion.dto.SanPham;
import com.kimfashion.dto.SanPhamSize;
import com.kimfashion.form.SizeForm;
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
public class DeleteSize extends org.apache.struts.action.Action {

   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        SizeForm sizeForm = (SizeForm) form;
        SizeDAO sizeDAO = new SizeDAO();
        SanPhamSizeDAO sanPhamSizeDAO = new SanPhamSizeDAO();
        int maSize = sizeForm.getMaSize();
        
        
        // xóa sp_size trước
        if (!sanPhamSizeDAO.deleteSanPhamSize(maSize)) {
            return mapping.findForward("DeleteSizeNotOK");            
        }
        
        // xóa size
        if (!sizeDAO.deleteSize(maSize)) {
            return mapping.findForward("DeleteSizeNotOK");
        }

        return mapping.findForward("DeleteSizeOK");
    }
}
