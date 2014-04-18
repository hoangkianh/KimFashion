/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.ThuongHieuDAO;
import com.kimfashion.form.ThuongHieuForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class DeleteThuongHieu extends org.apache.struts.action.Action {

    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        ThuongHieuForm thuongHieuForm = (ThuongHieuForm) form;
        ThuongHieuDAO thdao = new ThuongHieuDAO();
        int maTH = thuongHieuForm.getMaThuongHieu();
        
        // xóa th
        if (!thdao.deleteThuongHieu(maTH)) {
            return mapping.findForward("DeleteThuongHieuNotOK");
        }

        return mapping.findForward("DeleteThuongHieuOK");
    }
}
