package com.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemService;
import com.mem.model.MemVO;

@WebServlet("/loginCheck.do")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	  public void doPost(HttpServletRequest req, HttpServletResponse res)
	                                throws ServletException, IOException {
	    req.setCharacterEncoding("UTF-8");
	    res.setContentType("text/html; charset=UTF-8");

	    String mem_id = req.getParameter("mem_id").toLowerCase(); //把使用者輸入的e-mail轉成小寫
	    String mem_psw = req.getParameter("mem_psw");

	    // 【檢查該帳號 , 密碼是否有效】
	    MemService memSvc = new MemService();
	    MemVO memVO = null;
	    String errorMsgs = "";
	    
	    try {
			memVO = memSvc.getOneById(mem_id);
			if ( memVO.getLock_state().equals("OFF") ) {
				errorMsgs = "您的帳號尚未啟用或已被鎖定";
			} else if (!mem_psw.equals(memVO.getMem_psw())) {
					errorMsgs = "你的帳號或密碼無效!";
			}
		} catch (NullPointerException e) {
			errorMsgs = "你的帳號或密碼無效!";
		}
		
	    if (errorMsgs.length()>0) {
			req.setAttribute("errorMsgs", errorMsgs); // 將errorMsgs存入req
			RequestDispatcher failureView = req.getRequestDispatcher("/front/member/login.jsp");
			failureView.forward(req, res);
			return;
		}
	    
	      HttpSession session = req.getSession();
	      session.setAttribute("mem_id", mem_id);   //*工作1: 才在session內做已經登入過的標識
	      session.setAttribute("memVO", memVO);
	       try {                                                        
	         String location = (String) session.getAttribute("location");
	         if (location != null) {
	           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
	           res.sendRedirect(location);            
	           return;
	         }
	       }catch (Exception ignored) { }

	      res.sendRedirect(req.getContextPath()+"/front/member/index.jsp");  //*工作3: (-->如無來源網頁:則重導至index.jsp)
	 } //doPost
}