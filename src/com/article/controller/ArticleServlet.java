package com.article.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.mem.model.MemVO;
import com.realtor.model.RealtorVO;

@SuppressWarnings("serial")
public class ArticleServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 查單一
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*****************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 **********************/
				String rtr_no = req.getParameter("rtr_no");
				if (rtr_no == null || (rtr_no.trim()).length() == 0) {
					errorMsgs.add("請輸入房仲文章編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/myBlog.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ArticleService articleSvc = new ArticleService();
				ArticleVO articleVO = articleSvc.getOne(rtr_no);
				if (articleVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/myBlog.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*****************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 *************/
				req.setAttribute("articleVO", articleVO);
				String url = "/front/realtor/myBlog.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/myBlog.jsp");
				failureView.forward(req, res);
			}
		} // 查單一結束

		// 查單一修改結束
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL");
			System.out.println("getOne_For_Update: " + requestURL);

			try {
				System.out.println("article_getOne_For_Update_try_in");
				/*************************** 1.接收請求參數 ****************************************/
				String article_no = req.getParameter("article_no");

				/*************************** 2.開始查詢資料 ****************************************/
				ArticleService articleSvc = new ArticleService();
				ArticleVO articleVO = articleSvc.getOne(article_no);

				/*****************************
				 * 3.查詢完成,準備轉交(Send the Success view)
				 ************/
				req.setAttribute("articleVO", articleVO);
				String url = "/front/realtor/UpdateBlog.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		} // 查單一修改結束

		// 更新房仲粉絲頁
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String img = req.getParameter("img");
			// System.out.println(img);

			try {

				Enumeration<String> allname = req.getParameterNames();
				while (allname.hasMoreElements()) {
					System.out.println("article_全部的值: " + allname.nextElement());
				}
				/*****************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 *****************/
				String article_no = req.getParameter("article_no");
				String rtr_no = req.getParameter("rtr_no");

				String article_body = req.getParameter("article_body");
				if (article_body == null || article_body.trim().length() == 0) {
					errorMsgs.add("文章內容請記得輸入");
				}

				String article_state = req.getParameter("article_state").trim();
				if (article_body == null || article_body.trim().length() == 0 || article_state.equals("選擇是否開放")) {
					errorMsgs.add("請選擇是否公佈");
				}

				Timestamp nowTime = new Timestamp(System.currentTimeMillis());
				Timestamp post_date = nowTime;

				ArticleVO articleVO = new ArticleVO();
				articleVO.setArticle_no(article_no);
				articleVO.setRtr_no(rtr_no);
				articleVO.setArticle_body(article_body);
				articleVO.setPost_date(post_date);
				articleVO.setArticle_state(article_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("articleVO", articleVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/allBlog.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ArticleService articleSvc = new ArticleService();
				articleVO = articleSvc.update(article_no, rtr_no, article_body, post_date, article_state);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/allBlog.jsp");
				failureView.forward(req, res);
			}
		} // 更新房仲粉絲頁結束

		// 新增文章
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			PrintWriter out = res.getWriter();
			try {
				res.setContentType("application/json");
				Enumeration<String> allname = req.getParameterNames();
				while (allname.hasMoreElements()) {
					System.out.println("article_全部的值: " + allname.nextElement());
				}

				/********************************
				 * 1.接收請求參數 - 輸入格式的錯誤處理
				 *****************/
				String rtr_no = req.getParameter("rtr_no");
				String article_body = req.getParameter("article_body");

				if (article_body == null || article_body.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}
				String article_state = req.getParameter("article_state").trim();

				Timestamp nowTime = new Timestamp(System.currentTimeMillis());
				Timestamp post_date = nowTime;

				ArticleVO articleVO = new ArticleVO();
				articleVO.setRtr_no(rtr_no);
				articleVO.setArticle_body(article_body);
				articleVO.setPost_date(post_date);
				articleVO.setArticle_state(article_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					out.print("{\"success\":false,\"msg\":\"" + Arrays.toString(errorMsgs.toArray()) + "\"}");
					out.flush();
					return;
				}

				/*************************** 2.開始修改資料 *****************************************/
				ArticleService articleSvc = new ArticleService();
				articleVO = articleSvc.add(rtr_no, article_body, post_date, article_state);
				out.print("{\"success\":true,\"msg\":\"成功\"}");
				out.flush();
				return;
			} catch (Exception e) {
				out.print("{\"success\":false,\"msg\":\"無法取得要修改的資料\"}");
				out.flush();
				return;
			}
		} // 新增文章結束

		// 新增留言
		if ("Comm".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				RealtorVO realtorVO = (RealtorVO) req.getSession().getAttribute("realtorVO");
				MemVO memVO = (MemVO) req.getSession().getAttribute("memVO");
				String rtrName;
				if (realtorVO == null && memVO == null) {
					rtrName = "路人";
				} else if (memVO != null) {
					rtrName = memVO.getMem_name();
				} else {
					rtrName = realtorVO.getRtr_name();
				}
				String article_no = req.getParameter("article_no");
				String article_comm = rtrName + " : " + req.getParameter("article_comm") + ",";
				ArticleService articleSvc = new ArticleService();
				articleSvc.updateComm(article_no, article_comm);
				String url = "/front/realtor/allBlog.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法新增修改的資料:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front/realtor/allBlog.jsp");
				failureView.forward(req, res);
			}
		}

		// 刪除
		if ("delete".equals(action)) {
			try {

				String article_no = req.getParameter("article_no");

				ArticleService articleSvc = new ArticleService();
				articleSvc.delete(article_no);
				// 沒用到
//				PrintWriter out = res.getWriter();
//				JSONObject obj = new JSONObject();
//				String value = "45555555555555555555";
//
//				obj.put("canPass", value);
//				out.write(obj.toString());
//				out.flush();
//				out.close();

				System.out.println("delete");
			} catch (Exception e) {
				System.out.println("目前網路不穩定:" + e.getMessage());
			}
		}
	}
}
