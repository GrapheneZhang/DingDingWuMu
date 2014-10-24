package com.dingding.utils.upload.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baidu.ueditor.ActionEnter;

/**
 * 名称: Ueditor编辑器上传处理<br>
 * 创建时间:2014年10月24日<br>
 * 编写人员:ZhangYaxu
 * 版本号:1.0 
 * 描述:
 */
public class UeditorUpload extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding( "utf-8" );
		response.setHeader("Content-Type" , "text/html");
		
		String rootPath = this.getServletContext().getRealPath( "/" );
		
		PrintWriter out=response.getWriter();
		
		out.write( new ActionEnter( request, rootPath ).exec() );
	}
}
