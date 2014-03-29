/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.ThanhVien;
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
public class ThanhVienDAO {

    public List<ThanhVien> getAllThanhVien() {
        List<ThanhVien> list = new ArrayList<ThanhVien>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thanhvien");
            rs = stm.executeQuery();

            while (rs.next()) {
                ThanhVien tv = new ThanhVien();
                tv.setMaTV(rs.getInt("MaTV"));
                tv.setTenDangNhap(rs.getString("TenDangNhap"));
                tv.setPassword(rs.getString("Password"));
                tv.setGioiTinh(rs.getBoolean("GioiTinh"));
                tv.setEmail(rs.getString("Email"));
                tv.setHoTen(rs.getString("HoTen"));
                tv.setLaAdmin(rs.getBoolean("LaAdmin"));
                tv.setXacNhan(rs.getBoolean("XacNhan"));
                tv.setMaXacNhan(rs.getString("MaXacNhan"));
                list.add(tv);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public ThanhVien getThanhVienByMaTV(int maTV) {
        ThanhVien tv = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thanhvien WHERE MaTV=?");
            stm.setInt(1, maTV);
            rs = stm.executeQuery();

            if (rs.next()) {
                tv = new ThanhVien();
                tv.setMaTV(rs.getInt("MaTV"));
                tv.setTenDangNhap(rs.getString("TenDangNhap"));
                tv.setPassword(rs.getString("Password"));
                tv.setGioiTinh(rs.getBoolean("GioiTinh"));
                tv.setEmail(rs.getString("Email"));
                tv.setHoTen(rs.getString("HoTen"));
                tv.setLaAdmin(rs.getBoolean("LaAdmin"));
                tv.setXacNhan(rs.getBoolean("XacNhan"));
                tv.setMaXacNhan(rs.getString("MaXacNhan"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return tv;
    }

    public ThanhVien getThanhVienByEmail(String email) {
        ThanhVien tv = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thanhvien WHERE Email=?");
            stm.setString(1, email);
            rs = stm.executeQuery();

            if (rs.next()) {
                tv = new ThanhVien();
                tv.setMaTV(rs.getInt("MaTV"));
                tv.setTenDangNhap(rs.getString("TenDangNhap"));
                tv.setPassword(rs.getString("Password"));
                tv.setGioiTinh(rs.getBoolean("GioiTinh"));
                tv.setEmail(rs.getString("Email"));
                tv.setHoTen(rs.getString("HoTen"));
                tv.setLaAdmin(rs.getBoolean("LaAdmin"));
                tv.setXacNhan(rs.getBoolean("XacNhan"));
                tv.setMaXacNhan(rs.getString("MaXacNhan"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return tv;
    }

    public ThanhVien getThanhVienByTenDN(String tenDangNhap) {
        ThanhVien tv = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_thanhvien WHERE TenDangNhap=?");
            stm.setString(1, tenDangNhap);
            rs = stm.executeQuery();

            if (rs.next()) {
                tv = new ThanhVien();
                tv.setMaTV(rs.getInt("MaTV"));
                tv.setTenDangNhap(rs.getString("TenDangNhap"));
                tv.setPassword(rs.getString("Password"));
                tv.setGioiTinh(rs.getBoolean("GioiTinh"));
                tv.setEmail(rs.getString("Email"));
                tv.setHoTen(rs.getString("HoTen"));
                tv.setLaAdmin(rs.getBoolean("LaAdmin"));
                tv.setXacNhan(rs.getBoolean("XacNhan"));
                tv.setMaXacNhan(rs.getString("MaXacNhan"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return tv;
    }

    public boolean addNewThanhVien(ThanhVien tv) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_thanhvien"
                + " (TenDangNhap, Password, GioiTinh, Email, HoTen, LaAdmin, XacNhan, MaXacNhan)"
                + " VALUES (?,?,?,?,?,False,False,?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, tv.getTenDangNhap());
            stm.setString(2, tv.getPassword());
            stm.setBoolean(3, tv.isGioiTinh());
            stm.setString(4, tv.getEmail());
            stm.setString(5, tv.getHoTen());
            stm.setString(6, tv.getMaXacNhan());

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

    public boolean updateThanhVien(ThanhVien tv) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_thanhvien"
                + " SET TenDangNhap=?, Password=?, GioiTinh=?"
                + ", Email=?, HoTen=?, LaAdmin=?,XacNhan=?,MaXacNhan=? WHERE MaTV=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, tv.getTenDangNhap());
            stm.setString(2, tv.getPassword());
            stm.setBoolean(3, tv.isGioiTinh());
            stm.setString(4, tv.getEmail());
            stm.setString(5, tv.getHoTen());
            stm.setBoolean(6, tv.isLaAdmin());
            stm.setBoolean(7, tv.isXacNhan());
            stm.setString(8, tv.getMaXacNhan());
            stm.setInt(9, tv.getMaTV());

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

    public boolean xacNhan(ThanhVien tv) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        
        try {
            stm = conn.prepareStatement("UPDATE tbl_thanhvien SET XacNhan=?, MaXacNhan = ?");
            stm.setBoolean(1, true);
            stm.setString(2, tv.getMaXacNhan());
            
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
