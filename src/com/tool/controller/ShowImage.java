package com.tool.controller;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.model.NewsService;
import com.news.model.NewsVO;
import com.promo.model.PromoService;
import com.promo.model.PromoVO;
import com.realtor.model.RealtorService;
import com.realtor.model.RealtorVO;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 50 * 50 * 1024 * 1024)
public class ShowImage extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/*");
		ServletOutputStream out = res.getOutputStream();
		String action = req.getParameter("action");

		// 新聞
		if ("news_photo".equals(action)) {
			String news_no = req.getParameter("news_no");
			NewsService newsSvc = new NewsService();
			try {
				NewsVO newsVO = newsSvc.getOne(news_no);
				InputStream in = new ByteArrayInputStream(newsVO.getNews_photo());
				byte[] buffer = new byte[in.available()];
				int len = 0;
				try {
					while ((len = in.read(buffer)) != -1)
						out.write(buffer, 0, len);
					out.close();
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				FileInputStream in = new FileInputStream(getServletContext().getRealPath("/images/nopic.jpg"));
				byte[] pic = new byte[in.available()];
				in.read(pic);
				out.write(pic);
				in.close();
			}
		} // end

		// 房仲
		if ("rtr_photo".equals(action)) {
			String rtr_no = req.getParameter("rtr_no");
			RealtorService realtorSvc = new RealtorService();
			try {

				RealtorVO realtorVO = realtorSvc.getOne(rtr_no);
				InputStream in = new ByteArrayInputStream(realtorVO.getRtr_photo());
				byte[] buffer = new byte[in.available()];
				int len = 0;
				try {
					while ((len = in.read(buffer)) != -1)
						out.write(buffer, 0, len);
					out.close();
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
				FileInputStream in = new FileInputStream(getServletContext().getRealPath("/images/nopic.jpg"));
				byte[] pic = new byte[in.available()];
				in.read(pic);
				out.write(pic);
				in.close();
			}
		} // end

		// 促銷
		if ("promo_photo".equals(action)) {
			String promo_no = req.getParameter("promo_no");
			PromoService promoSvc = new PromoService();
			try {
				PromoVO promoVO = promoSvc.getOne(promo_no);
				InputStream in = new ByteArrayInputStream(promoVO.getPromo_photo());
				byte[] buffer = new byte[in.available()];
				int len = 0;
				try {
					while ((len = in.read(buffer)) != -1)
						out.write(buffer, 0, len);
					out.close();
					return;
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				FileInputStream in = new FileInputStream(getServletContext().getRealPath("/images/nopic.jpg"));
				byte[] pic = new byte[in.available()];
				in.read(pic);
				out.write(pic);
				in.close();
			}
		} // end

	}
}
