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
                hd.setSdtNguoiMua(rs.getString("SDTNguoiMua"));
                hd.setSdtNguoiNhan(rs.getString("SDTNguoiNhan"));
                hd.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
                hd.setTrangThai(rs.getBoolean("TrangThai"));
                hd.setGhiChu(rs.getString("GhiChu"));

                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
                Timestamp ngayLapTimeStamp = rs.getTimestamp("NgayLapHD");
                Timestamp ngayGiaoHangTimeStamp = rs.getTimestamp("NgayGiaoHang");

                if (ngayLapTimeStamp != null) {
                    hd.setNgayLapHD(sdf.format(ngayLapTimeStamp.getTime()));
                }

                if (ngayGiaoHangTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf2.format(ngayGiaoHangTimeStamp.getTime()));
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

    public List<HoaDon> getAllHoaDon(boolean trangThai) {
        List<HoaDon> list = new ArrayList<HoaDon>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT * FROM tbl_hoadon WHERE TrangThai=?");
            stm.setBoolean(1, trangThai);
            rs = stm.executeQuery();

            while (rs.next()) {
                HoaDon hd = new HoaDon();
                hd.setMaHD(rs.getInt("MaHD"));
                hd.setMaTV(rs.getInt("MaTV"));
                hd.setHoTenNguoiNhan(rs.getString("HoTenNguoiNhan"));
                hd.setSdtNguoiMua(rs.getString("SDTNguoiMua"));
                hd.setSdtNguoiNhan(rs.getString("SDTNguoiNhan"));
                hd.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
                hd.setTrangThai(rs.getBoolean("TrangThai"));
                hd.setGhiChu(rs.getString("GhiChu"));

                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
                Timestamp ngayLapTimeStamp = rs.getTimestamp("NgayLapHD");
                Timestamp ngayGiaoHangTimeStamp = rs.getTimestamp("NgayGiaoHang");

                if (ngayLapTimeStamp != null) {
                    hd.setNgayLapHD(sdf.format(ngayLapTimeStamp.getTime()));
                }

                if (ngayGiaoHangTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf2.format(ngayGiaoHangTimeStamp.getTime()));
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
            stm = conn.prepareStatement("SELECT * FROM tbl_hoadon WHERE MaHD=?");
            stm.setInt(1, maHD);
            rs = stm.executeQuery();

            if (rs.next()) {
                hd = new HoaDon();
                hd.setMaHD(rs.getInt("MaHD"));
                hd.setMaTV(rs.getInt("MaTV"));
                hd.setHoTenNguoiNhan(rs.getString("HoTenNguoiNhan"));
                hd.setSdtNguoiMua(rs.getString("SDTNguoiMua"));
                hd.setSdtNguoiNhan(rs.getString("SDTNguoiNhan"));
                hd.setDiaChiGiaoHang(rs.getString("DiaChiGiaoHang"));
                hd.setTrangThai(rs.getBoolean("TrangThai"));
                hd.setGhiChu(rs.getString("GhiChu"));

                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
                Timestamp ngayLapTimeStamp = rs.getTimestamp("NgayLapHD");
                Timestamp ngayGiaoHangTimeStamp = rs.getTimestamp("NgayGiaoHang");

                if (ngayLapTimeStamp != null) {
                    hd.setNgayLapHD(sdf.format(ngayLapTimeStamp.getTime()));
                }

                if (ngayGiaoHangTimeStamp != null) {
                    hd.setNgayGiaoHang(sdf2.format(ngayGiaoHangTimeStamp.getTime()));
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
                + " (NgayLapHD, NgayGiaoHang, MaTV, SDTNguoiMua, HoTenNguoiNhan, SDTNguoiNhan,"
                + " DiaChiGiaoHang, TrangThai, GhiChu)"
                + "VALUES (NOW(), ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            stm = conn.prepareStatement(query);
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date ngayGiaoHang = sdf.parse(hd.getNgayGiaoHang());
            stm.setDate(1, new java.sql.Date(ngayGiaoHang.getTime()));
            stm.setInt(2, hd.getMaTV());
            stm.setString(3, hd.getSdtNguoiMua());
            stm.setString(4, hd.getHoTenNguoiNhan());
            stm.setString(5, hd.getSdtNguoiNhan());
            stm.setString(6, hd.getDiaChiGiaoHang());
            stm.setBoolean(7, hd.isTrangThai());
            stm.setString(8, hd.getGhiChu());

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

    public boolean updateHoaDon(HoaDon hd) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_hoadon SET"
                + " NgayGiaoHang=?, SDTNguoiMua=?,HoTenNguoiNhan=?, SDTNguoiNhan=? ,"
                + " DiaChiGiaoHang=?, TrangThai=?, GhiChu=? WHERE MaHD=?";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date ngayGiaoHang = sdf.parse(hd.getNgayGiaoHang());

            stm = conn.prepareStatement(query);
            stm.setDate(1, new java.sql.Date(ngayGiaoHang.getTime()));
            stm.setString(2, hd.getSdtNguoiMua());
            stm.setString(3, hd.getHoTenNguoiNhan());
            stm.setString(4, hd.getSdtNguoiNhan());
            stm.setString(5, hd.getDiaChiGiaoHang());
            stm.setBoolean(6, hd.isTrangThai());
            stm.setString(7, hd.getGhiChu());
            stm.setInt(8, hd.getMaHD());

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

    public boolean deleteHoaDon(int maHD) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "DELETE FROM tbl_hoadon WHERE MaHD=?";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maHD);

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

    public int count() {
        int soHD = -1;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT COUNT(*) AS SoHD FROM tbl_hoadon";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();
            if (rs.next()) {
                soHD = rs.getInt("SoHD");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return soHD;
    }

    public int[] tinhDoanhThu() {
        int[] doanhThuTheoThang = new int[12];
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT SUM(TongTien) AS DoanhThu FROM `vw_tongtien` WHERE MONTH(NgayLapHD) = ?";

        try {
            for (int i = 0; i < doanhThuTheoThang.length; i++) {
                stm = conn.prepareStatement(query);
                stm.setInt(1, (i+1));
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    doanhThuTheoThang[i] = rs.getInt("DoanhThu");
                }
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return doanhThuTheoThang;
    }
}
