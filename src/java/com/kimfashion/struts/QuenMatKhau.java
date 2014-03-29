/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.form.ThanhVienForm;
import com.kimfashion.utils.GuiMail;
import com.kimfashion.utils.MaHoaMD5;
import java.security.SecureRandom;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class QuenMatKhau extends org.apache.struts.action.Action {

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
        ThanhVienForm thanhVienForm = (ThanhVienForm) form;
        ThanhVienDAO tvdao = new ThanhVienDAO();
        ThanhVien tv = tvdao.getThanhVienByEmail(thanhVienForm.getEmail());

        if (tv != null) {
            // tạo password random
            Random random = new SecureRandom();
            char[] charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_".toCharArray();
            char[] result = new char[10];
            for (int i = 0; i < 10; i++) {
                int idx = random.nextInt(charset.length);
                result[i] = charset[idx];
            }

            String newPassword = new String(result);
            tv.setPassword(MaHoaMD5.maHoa(newPassword));

            StringBuffer requestURL = request.getRequestURL();
            String link = requestURL.substring(0, requestURL.lastIndexOf("/"));
            link += "/login.do";
            String subject = "Kimfashion - Quên mật khẩu";
            String noiDung = "Xin chào " + tv.getHoTen() + ",<br/><br/>"
                    + "Đây là mật khẩu mới của bạn:<b>" + newPassword + "</b><br/><br/>"
                    + "Hãy sử dụng mật khẩu mới và đăng nhập vào link dưới đây để có những phút giây mua hàng vui vẻ:<br/><br/>"
                    + link
                    + "<br/><br/>Nếu có câu hỏi muốn giải đáp, hãy liên hệ email: support@kimfashion.com"
                    + "<br/><br/>Xin chân thành cám ơn<br/><br/>Kimfashion.com";

            if (!GuiMail.sendEmail("kimhue1012.uct@gmail.com", "nhokyeuanh", tv.getEmail(), subject, noiDung)) {
                return mapping.findForward("GuiMailNotOK");
            }

            if (tvdao.updateThanhVien(tv)) {
                return mapping.findForward("forgotPassOK");
            }
        }

        return mapping.findForward("forgotPassNotOK");
    }
}
