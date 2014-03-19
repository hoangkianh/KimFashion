/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.BoSuuTap;
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
public class BoSuuTapDAO {

    public List<BoSuuTap> getAllBoSuuTap() {
        List<BoSuuTap> list = new ArrayList<BoSuuTap>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_bosuutap");
            rs = stm.executeQuery();

            while (rs.next()) {
                BoSuuTap bst = new BoSuuTap();
                bst.setMaBST(rs.getInt("MaBST"));
                bst.setTenBST(rs.getString("TenBST"));
                bst.setGioiTinh(rs.getBoolean("GioiTinh"));
                bst.setAnhDaiDien(rs.getString("AnhDaiDien"));

                list.add(bst);
            }
        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }
    
    public List<BoSuuTap> getBoSuuTapRandom() {
        List<BoSuuTap> list = new ArrayList<BoSuuTap>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_bosuutap ORDER BY RAND( ) LIMIT 3");
            rs = stm.executeQuery();

            while (rs.next()) {
                BoSuuTap bst = new BoSuuTap();
                bst.setMaBST(rs.getInt("MaBST"));
                bst.setTenBST(rs.getString("TenBST"));
                bst.setGioiTinh(rs.getBoolean("GioiTinh"));
                bst.setAnhDaiDien(rs.getString("AnhDaiDien"));

                list.add(bst);
            }
        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public BoSuuTap getBoSuuTapByMaBST(int maBST) {
        BoSuuTap bst = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_bosuutap WHERE maBST = ?");
            stm.setInt(1, maBST);
            rs = stm.executeQuery();

            if (rs.next()) {
                bst = new BoSuuTap();
                bst.setMaBST(rs.getInt("MaBST"));
                bst.setTenBST(rs.getString("TenBST"));
                bst.setGioiTinh(rs.getBoolean("GioiTinh"));
                bst.setAnhDaiDien(rs.getString("AnhDaiDien"));

            }
        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return bst;
    }

    public boolean addNewBoSuuTap(BoSuuTap bst) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_bosuutap"
                + "(`TenBST`, `GioiTinh`, `AnhDaiDien`)"
                + " VALUES (?,?,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, bst.getTenBST());
            stm.setBoolean(2, bst.isGioiTinh());
            stm.setString(3, bst.getAnhDaiDien());

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

    public boolean updateBoSuuTap(BoSuuTap bst) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_bosuutap "
                + "SET `TenBST` = ?, `GioiTinh`=?, `AnhDaiDien`=? WHERE `MaBST` = ?";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, bst.getTenBST());
            stm.setBoolean(2, bst.isGioiTinh());
            stm.setString(3, bst.getAnhDaiDien());
            stm.setInt(4, bst.getMaBST());

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

    public boolean deleteBoSuuTap(int maBST) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_bosuutap WHERE `MaBST` = ?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maBST);

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
