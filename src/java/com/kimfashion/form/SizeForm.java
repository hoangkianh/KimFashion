/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.kimfashion.form;

import com.kimfashion.dto.Size;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Kim Hue
 */
public class SizeForm extends org.apache.struts.action.ActionForm {
    
    private int maSize;
    private String tenSize;
    private List<Size> listSize;
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors err = new ActionErrors();
        
        if (tenSize == null || tenSize.trim().length() == 0) {
            err.add("tenSize", new ActionMessage("Bạn chưa điền tên size"));
        }
        
        return err;
    }

    public int getMaSize() {
        return maSize;
    }

    public void setMaSize(int maSize) {
        this.maSize = maSize;
    }

    public String getTenSize() {
        return tenSize;
    }

    public void setTenSize(String tenSize) {
        this.tenSize = tenSize;
    }

    public List<Size> getListSize() {
        return listSize;
    }

    public void setListSize(List<Size> listSize) {
        this.listSize = listSize;
    }
    
    
}
