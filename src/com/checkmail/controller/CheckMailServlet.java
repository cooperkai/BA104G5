package com.checkmail.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.realtor.model.RealtorService;
import com.slr.model.SlrService;

@SuppressWarnings("serial")
public class CheckMailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 更改房仲狀態ON
		if ("onRtr".equals(action)) {// 後端更改房仲狀態
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {

				/*********************** 接收請求參數 *************************/
				String rtr_no = req.getParameter("rtr_no");
				String rtr_state = "ON";
				/*********************** 開始update資料 **********************/

				RealtorService realtorSvc = new RealtorService();
				realtorSvc.changeRealtorState(rtr_state, rtr_no);
				/*********************** 新增完成,準備轉交 ********************/

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*********************** 錯誤處理 *****************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		} // end

		// 更改房仲狀態OFF
		if ("offRtr".equals(action)) {// 後端更改房仲狀態
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				
			Enumeration names = req.getParameterNames();
			while(names.hasMoreElements()){
				System.out.println(names.nextElement());
			}
				/*********************** 接收請求參數 *************************/
				String rtr_no = req.getParameter("rtr_no");
				String rtr_state = "OFF";
				/*********************** 開始update資料 **********************/

				RealtorService realtorSvc = new RealtorService();
				realtorSvc.changeRealtorState(rtr_state, rtr_no);
				/*********************** 新增完成,準備轉交 ********************/

				String url = requestURL;
System.out.println(url);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*********************** 錯誤處理 ****************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		} // end

		// 更改廠商狀態ON
		if ("onSlr".equals(action)) {// 後端更改廠商狀態
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");

			try {

				Enumeration names = req.getParameterNames();
				while(names.hasMoreElements()){
					System.out.println(names.nextElement());
				}
				/*********************** 接收請求參數 *************************/
				String slr_no = req.getParameter("slr_no");
				String slr_state = "ON";
				/*********************** 開始update資料 **********************/

				SlrService slrSvc = new SlrService();
				slrSvc.changeSlrState(slr_state, slr_no);

				/*********************** 新增完成,準備轉交 ********************/
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*********************** 錯誤處理 *****************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		} // end

		// 更改廠商狀態OFF
		if ("offSlr".equals(action)) {// 後端更改廠商狀態
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");

			try {
				
				Enumeration names = req.getParameterNames();
				while(names.hasMoreElements()){
					System.out.println(names.nextElement());
				}
				/*********************** 接收請求參數 *************************/
				String slr_no = req.getParameter("slr_no");
				String slr_state = "OFF";
				/*********************** 開始update資料 **********************/

				SlrService slrSvc = new SlrService();
				slrSvc.changeSlrState(slr_state, slr_no);

				/*********************** 新增完成,準備轉交 ********************/
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*********************** 錯誤處理 *****************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		} // end
	}
}
