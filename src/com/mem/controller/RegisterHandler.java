package com.mem.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.*;

@WebServlet("/reg.do")
public class RegisterHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterHandler() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("memRegister".equals(action)) { // 來自首頁"註冊"的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			MemService memSvc = new MemService();
			List<MemVO> list = memSvc.getAllIdList();
			
			//取得 IdentityServlet 產生的驗證碼 (captcha)
			String captchaId = (String)req.getSession().getAttribute("randomString");

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_id = req.getParameter("mem_id").trim().toLowerCase();
				String mem_psw = req.getParameter("mem_psw").trim();
				String mem_psw2 = req.getParameter("mem_psw2").trim();
				String mem_name = req.getParameter("mem_name").trim();
				String mem_addr = req.getParameter("mem_addr").trim();
				String twcity = req.getParameter("twcity");
				String twdist = req.getParameter("twdist");
				String twcitytext = req.getParameter("twcitytext").trim();
				
				String search_state = null;
				String aggrement = null;
				String captcha = req.getParameter("captcha").trim().toUpperCase();
				

				//檢查帳號是否已存在
				if((mem_id.trim()).length()==0) {
					errorMsgs.add("帳號不可為空");
				} else {
					for (MemVO idList : list) {
						if( mem_id.equals((idList.getMem_id())) ) {
							errorMsgs.add("此帳號已存在!");
						}
					}
				}
				
				//檢查密碼是否為空
				if ((mem_psw.trim()).length()==0 || (mem_psw2.trim()).length()==0) {
					errorMsgs.add("密碼不可為空!");
				}
				
				//檢查兩次密碼是否相同
				if ( !mem_psw.equals(mem_psw2) ) {
					errorMsgs.add("兩次輸入的密碼不同!");
				}
				
				//檢查姓名是否為空
				if ( (mem_name.trim()).length()==0 ) {
					errorMsgs.add("姓名不可為空!");
				}

				//檢查地址是否為空
				if ( twcitytext.length()==0 ) {
					errorMsgs.add("街道內容不可為空!");
				}

				// 檢查是否開啟找房狀態
				try {
					search_state = req.getParameter("search_state").toUpperCase();
				} catch (NullPointerException e) {
					search_state = "OFF";
				}

				// 檢查是否同意 "服務條款 & 隱私權政策"
				try {
					(req.getParameter("aggrement")).equals("on");
					aggrement = req.getParameter("aggrement");
				} catch (NullPointerException e) {
					errorMsgs.add("需同意 '服務條款 & 隱私權政策' 才能註冊!");
					aggrement = "";
				}
				
				//檢查驗證碼
				if (!captcha.equals(captchaId)) {
					errorMsgs.add("驗證碼錯誤!");
				}

				
				MemVO memVOtmp = new MemVO();
				memVOtmp.setMem_id(mem_id);
				memVOtmp.setMem_psw(mem_psw);
				memVOtmp.setMem_name(mem_name);
				memVOtmp.setTwcity(twcity);
				memVOtmp.setTwdist(twdist);
				memVOtmp.setTwcitytext(twcitytext);
				memVOtmp.setSearch_state(search_state);
				memVOtmp.setAggrement(aggrement);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVOtmp", memVOtmp);  // 含有輸入格式錯誤的empVOtmp物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/register.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setMem_psw(mem_psw);
				memVO.setMem_name(mem_name);
				memVO.setTwcity(twcity);
				memVO.setTwdist(twdist);
				memVO.setTwcitytext(twcitytext);
				memVO.setSearch_state(search_state);
				memVO.setAggrement(aggrement);
				memVO = memSvc.addMem(mem_id, mem_psw, mem_name, mem_addr, search_state);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/success.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交success.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/register.jsp");
				failureView.forward(req, res);
			}
		}
	}
}