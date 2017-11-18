package com.coupon.model;

import java.sql.Date;
import java.util.List;

public class CouponJDBCDAO implements CouponDAO_interface {
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String userid = "BA104G5";
	private static final String password = "ba104g5";
	
	private Date cp_from;
	private Date cp_to;
	private String cp_content;
	private String cp_discount;
	private String pdo_no;
	private String cp_state;
	private Date cp_date;
	private String mem_no;
	private String pro_no;
	private String cp_no;
	
	
	
	
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
