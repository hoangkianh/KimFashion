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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class DangKy extends org.apache.struts.action.Action {

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
        ThanhVien tv = new ThanhVien();

        BeanUtils.copyProperties(tv, thanhVienForm);
        tv.setPassword(MaHoaMD5.maHoa(tv.getPassword()));// mã hóa password
        tv.setXacNhan(false);

        // tạo mã xác nhận
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        tv.setMaXacNhan(MaHoaMD5.maHoa(dateFormat.format(new Date())));

        // gửi mail
        String link = "http://localhost:8080/KimFashion/confirm.do?";
        String subject = "Kimfashion - Xác nhận tài khoản";
        String noiDung = "Xin chào " + tv.getHoTen() + ",<br/><br/>"
                + "Bạn đã đăng ký tài khoản tại Kimfashion<br/><br/>"
                + "Hãy click vào link dưới đây để xác nhận và kích hoạt tài khoản của bạn:<br/><br/>"
                + link + "e=" + tv.getEmail() + "&s=" + tv.getMaXacNhan()
                + "<br/><br/>Nếu có câu hỏi muốn giải đáp, hãy liên hệ email: support@kimfashion.com"
                + "<br/><br/>Xin chân thành cám ơn<br/><br/>Kimfashion.com";

        if (!GuiMail.sendEmail("hoangkianh31592@gmail.com", "h0@ngki@nh", tv.getEmail(), subject, noiDung)) {
            return mapping.findForward("GuiMailNotOK");
        }

        // insert vào db
        if (!new ThanhVienDAO().addNewThanhVien(tv)) {
            return mapping.findForward("DangKyNotOK");
        }

        return mapping.findForward("DangKyOK");
    }
}
