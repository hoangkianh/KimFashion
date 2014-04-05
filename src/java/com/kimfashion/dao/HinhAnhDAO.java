/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.HinhAnh;
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
public class HinhAnhDAO {

    public List<HinhAnh> getAllHinhAnh() {
        List<HinhAnh> list = new ArrayList<HinhAnh>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_hinhanh`");
            rs = stm.executeQuery();

            while (rs.next()) {
                HinhAnh h = new HinhAnh();
                h.setMaHinhAnh(rs.getInt("MaHinhAnh"));
                h.setMaSP(rs.getInt("MaSP"));
                h.setDuongDan(rs.getString("DuongDan"));
                h.setAnhChinh(rs.getBoolean("AnhChinh"));

                list.add(h);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<HinhAnh> getAllHinhAnhByMaSP(int maSP) {
        List<HinhAnh> list = new ArrayList<HinhAnh>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_hinhanh` WHERE MaSP=? ORDER BY AnhChinh DESC ");
            stm.setInt(1, maSP);
            rs = stm.executeQuery();

            while (rs.next()) {
                HinhAnh h = new HinhAnh();
                h.setMaHinhAnh(rs.getInt("MaHinhAnh"));
                h.setMaSP(rs.getInt("MaSP"));
                h.setDuongDan(rs.getString("DuongDan"));
                h.setAnhChinh(rs.getBoolean("AnhChinh"));

                list.add(h);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public HinhAnh getHinhAnhByMaHinhAnh(int maHinhAnh) {
        HinhAnh h = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_hinhanh` WHERE MaHinhAnh=?");
            stm.setInt(1, maHinhAnh);
            rs = stm.executeQuery();

            if (rs.next()) {
                h = new HinhAnh();
                h.setMaHinhAnh(rs.getInt("MaHinhAnh"));
                h.setMaSP(rs.getInt("MaSP"));
                h.setDuongDan(rs.getString("DuongDan"));
                h.setAnhChinh(rs.getBoolean("AnhChinh"));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return h;
    }

    public boolean addNewHinhAnh(HinhAnh h) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_hinhanh (MaSP, DuongDan,AnhChinh)"
                + " VALUES (?,?,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, h.getMaSP());
            stm.setString(2, h.getDuongDan());
            stm.setBoolean(3, h.isAnhChinh());

            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }

    public boolean updateHinhAnh(HinhAnh h) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_hinhanh SET DuongDan=?,AnhChinh=?"
                + " WHERE MaHinhAnh=?";
        
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, h.getDuongDan());
            stm.setBoolean(2, h.isAnhChinh());
            stm.setInt(3, h.getMaHinhAnh());

            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }

    public boolean deleteHinhAnh(int maHinhAnh, int maSP) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_hinhanh WHERE MaHinhAnh=? AND MaSP=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maHinhAnh);
            stm.setInt(2, maSP);

            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }
}
