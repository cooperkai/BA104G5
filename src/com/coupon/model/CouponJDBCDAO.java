package com.coupon.model;

import java.util.List;

public class CouponJDBCDAO implements CouponDAO_interface {
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String userid = "BA104G5";
	private static final String password = "ba104g5";
	
	private static final String INSERT_STMT ="";
	private static final String UPDATE_STMT =""; 
	
	private static final String GET_ONE_STMT ="";
	private static final String GET_ALL_STMT ="";
	private static final String GET_ALL_BY_TIME ="";
	
	
	@Override
	public void insert(CouponVO couponVO) {

	}

	@Override
	public void update(CouponVO couponVO) {

	}

	@Override
	public CouponVO findByPrimaryKey(String coupon_no) {
		return null;
	}

	@Override
	public List<CouponVO> getAll() {
		return null;
	}

	@Override
	public List<CouponVO> getAllByTime() {
		return null;
	}

}
