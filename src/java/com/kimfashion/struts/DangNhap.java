/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.form.DangNhapForm;
import com.kimfashion.utils.MaHoaMD5;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author HKA
 */
public class DangNhap extends org.apache.struts.action.Action {

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
        DangNhapForm dangNhapForm = (DangNhapForm) form;
        HttpSession session = request.getSession(true);

        ThanhVien tv = new ThanhVienDAO().dangNhap(dangNhapForm.getTenDangNhap(), MaHoaMD5.maHoa(dangNhapForm.getPassword()));
        if (tv == null) {
            dangNhapForm.setError("Tên đăng nhập hoặc mật khẩu không hợp lệ");
            return mapping.findForward("dangNhapNotOK");
        }
        
        dangNhapForm.setError("");
        
        String value = tv.getMaTV() + 
                "~" + tv.getTenDangNhap() +
                "~" + tv.isLaAdmin() + 
                "~" + tv.getHoTen() +
                "~" + tv.getEmail();
        
        // tạo session
        session.setAttribute("kimfashion", value);
        
        // tạo cookie nếu user chọn lưu lại
        if (dangNhapForm.isLuuLai()) {
            Cookie cookie = new Cookie("kimfashion", URLEncoder.encode(value, "UTF-8"));
            cookie.setMaxAge(7 * 24 * 60 * 60); // thời gian là 1 tuần
            response.addCookie(cookie);
        }
        
        String s = "khachHangDangNhapOK";
        
        if (tv.isLaAdmin()) {
            s = "adminDangNhapOK";
        }
        
        // kiểm tra đăng nhập từ trang nào
        String link = request.getHeader("referer"); // lấy link mà user đăng nhập vào
        // nếu đăng nhập từ trang giỏ hàng thì quay lại trang checkout.do
        if (link.substring(link.lastIndexOf("/")).equals("/checkout.do")) {
            s = "gioHangDangNhapOK";
        }
       
        return mapping.findForward(s);
    }
}
