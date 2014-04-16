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
public class GetChiTietHD extends org.apache.struts.action.Action {

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
        
        try {
            int maHD = Integer.parseInt(request.getParameter("id"));
            HoaDon hd = new HoaDonDAO().getHoaDonByMaHD(maHD);
            
            if (hd == null) {
                return mapping.findForward("GetChiTietHDNotOK");                
            }
            
            List<ChiTietHD> list = new ChiTietHDDAO().getAllChiTietHDByMaHD(maHD);
            if (list.isEmpty()) {
                return mapping.findForward("GetChiTietHDNotOK");                
            }
            
            hd.setListChiTietHD(list);
            BeanUtils.copyProperties(hoaDonForm, hd);
            
            // set giá trị cho listChiTietHDString để dùng cho việc update
            String str = "";
            for (ChiTietHD chiTietHD : list) {
                str +=  chiTietHD.getMaSP()
                        + "~" + chiTietHD.getMaSize()
                        + "~" + chiTietHD.getSoLuong()
                        + "~" + chiTietHD.getDonGia() + "|";
            }
            
            hoaDonForm.setListChiTietHDString(str);
        } catch (NumberFormatException e) {
            return mapping.findForward("GetChiTietHDNotOK");
        }
        
        return mapping.findForward("GetChiTietHDOK");
    }
}
