/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ChiTietHDDAO;
import com.kimfashion.dao.HinhAnhDAO;
import com.kimfashion.dao.HoaDonDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dto.ChiTietHD;
import com.kimfashion.form.SanPhamForm;
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
public class DeleteSanPham extends org.apache.struts.action.Action {

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

        SanPhamForm spForm = (SanPhamForm) form;
        SanPhamDAO spDAO = new SanPhamDAO();
        SanPhamSizeDAO sanPhamSizeDAO = new SanPhamSizeDAO();
        ChiTietHDDAO chiTietHDDAO = new ChiTietHDDAO();

        int maSP = spForm.getMaSP();
        // check sp còn trong HD nào k?
        List<ChiTietHD> list = chiTietHDDAO.getAllChiTietHDByMaSP(maSP);
        if (!list.isEmpty()) {
            return mapping.findForward("DeleteCTHoaDonNotOK");            
        }
        
        // xóa sp size trước
        if (!sanPhamSizeDAO.deleteSanPhamSize(maSP)) {
            return mapping.findForward("DeleteSanPhamNotOK");            
        }
        HinhAnhDAO hinhAnhDAO = new HinhAnhDAO();
        // xóa hình ảnh
        if (!hinhAnhDAO.deleteHinhAnh(maSP)) {
            return mapping.findForward("DeleteSanPhamNotOK");            
        }
        
        // xóa sp
        if (!spDAO.deleteSanPham(maSP)) {
            return mapping.findForward("DeleteSanPhamNotOK");
        }

        return mapping.findForward("DeleteSanPhamOK");
    }
}
