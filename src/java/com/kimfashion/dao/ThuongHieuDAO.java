/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.ThuongHieu;
import com.kimfashion.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HKA
 */
public class ThuongHieuDAO {

    public List<ThuongHieu> getAllThuongHieu() {
        List<ThuongHieu> list = new ArrayList<ThuongHieu>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thuonghieu  ORDER BY TenThuongHieu");
            rs = stm.executeQuery();

            while (rs.next()) {
                ThuongHieu th = new ThuongHieu();
                th.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                th.setTenThuongHieu(rs.getString("TenThuongHieu"));

                list.add(th);
            }
        } catch (SQLException e) {
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public ThuongHieu getThuongHieuByMaTH(int maTH) {
        ThuongHieu th = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thuonghieu WHERE MaThuongHieu=?");
            stm.setInt(1, maTH);
            rs = stm.executeQuery();

            while (rs.next()) {
                th = new ThuongHieu();
                th.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                th.setTenThuongHieu(rs.getString("TenThuongHieu"));
            }
        } catch (SQLException e) {
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return th;
    }
    
     public ThuongHieu getThuongHieuByTenTH(String tenThuongHieu) {
        ThuongHieu th = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thuonghieu WHERE TenThuongHieu=?");
            stm.setString(1, tenThuongHieu);
            rs = stm.executeQuery();

            if (rs.next()) {
                th = new ThuongHieu();
                th.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                th.setTenThuongHieu(rs.getString("TenThuongHieu"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return th;
    }

    public boolean addNewThuongHieu(ThuongHieu th) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_thuonghieu (TenThuongHieu) VALUES (?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, th.getTenThuongHieu());

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

    public boolean updateThuongHieu(ThuongHieu th) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_thuonghieu SET TenThuongHieu=? WHERE MaThuongHieu=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, th.getTenThuongHieu());
            stm.setInt(2, th.getMaThuongHieu());

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

    public boolean deleteThuongHieu(int maTH) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_thuonghieu WHERE MaThuongHieu=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maTH);

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
