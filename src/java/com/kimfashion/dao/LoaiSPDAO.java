/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.LoaiSP;
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
public class LoaiSPDAO {

    public List<LoaiSP> getAllLoaiSP() {
        List<LoaiSP> list = new ArrayList<LoaiSP>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_loaisp ORDER BY TenLoai");
            rs = stm.executeQuery();

            while (rs.next()) {
                LoaiSP loaiSP = new LoaiSP();
                loaiSP.setMaLoai(rs.getInt("MaLoai"));
                loaiSP.setTenLoai(rs.getString("TenLoai"));
                loaiSP.setGioiTinh(rs.getBoolean("GioiTinh"));
                loaiSP.setMaLoaiCha(rs.getInt("MaLoaiCha"));

                list.add(loaiSP);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<LoaiSP> getAllLoaiSPCha() {
        List<LoaiSP> list = new ArrayList<LoaiSP>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_loaisp` WHERE `MaLoaiCha` IS NULL");
            rs = stm.executeQuery();

            while (rs.next()) {
                LoaiSP loaiSP = new LoaiSP();
                loaiSP.setMaLoai(rs.getInt("MaLoai"));
                loaiSP.setTenLoai(rs.getString("TenLoai"));
                loaiSP.setGioiTinh(rs.getBoolean("GioiTinh"));
                loaiSP.setMaLoaiCha(rs.getInt("MaLoaiCha"));

                list.add(loaiSP);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<LoaiSP> getAllLoaiSPCon() {
        List<LoaiSP> list = new ArrayList<LoaiSP>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_loaisp` WHERE `MaLoaiCha` IS NOT NULL ORDER BY TenLoai");
            rs = stm.executeQuery();

            while (rs.next()) {
                LoaiSP loaiSP = new LoaiSP();
                loaiSP.setMaLoai(rs.getInt("MaLoai"));
                loaiSP.setTenLoai(rs.getString("TenLoai"));
                loaiSP.setGioiTinh(rs.getBoolean("GioiTinh"));
                loaiSP.setMaLoaiCha(rs.getInt("MaLoaiCha"));

                list.add(loaiSP);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }
    
    public List<LoaiSP> getAllLoaiSPConByGioiTinh(boolean gioiTinh) {
        List<LoaiSP> list = new ArrayList<LoaiSP>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_loaisp`"
                    + " WHERE `MaLoaiCha` IS NOT NULL AND GioiTinh = ?"
                    + " ORDER BY TenLoai");
            stm.setBoolean(1, gioiTinh);
            rs = stm.executeQuery();

            while (rs.next()) {
                LoaiSP loaiSP = new LoaiSP();
                loaiSP.setMaLoai(rs.getInt("MaLoai"));
                loaiSP.setTenLoai(rs.getString("TenLoai"));
                loaiSP.setGioiTinh(rs.getBoolean("GioiTinh"));
                loaiSP.setMaLoaiCha(rs.getInt("MaLoaiCha"));

                list.add(loaiSP);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public LoaiSP getLoaiSPByMaLoai(int maLoai) {
        LoaiSP loaiSP = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_loaisp WHERE MaLoai=?");
            stm.setInt(1, maLoai);
            rs = stm.executeQuery();

            if (rs.next()) {
                loaiSP = new LoaiSP();
                loaiSP.setMaLoai(rs.getInt("MaLoai"));
                loaiSP.setTenLoai(rs.getString("TenLoai"));
                loaiSP.setGioiTinh(rs.getBoolean("GioiTinh"));
                loaiSP.setMaLoaiCha(rs.getInt("MaLoaiCha"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return loaiSP;
    }
    
    
    public boolean addNewLoaiSP(LoaiSP loaiSP) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_loaisp"
                + "(`TenLoai`, `GioiTinh`, `MaLoaiCha`)"
                + " VALUES (?,?,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, loaiSP.getTenLoai());
            stm.setBoolean(2, loaiSP.isGioiTinh());
            stm.setInt(3, loaiSP.getMaLoaiCha());

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

    public boolean updateLoaiSP(LoaiSP loaiSP) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_loaisp "
                + "SET `TenLoai` = ?, `GioiTinh`=?, `MaLoaiCha`=? WHERE `MaLoai` = ?";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, loaiSP.getTenLoai());
            stm.setBoolean(2, loaiSP.isGioiTinh());
            stm.setInt(3, loaiSP.getMaLoaiCha());
            stm.setInt(4, loaiSP.getMaLoai());

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

    public boolean deleteLoaiSP (int maLoai) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_loaisp WHERE `MaLoai` = ?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maLoai);

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
