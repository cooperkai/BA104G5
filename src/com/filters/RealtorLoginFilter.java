package com.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemVO;
import com.realtor.model.RealtorVO;

/**
 * RealtorLoginFilter 後端登入過濾器 重導至登入頁面 目前套用了 /realtor/login.do
 */
public class RealtorLoginFilter implements Filter {

	private FilterConfig config;// 宣告

	@Override
	public void destroy() {
		config = null;// 幹掉它
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession();

		RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");
		if (realtorVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
			res.sendRedirect(req.getContextPath() + "/front/realtor/realtor_login.jsp"); // *工作2: 請該user去登入網頁(raltor_login.jsp), 進行登入
		} else {
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;// 取值
	}

}
