/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.utils.GuiMail;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class Confirm extends org.apache.struts.action.Action {

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
        String email = request.getParameter("e");
        String maXacNhan = request.getParameter("s");

        ThanhVienDAO tvdao = new ThanhVienDAO();
        ThanhVien tv = tvdao.getThanhVienByEmail(email);

        if (tv != null) {
            if (tv.isXacNhan()) {
                return mapping.findForward("confirmRedirect");
            }

            // xác nhận thành viên
            if (maXacNhan.equals(tv.getMaXacNhan()) && tvdao.xacNhan(tv)) {
                StringBuffer requestURL = request.getRequestURL();
                String link = requestURL.substring(0, requestURL.lastIndexOf("/"));

                link += "/login.do";
                String subject = "Kimfashion - Chào mừng " + tv.getHoTen() + "";
                String noiDung = "Xin chào " + tv.getHoTen() + ",<br/><br/>"
                        + "Bạn đã đăng ký và xác nhận thành công tài khoản tại Kimfashion<br/><br/>"
                        + "Hãy đăng nhập vào link dưới đây để có những phút giây mua hàng vui vẻ:<br/><br/>"
                        + link
                        + "<br/><br/>Nếu có câu hỏi muốn giải đáp, hãy liên hệ email: support@kimfashion.com"
                        + "<br/><br/>Xin chân thành cám ơn<br/><br/>Kimfashion.com";

                if (!GuiMail.sendEmail("kimhue1012.uct@gmail.com", "nhokyeuanh", tv.getEmail(), subject, noiDung)) {
                    return mapping.findForward("GuiMailNotOK");
                }
                
                return mapping.findForward("confirmOK");
            }
        }
        return mapping.findForward("confirmNotOK");
    }
}
