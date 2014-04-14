/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.HinhAnhDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dto.HinhAnh;
import com.kimfashion.dto.SanPham;
import com.kimfashion.dto.SanPhamSize;
import com.kimfashion.form.SanPhamForm;
import java.util.ArrayList;
import java.util.List;
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
public class ThemSanPham extends org.apache.struts.action.Action {

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
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        HinhAnhDAO hinhAnhDAO = new HinhAnhDAO();
        SanPhamSizeDAO sanPhamSizeDAO = new SanPhamSizeDAO();
        
        SanPham sp = new SanPham();
        
        // thêm vào bảng sản phẩm
        BeanUtils.copyProperties(sp, spForm);
        
        if (!sanPhamDAO.addNewSanPham(sp)) {
            return mapping.findForward("ThemSanPhamNotOK");
        }
        // lấy maSP mới chèn vào csdl
        int maSPMoiNhat = sanPhamDAO.getMaSPMoiNhat();
        
        // thêm vào bảng hình ảnh
        List<HinhAnh> hinhAnhList = new ArrayList<HinhAnh>();
        hinhAnhList.add(new HinhAnh(spForm.getDuongDan0(), true));
        hinhAnhList.add(new HinhAnh(spForm.getDuongDan1(), false));
        hinhAnhList.add(new HinhAnh(spForm.getDuongDan2(), false));
        hinhAnhList.add(new HinhAnh(spForm.getDuongDan3(), false));
        hinhAnhList.add(new HinhAnh(spForm.getDuongDan4(), false));
        
        for (int i = 0; i < 4; i++) {
            hinhAnhList.get(i).setMaSP(maSPMoiNhat);
            if (!hinhAnhDAO.addNewHinhAnh(hinhAnhList.get(i))) {
                return mapping.findForward("ThemHinhAnhNotOK");                
            }
        }
        
        // thêm vào sanpham_size
        // cắt chuỗi size dể lấy ra mảng maSize
        String[] maSizeArray = spForm.getListSizeStringSPMoi().split("[|]");
        for (int i = 0; i < maSizeArray.length; i++) {
            try {
                int maSize = Integer.parseInt(maSizeArray[i]);
                
                SanPhamSize sanPhamSize = new SanPhamSize(maSPMoiNhat, maSize);
                if (!sanPhamSizeDAO.addNewSanPhamSize(sanPhamSize)){
                    return mapping.findForward("CapNhatSizeNotOK");                    
                }
            } catch (NumberFormatException e) {
                return mapping.findForward("CapNhatSizeNotOK");
            }
        }
        
        
        return mapping.findForward("ThemSanPhamOK");
    }
}
