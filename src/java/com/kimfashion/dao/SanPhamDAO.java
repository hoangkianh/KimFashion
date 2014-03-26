package com.kimfashion.dao;

import com.kimfashion.dto.SanPham;
import com.kimfashion.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KimHue
 */
public class SanPhamDAO {

    public List<SanPham> getAllSanPham() {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                    + " LEFT JOIN `tbl_hinhanh` b"
                    + " ON a.MaSP = b.MaSP"
                    + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE");
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamByLoaiSP(int loaiSP) {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                    + " LEFT JOIN `tbl_hinhanh` b"
                    + " ON a.MaSP = b.MaSP"
                    + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE AND MaLoaiSP=?");
            stm.setInt(1, loaiSP);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSPTrongBST(int maBST) {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT a.*, b.`DuongDan` AS HinhAnh, c.`TenBST`"
                    + " FROM tbl_sanpham a"
                    + " LEFT JOIN `tbl_hinhanh` b ON a.MaSP = b.MaSP"
                    + " LEFT JOIN `tbl_bosuutap` c ON a.`MaBST` = c.`MaBST`"
                    + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE AND a.MaBST=?");
            stm.setInt(1, maBST);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setTenBST(rs.getString("TenBST"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamByThuongHieu(int thuongHieu) {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = conn.prepareStatement("SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                    + " LEFT JOIN `tbl_hinhanh` b"
                    + " ON a.MaSP = b.MaSP"
                    + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE AND MaThuongHieu=?");
            stm.setInt(1, thuongHieu);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamPhanTrang(int soSPTren1Trang, int trang) {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;

        int dongBatDau = (trang - 1) * soSPTren1Trang;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b"
                + " ON a.MaSP = b.MaSP"
                + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE LIMIT " + dongBatDau + "," + soSPTren1Trang;
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamMoi() {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b"
                + " ON a.MaSP = b.MaSP"
                + " WHERE a.`SanPhamMoi` = TRUE AND a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamBanChay() {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT * FROM vw_spbanchay";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamCungLoai(int maLoai, int maSP) {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh"
                + " FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b"
                + " ON a.MaSP = b.MaSP"
                + " WHERE a.MaLoaiSP = ? AND a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE AND a.`MaSP` != ?"
                + " ORDER BY RAND( ) LIMIT 15";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maLoai);
            stm.setInt(2, maSP);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getSanPhamKhuyenMai() {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b"
                + " ON a.MaSP = b.MaSP"
                + " WHERE a.`DangKM` = TRUE AND a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public List<SanPham> getRandomSP() {
        List<SanPham> list = new ArrayList<SanPham>();
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b"
                + " ON a.MaSP = b.MaSP"
                + " WHERE a.`DaAn`= FALSE AND b.`AnhChinh` = TRUE"
                + " ORDER BY RAND( ) LIMIT 10";
        try {
            stm = conn.prepareStatement(query);
            rs = stm.executeQuery();

            while (rs.next()) {
                SanPham sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));

                list.add(sp);
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return list;
    }

    public SanPham getSanPhamByMaSP(int maSP) {
        SanPham sp = null;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String query = "SELECT a.*, b.`DuongDan` AS HinhAnh, c.`TenThuongHieu`"
                + " FROM tbl_sanpham a"
                + " LEFT JOIN `tbl_hinhanh` b ON a.MaSP = b.MaSP"
                + " LEFT JOIN `tbl_thuonghieu` c ON a.`MaThuongHieu` = c.`MaThuongHieu`"
                + " WHERE a.`DaAn`= FALSE AND a.`MaSP` = ? AND b.`AnhChinh` = TRUE";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maSP);
            rs = stm.executeQuery();

            if (rs.next()) {
                sp = new SanPham();
                sp.setMaSP(rs.getInt("MaSP"));
                sp.setCode(rs.getString("Code"));
                sp.setTenSP(rs.getString("TenSP"));
                sp.setGioiTinh(rs.getBoolean("GioiTinh"));
                sp.setMaLoaiSP(rs.getInt("MaLoaiSP"));
                sp.setMaBST(rs.getInt("MaBST"));
                sp.setMaThuongHieu(rs.getInt("MaThuongHieu"));
                sp.setMoTa(rs.getString("MoTa"));
                sp.setGiaNhap(rs.getInt("GiaNhap"));
                sp.setGiaBan(rs.getInt("GiaBan"));
                sp.setGiaBanKM(rs.getInt("GiaBanKM"));
                sp.setSanPhamMoi(rs.getBoolean("SanPhamMoi"));
                sp.setDangKM(rs.getBoolean("DangKM"));
                sp.setDaAn(rs.getBoolean("DaAn"));
                sp.setXepHang(rs.getDouble("XepHang"));
                sp.setMauSac(rs.getString("MauSac"));
                sp.setHinhAnh(rs.getString("HinhAnh"));
                sp.setSoLuotDanhGia(rs.getInt("SoLuotDanhGia"));
                sp.setTenThuongHieu(rs.getString("TenThuongHieu"));
            }
        } catch (SQLException ex) {
            System.err.println(ex.getErrorCode() + ":" + ex.getMessage());
        } finally {
            DBUtils.closeAll(conn, stm, rs);
        }
        return sp;
    }

    public boolean addNewSanPham(SanPham sp) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "INSERT INTO tbl_sanpham"
                + " (Code, TenSP, GioiTinh, MaLoaiSP, MaThuongHieu, MaBST,"
                + " MoTa, GiaNhap, GiaBan, GiaBanKM, SanPhamMoi, DangKM,"
                + " DaAn, XepHang, SoLuotDanhGia, MauSac)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, False, ?, ?, ?)";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, sp.getCode());
            stm.setString(2, sp.getTenSP());
            stm.setBoolean(3, sp.isGioiTinh());
            stm.setInt(4, sp.getMaLoaiSP());
            stm.setInt(5, sp.getMaThuongHieu());
            stm.setInt(6, sp.getMaBST());
            stm.setString(7, sp.getMoTa());
            stm.setInt(8, sp.getGiaNhap());
            stm.setInt(9, sp.getGiaBan());
            stm.setInt(10, sp.getGiaBanKM());
            stm.setBoolean(11, sp.isSanPhamMoi());
            stm.setBoolean(12, sp.isDangKM());
            stm.setDouble(13, sp.getXepHang());
            stm.setInt(14, sp.getSoLuotDanhGia());
            stm.setString(15, sp.getMauSac());

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

    public boolean updateSanPham(SanPham sp) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_sanpham"
                + " SET Code=?, TenSP=?, GioiTinh=?, MaLoaiSP=?, MaThuongHieu=?, MaBST=?,"
                + " MoTa=?, GiaNhap=?, GiaBan=?, GiaBanKM=?, SanPhamMoi=?, DangKM=?,"
                + " DaAn=?, XepHang=?, SoLuotDanhGia=?, MauSac=? WHERE MaSP=?;";
        try {
            stm = conn.prepareStatement(query);
            stm.setString(1, sp.getCode());
            stm.setString(2, sp.getTenSP());
            stm.setBoolean(3, sp.isGioiTinh());
            stm.setInt(4, sp.getMaLoaiSP());
            stm.setInt(5, sp.getMaThuongHieu());
            stm.setInt(6, sp.getMaBST());
            stm.setString(7, sp.getMoTa());
            stm.setInt(8, sp.getGiaNhap());
            stm.setInt(9, sp.getGiaBan());
            stm.setInt(10, sp.getGiaBanKM());
            stm.setBoolean(11, sp.isSanPhamMoi());
            stm.setBoolean(12, sp.isDangKM());
            stm.setBoolean(13, sp.isDaAn());
            stm.setDouble(14, sp.getXepHang());
            stm.setInt(15, sp.getSoLuotDanhGia());
            stm.setString(16, sp.getMauSac());
            stm.setInt(17, sp.getMaSP());

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

    public boolean deleteSanPham(int maSP) {
        boolean kq = false;
        Connection conn = DBUtils.getConnection();
        PreparedStatement stm = null;
        String query = "UPDATE tbl_sanpham SET DaAn=True WHERE MaSP=?;";
        try {
            stm = conn.prepareStatement(query);
            stm.setInt(1, maSP);

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
