/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.SanPhamSize;
import com.kimfashion.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kim Hue
 */
public class SanPhamSizeDAO {

    public List<SanPhamSize> getAllSizeBySanPham(int maSP) {
        List<SanPhamSize> list = new ArrayList<SanPhamSize>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_sanpham_size WHERE MaSP=?");
            stm.setInt(1, maSP);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPhamSize sanPhamSize = new SanPhamSize();
                sanPhamSize.setMaSP(maSP);
                sanPhamSize.setMaSize(rs.getInt("MaSize"));
                list.add(sanPhamSize);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPhamSize> getAllSanPhamBySize (int maSize) {
        List<SanPhamSize> list = new ArrayList<SanPhamSize>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_sanpham_size WHERE MaSize=?");
            stm.setInt(1, maSize);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPhamSize sanPhamSize = new SanPhamSize();
                sanPhamSize.setMaSP(rs.getInt("MaSP"));
                sanPhamSize.setMaSize(maSize);
                list.add(sanPhamSize);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public boolean addNewSanPhamSize (SanPhamSize sanPhamSize) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_sanpham_size (MaSP, MaSize)"
                + " VALUES (?,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, sanPhamSize.getMaSP());
            stm.setInt(2, sanPhamSize.getMaSize());
            
            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }

    public boolean deleteSanPhamSize (int maSP, int maSize) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_sanpham_size WHERE MaSP=? AND MaSize=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maSP);
            stm.setInt(2, maSize);
            
            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }
}
