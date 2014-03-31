/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.struts;

import com.kimfashion.dao.ChiTietHDDAO;
import com.kimfashion.dao.HoaDonDAO;
import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dto.ChiTietHD;
import com.kimfashion.dto.HoaDon;
import com.kimfashion.dto.ThanhVien;
import com.kimfashion.form.HoaDonForm;
import java.net.URLDecoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Kim Hue
 */
public class ThanhToan extends org.apache.struts.action.Action {

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
        HoaDonDAO hddao = new HoaDonDAO();
        ChiTietHDDAO chiTietHDDAO = new ChiTietHDDAO();
        HoaDon hd = new HoaDon();
        ThanhVien tv = new ThanhVienDAO().getThanhVienByMaTV(hoaDonForm.getMaTV());

        if (tv != null
                || !hoaDonForm.getDiaChiTV().isEmpty()
                || !hoaDonForm.getDienThoaiTV().isEmpty()) {
            // nếu giao hàng tới địa chỉ trên hóa đơn
            if (hoaDonForm.getHoTenNguoiNhan().isEmpty()) {
                hoaDonForm.setHoTenNguoiNhan(tv.getHoTen());
                hoaDonForm.setSdtNguoiNhan(hoaDonForm.getDienThoaiTV());
                hoaDonForm.setDiaChiGiaoHang(hoaDonForm.getDiaChiTV());
            }

            BeanUtils.copyProperties(hd, hoaDonForm);

            if (hddao.addNewHoaDon(hd)) {
                // lấy maHD của HD vừa chèn
                int maHD = hddao.getMaHDMoiNhat();

                // lấy cookie giỏ hàng
                Cookie gioHang = null;
                if (request.getCookies() != null) {
                    for (Cookie cookie : request.getCookies()) {
                        if (cookie.getName().equals("cart")) {
                            gioHang = cookie;
                        }
                    }
                }
                if (gioHang != null) {

                    // dữ liệu trong cookie là json
                    String json = URLDecoder.decode(gioHang.getValue(), "UTF-8");
                    JSONParser parser = new JSONParser();
                    JSONArray jsonArr = (JSONArray) parser.parse(json);

                    for (int i = 0; i < jsonArr.size(); i++) {
                        JSONObject obj = (JSONObject) jsonArr.get(i);
                        long maSP = (Long) obj.get("id");
                        long maSize = (Long) obj.get("size");
                        long soLuong = (Long) obj.get("qty");
                        String donGia = (String) obj.get("price");
                        // bỏ dấu , và chữ VND ở đơn giá
                        donGia = donGia.replace(",", "").replace("VND", "").replace("\n", "").trim();

                        ChiTietHD chiTietHD = new ChiTietHD();
                        chiTietHD.setMaHD(maHD);
                        chiTietHD.setMaSP((int) maSP);
                        chiTietHD.setMaSize((int) maSize);
                        chiTietHD.setSoLuong((int) soLuong);
                        chiTietHD.setDonGia(Integer.parseInt(donGia));

                        if (!chiTietHDDAO.addNewChiTietHD(chiTietHD)) {
                            break;
                        }
                    }

                    // sau khi chèn thành công, xóa cookie giỏ hàng đi
                    gioHang.setMaxAge(0);
                    response.addCookie(gioHang);
                }
                // thêm vào bảng chi tiết hóa đơn
                return mapping.findForward("ThanhToanOK");
            }
        }

        return mapping.findForward("ThanhToanNotOK");
    }
}
