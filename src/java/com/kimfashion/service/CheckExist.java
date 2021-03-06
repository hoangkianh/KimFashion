/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.service;

import com.kimfashion.dao.BoSuuTapDAO;
import com.kimfashion.dao.LoaiSPDAO;
import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.SizeDAO;
import com.kimfashion.dao.ThanhVienDAO;
import com.kimfashion.dao.ThuongHieuDAO;
import javax.ws.rs.PathParam;
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;

/**
 * REST Web Service
 *
 * @author HKA
 */
@Path("checkexist")
public class CheckExist {

    @POST
    @Path("checkUser/{tenDangNhap}")
    @Produces("text/plain")
    public String checkUser(@PathParam("tenDangNhap") String tenDangNhap) {
        if (new ThanhVienDAO().getThanhVienByTenDN(tenDangNhap) != null) {
            return "false";
        }
        return "true";
    }

    @POST
    @Path("checkEmail/{email}")
    @Produces("text/plain")
    public String checkEmail(@PathParam("email") String email) {
        if (new ThanhVienDAO().getThanhVienByEmail(email) != null) {
            return "false";
        }
        return "true";
    }
    
    @POST
    @Path("checkCode/{code}")
    @Produces("text/plain")
    public String checkCode (@PathParam("code") String code) {
        if (new SanPhamDAO().getSanPhamByCode(code) != null) {
            return "false";
        }
        return "true";
    }
    
    @POST
    @Path("checkTenSize/{tenSize}")
    @Produces("text/plain")
    public String checkTenSize (@PathParam("tenSize") String tenSize) {
        if (new SizeDAO().getSizeByTenSize(tenSize) != null) {
            return "false";
        }
        return "true";
    }
    
    @POST
    @Path("checkTenThuongHieu/{tenThuongHieu}")
    @Produces("text/plain")
    public String checkTenThuongHieu (@PathParam("tenThuongHieu") String tenThuongHieu) {
        if (new ThuongHieuDAO().getThuongHieuByTenTH(tenThuongHieu) != null) {
            return "false";
        }
        return "true";
    }
    
    @POST
    @Path("checkTenLoaiSP/{tenLoai}/{gioiTinh}")
    @Produces("text/plain")
    public String checkTenLoaiSP (@PathParam("tenLoai") String tenLoai,@PathParam("gioiTinh") boolean gioiTinh) {
        if (new LoaiSPDAO().getLoaiSPByTenLoai(tenLoai, gioiTinh) != null) {
            return "false";
        }
        return "true";
    }
    
    @POST
    @Path("checkTenBST/{tenBST}/{gioiTinh}")
    @Produces("text/plain")
    public String checkTenBST (@PathParam("tenBST") String tenBST,@PathParam("gioiTinh") boolean gioiTinh) {
        if (new BoSuuTapDAO().getBoSuuTapByTenBST(tenBST, gioiTinh) != null) {
            return "false";
        }
        return "true";
    }
  
 }
