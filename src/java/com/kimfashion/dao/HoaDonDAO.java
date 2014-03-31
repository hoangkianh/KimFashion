package com.kimfashion.dao;

import com.kimfashion.dto.HoaDon;
import com.kimfashion.utils.DBUtils;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KimHue
 */
public class HoaDonDAO {

    public List<HoaDon> getAllHoaDon() {
        List<HoaDon> list = new ArrayList<HoaDon>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_hoadon");
            rs = stm.executeQuery();

            while (rs.next()) {
                HoaDon hd = new HoaDon();
                hd.setMaHD(rs.getInt("MaHD"));
                hd.setMaTV(rs.getInt("MaTV"));
                hd.setHoTenNguoiNhan(rs.getString("HoTenNguoiNhan"));
                hd.setSdtNguoiNhan(rs.getString("SDTNguoiNhan"));
                hd.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
                hd.setTrangThai(rs.getBoolean("TrangThai"));
                hd.setGhiChu(rs.getString("GhiChu"));

                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Timestamp ngayLapTimeStamp = rs.getTimestamp("NgayLapHD");
                Timestamp ngayGiaoHangTimeStamp = rs.getTimestamp("NgayGiaoHang");

                if (ngayLapTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf.format(ngayLapTimeStamp.getTime()));
                }

                if (ngayGiaoHangTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf.format(ngayGiaoHangTimeStamp.getTime()));
                }

                list.add(hd);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public HoaDon getHoaDonByMaHD(int maHD) {
        HoaDon hd = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_hoadon");
            rs = stm.executeQuery();

            if (rs.next()) {
                hd = new HoaDon();
                hd.setMaHD(rs.getInt("MaHD"));
                hd.setMaTV(rs.getInt("MaTV"));
                hd.setHoTenNguoiNhan(rs.getString("HoTenNguoiNhan"));
                hd.setSdtNguoiNhan(rs.getString("SDTNguoiNhan"));
                hd.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
                hd.setTrangThai(rs.getBoolean("TrangThai"));
                hd.setGhiChu(rs.getString("GhiChu"));

                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Timestamp ngayLapTimeStamp = rs.getTimestamp("NgayLapHD");
                Timestamp ngayGiaoHangTimeStamp = rs.getTimestamp("NgayGiaoHang");

                if (ngayLapTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf.format(ngayLapTimeStamp.getTime()));
                }

                if (ngayGiaoHangTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf.format(ngayGiaoHangTimeStamp.getTime()));
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return hd;
    }

    public boolean addNewHoaDon(HoaDon hd) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_hoadon"
                + " (NgayLapHD, MaTV, HoTenNguoiNhan, SDTNguoiNhan,"
                + " DiaChiGiaoHang, TrangThai, GhiChu)"
                + "VALUES (NOW(), ?, ?, ?, ?, ?, ?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, hd.getMaTV());
            stm.setString(2, hd.getHoTenNguoiNhan());
            stm.setString(3, hd.getSdtNguoiNhan());
            stm.setString(4, hd.getDiaChiGiaoHang());
            stm.setBoolean(5, hd.isTrangThai());
            stm.setString(6, hd.getGhiChu());

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

    public boolean updateHoaDon(HoaDon hd) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_hoadon SET"
                + " NgayLapHD=?, NgayGiaoHang=?, MaTV=?, HoTenNguoiNhan=?, SDTNguoiNhan=? ,"
                + " DiaChiGiaoHang=?, TrangThai=?, GhiChu=? WHERE MaHD=?";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date ngayLapHD = sdf.parse(hd.getNgayLapHD());
            java.util.Date ngayGiaoHang = sdf.parse(hd.getNgayGiaoHang());

            stm = conn.prepareStatement(query);
            stm.setDate(1, new java.sql.Date(ngayLapHD.getTime()));
            stm.setDate(2, new java.sql.Date(ngayGiaoHang.getTime()));
            stm.setInt(3, hd.getMaTV());
            stm.setString(4, hd.getHoTenNguoiNhan());
            stm.setString(5, hd.getSdtNguoiNhan());
            stm.setString(6, hd.getDiaChiGiaoHang());
            stm.setBoolean(7, hd.isTrangThai());
            stm.setString(8, hd.getGhiChu());
            stm.setInt(9, hd.getMaHD());

            if (stm.executeUpdate() > 0) {
                kq = true;
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } catch (ParseException ex) {
            System.err.println(ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, null);
        }
        return kq;
    }

    // lấy mã hd vừa chèn vào trong CSDL
    public int getMaHDMoiNhat() {
        int maHD = -1;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT MaHD AS MaHD FROM tbl_hoadon ORDER BY MaHD DESC LIMIT 1";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                maHD = rs.getInt("MaHD");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return maHD;
    }
}
