package com.promo.model;

import java.sql.Date;
import java.util.List;

public class PromoService {

	private PromoDAO_interface dao;

	public PromoService() {
		dao = new PromoDAO();
	}

	// 新增
	public PromoVO add(java.sql.Date promo_from, java.sql.Date promo_to, String promo_name, String promo_content,
			byte[] promo_photo, String promo_state) {
		PromoVO promoVO = new PromoVO();
		promoVO.setPromo_from(promo_from);
		promoVO.setPromo_to(promo_to);
		promoVO.setPromo_name(promo_name);
		promoVO.setPromo_content(promo_content);
		promoVO.setPromo_photo(promo_photo);
		promoVO.setPromo_state(promo_state);
		dao.insert(promoVO);
		return promoVO;
	}

	// 修改
	public PromoVO update(java.sql.Date promo_from, java.sql.Date promo_to, String promo_name, String promo_content,
			byte[] promo_photo, String promo_state, String promo_no) {
		PromoVO promoVO = new PromoVO();
		promoVO.setPromo_from(promo_from);
		promoVO.setPromo_to(promo_to);
		promoVO.setPromo_name(promo_name);
		promoVO.setPromo_content(promo_content);
		promoVO.setPromo_photo(promo_photo);
		promoVO.setPromo_state(promo_state);
		promoVO.setPromo_no(promo_no);
		dao.update(promoVO);
		return promoVO;
	}

	// 查單一
	public PromoVO getOne(String promo_no) {
		return dao.findByPrimaryKey(promo_no);
	}

	// 查全部
	public List<PromoVO> getAll() {
		return dao.getAll();
	}
	
	// 查期限排序
	public List<PromoVO> getAllByTime(){
		return dao.getAllByTime();
	}

}
