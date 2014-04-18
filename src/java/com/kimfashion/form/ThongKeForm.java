/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.form;

import com.kimfashion.dao.HoaDonDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dao.ThuongHieuDAO;

/**
 *
 * @author HKA
 */
public class ThongKeForm extends org.apache.struts.action.ActionForm {

    public int getSoSP() {
        int soSP = new SanPhamDAO().count();
        return soSP;
    }
    
    public int getSoHD() {
        int soHD = new HoaDonDAO().count();
        return soHD;
    }
    
    public int getSoThuongHieu () {
        int soTH = new ThuongHieuDAO().count();
        return soTH;
    }
    
    public int getSoThanhVien () {
        int soTV = new ThanhVienDAO().count();
        return soTV;
    }
    
    public int[] getDoanhThu () {
        int[] doanhThu = new HoaDonDAO().tinhDoanhThu();
        return doanhThu;
    }
}
