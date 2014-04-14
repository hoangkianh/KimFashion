/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kimfashion.service;

import com.kimfashion.dao.SanPhamDAO;
import com.kimfashion.dao.ThanhVienDAO;
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
    
    /*@POST
    @Path("checkTenSize/{tenSize}")
    @Produces("text/plain")
    public String checkSize (@PathParam("tenSize") String tenSize) {
        if (new SanPhamDAO().getSanPhamByCode(code) != null) {
            return "false";
        }
        return "true";
    }*/
  
 }
