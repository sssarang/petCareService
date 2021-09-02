package com.bitcamp.petcare.user.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptUtils {
	
	public static void init(HttpServletResponse res) {
        res.setContentType("text/html; charset=utf-8");
        res.setCharacterEncoding("utf-8");
	}//init
	
    public static void alert(HttpServletResponse res, String alertText) throws IOException {
        init(res);
        PrintWriter out = res.getWriter();
        out.println("<script>alert('" + alertText + "');</script> ");
        out.flush();
    }//alert

}//end class
