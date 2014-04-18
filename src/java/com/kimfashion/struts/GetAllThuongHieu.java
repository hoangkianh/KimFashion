/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.struts;

import com.kimfashion.dao.ThuongHieuDAO;
import com.kimfashion.dto.ThuongHieu;
import com.kimfashion.form.ThuongHieuForm;
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
public class GetAllThuongHieu extends org.apache.struts.action.Action {

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
       
        ThuongHieuForm thuongHieuForm = (ThuongHieuForm) form;
        List<ThuongHieu> list = new ThuongHieuDAO().getAllThuongHieu();

        return mapping.findForward("GetThuongHieuOK");
    }
}
