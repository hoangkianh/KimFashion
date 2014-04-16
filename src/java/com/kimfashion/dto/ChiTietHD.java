/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dto;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SanPhamSizeDAO;
import com.kimfashion.dao.SizeDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kim Hue
 */
public class ChiTietHD implements Serializable {

    private int maHD;
    private int maSP;
    private int maSize;
    private int soLuong;
    private int donGia;
    
    public List<Size> getListSize() {
        List<Size> list = new ArrayList<Size>();
        List<SanPhamSize> listSPSize = new SanPhamSizeDAO().getAllSizeBySanPham(maSP);
        SizeDAO sizeDAO = new SizeDAO();

        for (SanPhamSize sanPhamSize : listSPSize) {
            Size s = sizeDAO.getSizeByMaSize(sanPhamSize.getMaSize());
            list.add(s);
        }
        return list;
    }    
    
    public int getThanhTien() {
        return soLuong * donGia;
    }
    
    public SanPham getSanPham () {
        return new SanPhamDAO().getSanPhamByMaSP(maSP);
    }
    
    public String getTenSize () {
        Size s = new SizeDAO().getSizeByMaSize(maSize);
        if (s != null) {
            return s.getTenSize();            
        }
        return "";
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public int getMaSize() {
        return maSize;
    }

    public void setMaSize(int maSize) {
        this.maSize = maSize;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }
}
