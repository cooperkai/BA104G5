package com.promo.model;

import java.util.List;


public interface PromoDAO_interface {
	
	public void insert(PromoVO promoVO); 
	public void update(PromoVO promoVO); 
	public PromoVO findByPrimaryKey(String promo_no);
	public List<PromoVO> getAll();
	
	public List<PromoVO> getAllByTime();//依照開始時間做排序
	public void updatePhoto(PromoVO promoVO);// 專門塞促銷照片，內容
}
