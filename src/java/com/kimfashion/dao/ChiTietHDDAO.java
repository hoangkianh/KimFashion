/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.ChiTietHD;
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
public class ChiTietHDDAO {

    public List<ChiTietHD> getAllChiTietHDByMaHD(int maHD) {
        List<ChiTietHD> list = new ArrayList<ChiTietHD>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM `tbl_chitiethd` WHERE `MaHD` = ?");
            stm.setInt(1, maHD);
            rs = stm.executeQuery();

            while (rs.next()) {
                ChiTietHD ct = new ChiTietHD();
                ct.setMaHD(rs.getInt("MaHD"));
                ct.setMaSP(rs.getInt("MaSP"));
                ct.setMaSize(rs.getInt("MaSize"));
                ct.setSoLuong(rs.getInt("SoLuong"));
                ct.setDonGia(rs.getInt("DonGia"));
                list.add(ct);
            }
        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public boolean addNewChiTietHD(ChiTietHD ct) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "INSERT INTO `tbl_chitiethd`"
                + "(`MaHD`, `MaSP`, `MaSize`, `SoLuong`, `DonGia`) "
                + "VALUES (?,?,?,?,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, ct.getMaHD());
            stm.setInt(2, ct.getMaSP());
            stm.setInt(3, ct.getMaSize());
            stm.setInt(4, ct.getSoLuong());
            stm.setInt(5, ct.getDonGia());

            if (stm.executeUpdate() > 0) {
                kq = true;
            }

        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return kq;
    }

    public boolean updateChiTietHD(ChiTietHD ct) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "UPDATE `tbl_chitiethd`"
                + "SET SoLuong=? WHERE `MaHD`=? AND `MaSP`=? AND `MaSize`=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, ct.getSoLuong());
            stm.setInt(2, ct.getMaHD());
            stm.setInt(3, ct.getMaSP());
            stm.setInt(4, ct.getMaSize());

            if (stm.executeUpdate() > 0) {
                kq = true;
            }

        } catch (SQLException ex) {
            System.err.printf(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return kq;
    }
}
