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
public class GetThongTinTV extends org.apache.struts.action.Action {

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
                return mapping.findForward("GetThongTinNotOK");
            }

            ThanhVienForm thanhVienForm = (ThanhVienForm) form;
            BeanUtils.copyProperties(thanhVienForm, tv);
        } catch (Exception ex) {
            return mapping.findForward("GetThongTinNotOK");
        }
        return mapping.findForward("GetThongTinOK");
    }
}
