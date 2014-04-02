/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.form.ThanhVienForm;
import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Kim Hue
 */
public class CapNhatThongTinTV extends org.apache.struts.action.Action {

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

        int maTV = 0;
        HttpSession session = request.getSession(true);
        String s = (String) session.getAttribute("kimfashion");
        if (s == null || s.isEmpty()) {
            Cookie cookie = null;
            if (request.getCookies() != null) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("kimfashion")) {
                        cookie = c;
                    }
                }
            }

            if (cookie == null) {
                return mapping.findForward("GetThongTinNotOK");
            }
            s = URLDecoder.decode(cookie.getValue(), "UTF-8");
        }
        try {
            maTV = Integer.parseInt(s.split("~")[0]);
            ThanhVien tv = new ThanhVienDAO().getThanhVienByMaTV(maTV);

            if (tv == null) {
                return mapping.findForward("CapNhatThongTinNotOK");
            }

            // nếu tên tv rỗng thì lấy tên cũ trong cookie hoặc session ra
            if (thanhVienForm.getHoTen().isEmpty()) {
                tv.setHoTen(s.split("~")[3]);
            } else {
                BeanUtils.copyProperties(tv, thanhVienForm);
            }

            // nếu update không thành công
            if (!tvdao.updateThanhVien(tv)) {
                return mapping.findForward("CapNhatThongTinNotOK");
            }

            // nếu cập nhật thành công thì update cookie & session
            Cookie cookie = null;
            if (request.getCookies() != null) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("kimfashion")) {
                        cookie = c;
                    }
                }
            }

            String value = tv.getMaTV()
                    + "~" + tv.getTenDangNhap()
                    + "~" + tv.isLaAdmin()
                    + "~" + tv.getHoTen()
                    + "~" + tv.getEmail();
            session.setAttribute("kimfashion", value);
            if (cookie != null) {
                cookie.setValue(URLEncoder.encode(value, "UTF-8"));
                cookie.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(cookie);
            }
        } catch (Exception ex) {
            return mapping.findForward("CapNhatThongTinNotOK");
        }

        return mapping.findForward("CapNhatThongTinOK");
    }
}
