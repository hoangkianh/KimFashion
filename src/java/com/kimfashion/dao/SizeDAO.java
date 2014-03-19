/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.dao;

import com.kimfashion.dto.Size;
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
public class SizeDAO {

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<Size>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareCall("SELECT * FROM tbl_size");
            rs = stm.executeQuery();

            while (rs.next()) {
                Size s = new Size();
                s.setMaSize(rs.getInt("MaSize"));
                s.setTenSize(rs.getString("TenSize"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public Size getSizeByMaSize(int maSize) {
        Size s = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareCall("SELECT * FROM tbl_size WHERE MaSize=?");
            stm.setInt(1, maSize);
            rs = stm.executeQuery();

            if (rs.next()) {
                s = new Size();
                s.setMaSize(rs.getInt("MaSize"));
                s.setTenSize(rs.getString("TenSize"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return s;
    }

    public Size getSizeByTenSize(String tenSize) {
        Size s = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareCall("SELECT * FROM tbl_size WHERE TenSize=?");
            stm.setString(1, tenSize);
            rs = stm.executeQuery();

            if (rs.next()) {
                s = new Size();
                s.setMaSize(rs.getInt("MaSize"));
                s.setTenSize(rs.getString("TenSize"));
            }
        } catch (SQLException e) {
            System.err.println(e.getErrorCode() + ":" + e.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return s;
    }

    public boolean addNewSize(Size s) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_size TenSize VALUES (?)";
        
        try {
            stm = conn.prepareCall(query);
            stm.setString(1, s.getTenSize());
            
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

    public boolean updateSize(Size s) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_size SET TenSize=? WHERE MaSize=?";
        
        try {
            stm = conn.prepareCall(query);
            stm.setInt(1, s.getMaSize());
            
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

    public boolean deleteSize(int maSize) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_size WHERE MaSize=?";
        
        try {
            stm = conn.prepareCall(query);
            stm.setInt(1, maSize);
            
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
