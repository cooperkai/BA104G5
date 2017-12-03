package com.realtor.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.realtor.model.RealtorService;
import com.realtor.model.RealtorVO;

public class RealtorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		// 來自房仲登入的請求
		if ("realtorLogin".equals(action)) {

			String loginError = "";
			req.setAttribute("loginError", loginError);

			String rtr_id = req.getParameter("rtr_id").trim().toLowerCase();
			String rtr_psw = req.getParameter("rtr_psw").trim();

			RealtorService realtorSvc = new RealtorService();
			RealtorVO realtorVO = null;

			try {
				realtorVO = realtorSvc.findById(rtr_id);
				if (realtorVO.getRtr_state().equals("OFF")) {
					loginError = "你的帳號尚未啟用或已被鎖定";
				} else if (!rtr_psw.equals(realtorVO.getRtr_psw())) {
					System.out.println(realtorSvc);
					loginError = "你的帳號或密碼無效!";
				}
			} catch (NullPointerException e) {
				loginError = "你的帳號或密碼無效!";
			} catch (Exception ignored) {
			}

			if (loginError.length() > 0) {
				req.setAttribute("loginError", loginError);
				RequestDispatcher failureView = req.getRequestDispatcher("realtor_login.jsp");
				failureView.forward(req, res);
				return;
			}

			HttpSession session = req.getSession(); // 檢查到這表示帳號密碼沒問題
			session.setAttribute("realtorVO", realtorVO); // 在session內做已經登入過的標識
			RequestDispatcher successView = req.getRequestDispatcher("realtor_center.jsp");
			successView.forward(req, res);// 重導至會員中心
		} // 來自房仲登入的請求結束
	}

}
