/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dto.SanPhamSize;
import com.kimfashion.form.SanPhamSizeForm;
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
public class SuaSizeSP extends org.apache.struts.action.Action {

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
        SanPhamSizeForm sanPhamSizeForm = (SanPhamSizeForm) form;
        SanPhamSizeDAO sanPhamSizeDAO = new SanPhamSizeDAO();
        
        int maSP = sanPhamSizeForm.getMaSP();
        // xóa tất cả size của sp trong csdl
        List<SanPhamSize> list = sanPhamSizeDAO.getAllSizeBySanPham(maSP);
        for (SanPhamSize sanPhamSize : list) {
            sanPhamSizeDAO.deleteSanPhamSize(maSP, sanPhamSize.getMaSize());
        }
        
        // sau đó add sp-size mới
        // cắt chuỗi size dể lấy ra mảng maSize
        String[] maSizeArray = sanPhamSizeForm.getListSizeString().split("|");
        for (int i = 1; i < maSizeArray.length; i+=2) {
            try {
                int maSize = Integer.parseInt(maSizeArray[i]);
                
                SanPhamSize sanPhamSize = new SanPhamSize(maSP, maSize);
                if (!sanPhamSizeDAO.addNewSanPhamSize(sanPhamSize)){
                    return mapping.findForward("CapNhatSizeNotOK");                    
                }
            } catch (NumberFormatException e) {
                return mapping.findForward("CapNhatSizeNotOK");
            }
        }
        return mapping.findForward("CapNhatSizeOK");
    }
}
