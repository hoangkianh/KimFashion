/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.ChiTietHDDAO;
import com.kimfashion.dao.HoaDonDAO;
import com.kimfashion.dto.ChiTietHD;
import com.kimfashion.dto.HoaDon;
import com.kimfashion.form.HoaDonForm;
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
 * @author HKA
 */
public class SuaHD extends org.apache.struts.action.Action {

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
        
        HoaDon hd = hoaDonDAO.getHoaDonByMaHD(hoaDonForm.getMaHD());
        if (hd == null) {
            return mapping.findForward("SuaHDNotOK");
        }
        List<ChiTietHD> list = new ArrayList<ChiTietHD>();
        
        BeanUtils.copyProperties(hd, hoaDonForm);
        
        // cập nhật trạng thái HD
        if (!hoaDonDAO.updateHoaDon(hd)) {
            return mapping.findForward("SuaHDNotOK");            
        }
        
        ////// cập nhật lại số lượng trong chi tiết HD
        // lấy ra listChiTietHDString từ hoaDonForm
        // vd: 1~1~2~449000|1~2~3~449000|
        String listChiTietHDString = hoaDonForm.getListChiTietHDString();
        // cắt chuỗi theo dấu |
        String[] arrayChiTietHD = listChiTietHDString.split("[|]");
        
        // duyệt từng string trong mảng và tạo ra các chiTietHD 
        for (int i = 0; i < arrayChiTietHD.length; i++) {
            // cắt tiếp theo dấu ~
            String[] arrayChiTiet = arrayChiTietHD[i].split("~");
            
            ChiTietHD chiTietHD = new ChiTietHD();
            chiTietHD.setMaHD(hd.getMaHD());
            chiTietHD.setMaSP(Integer.parseInt(arrayChiTiet[0]));
            chiTietHD.setMaSize(Integer.parseInt(arrayChiTiet[1]));
            chiTietHD.setSoLuong(Integer.parseInt(arrayChiTiet[2]));
            chiTietHD.setDonGia(Integer.parseInt(arrayChiTiet[3]));
            
            // sau đó add vào list
            list.add(chiTietHD);
        }
        
        for (ChiTietHD chiTietHD : list) {
            if (!chiTietHDDAO.updateChiTietHD(chiTietHD)) {
                return mapping.findForward("SuaHDNotOK");
            }
        }
        
        return mapping.findForward("SuaHDOK");
    }
}
