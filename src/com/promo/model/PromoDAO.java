package com.promo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PromoDAO implements PromoDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G5");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Promo (Promo_No, Promo_From, Promo_To, Promo_Name, Promo_Content, Promo_Photo, Promo_State, EMP_NO) VALUES('PRO'||LPAD(TO_CHAR(SEQ_PRO.NEXTVAL), 7, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = "UPDATE Promo SET Promo_From=?, Promo_To=?, Promo_Name=?, Promo_Content=?, Promo_Photo=?, Promo_State=?, EMP_NO=? WHERE Promo_No = ?";
	private static final String GET_ONE_STMT = "SELECT Promo_No, to_char(Promo_From, 'yyyy-mm-dd')Promo_From, to_char(Promo_To, 'yyyy-mm-dd')Promo_To, Promo_Name, Promo_Content, Promo_Photo, Promo_State, to_char(Promo_Date, 'yyyy-mm-dd')Promo_Date, EMP_NO FROM Promo WHERE Promo_No = ?";
	private static final String GET_ALL_STMT = "SELECT Promo_No, to_char(Promo_From, 'yyyy-mm-dd')Promo_From, to_char(Promo_To, 'yyyy-mm-dd')Promo_To, Promo_Name, Promo_Content, Promo_Photo, Promo_State, to_char(Promo_Date, 'yyyy-mm-dd')Promo_Date, EMP_NO FROM Promo ORDER BY Promo_No";
	private static final String GET_ALL_BY_TIME = "SELECT * FROM Promo ORDER BY Promo_To DESC";// 查詢全部照著期限To
	private static final String UPDATE_FOR_PHOTO = "UPDATE Promo SET Promo_Photo=?, Promo_Content=? WHERE Promo_No=?";// 專門上傳照片，內容

	// 新增
	@Override
	public void insert(PromoVO promoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			con.setAutoCommit(false);

			pstmt.setDate(1, promoVO.getPromo_from());
			pstmt.setDate(2, promoVO.getPromo_to());
			pstmt.setString(3, promoVO.getPromo_name());
			pstmt.setString(4, promoVO.getPromo_content());
			pstmt.setBytes(5, promoVO.getPromo_photo());
			pstmt.setString(6, promoVO.getPromo_state());
			pstmt.setString(7, promoVO.getEmp_no());

			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException se) {
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}// 新增結束

	// 修改
	@Override
	public void update(PromoVO promoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			con.setAutoCommit(false);

			pstmt.setDate(1, promoVO.getPromo_from());
			pstmt.setDate(2, promoVO.getPromo_to());
			pstmt.setString(3, promoVO.getPromo_name());
			pstmt.setString(4, promoVO.getPromo_content());
			pstmt.setBytes(5, promoVO.getPromo_photo());
			pstmt.setString(6, promoVO.getPromo_state());
			pstmt.setString(7, promoVO.getEmp_no());
			pstmt.setString(8, promoVO.getPromo_no());

			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}// 修改結束

	//// 查單一結束
	@Override
	public PromoVO findByPrimaryKey(String promo_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PromoVO promovo = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, promo_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				promovo = new PromoVO();
				promovo.setPromo_from(rs.getDate("Promo_From"));
				promovo.setPromo_to(rs.getDate("Promo_To"));
				promovo.setPromo_name(rs.getString("Promo_Name"));
				promovo.setPromo_content(rs.getString("Promo_Content"));
				promovo.setPromo_photo(rs.getBytes("Promo_Photo"));
				promovo.setPromo_state(rs.getString("Promo_State"));
				promovo.setPromo_date(rs.getDate("Promo_Date"));
				promovo.setPromo_no(rs.getString("Promo_No"));
				promovo.setEmp_no(rs.getString("EMP_No"));
			}

		} catch (SQLException se) {
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return promovo;
	}// 查單一結束

	// 查全部
	@Override
	public List<PromoVO> getAll() {
		List<PromoVO> promoList = new ArrayList<PromoVO>();
		PromoVO promovo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				promovo = new PromoVO();
				promovo.setPromo_from(rs.getDate("Promo_From"));
				promovo.setPromo_to(rs.getDate("Promo_To"));
				promovo.setPromo_name(rs.getString("Promo_Name"));
				promovo.setPromo_content(rs.getString("Promo_Content"));
				promovo.setPromo_photo(rs.getBytes("Promo_Photo"));
				promovo.setPromo_state(rs.getString("Promo_State"));
				promovo.setPromo_date(rs.getDate("Promo_Date"));
				promovo.setPromo_no(rs.getString("Promo_No"));
				promovo.setEmp_no(rs.getString("EMP_No"));
				promoList.add(promovo);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return promoList;
	}// 查全部結束

	// 查全部照著期限To
	@Override
	public List<PromoVO> getAllByTime() {
		List<PromoVO> promoList = new ArrayList<PromoVO>();
		PromoVO promovo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_TIME);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				promovo = new PromoVO();
				promovo.setPromo_from(rs.getDate("Promo_From"));
				promovo.setPromo_to(rs.getDate("Promo_To"));
				promovo.setPromo_name(rs.getString("Promo_Name"));
				promovo.setPromo_content(rs.getString("Promo_Content"));
				promovo.setPromo_photo(rs.getBytes("Promo_Photo"));
				promovo.setPromo_state(rs.getString("Promo_State"));
				promovo.setPromo_date(rs.getDate("Promo_Date"));
				promovo.setPromo_state(rs.getString("Emp_no"));
				promovo.setPromo_no(rs.getString("Promo_No"));
				promoList.add(promovo);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return promoList;
	}// 查全部照著期限To結束

	// 專門上傳照片，內容
	@Override
	public void updatePhoto(PromoVO promoVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_PHOTO);

			con.setAutoCommit(false);

			pstmt.setBytes(1, promoVO.getPromo_photo());
			pstmt.setString(2, promoVO.getPromo_content());
			pstmt.setString(3, promoVO.getPromo_no());

			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException se) {
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}// 專門上傳照片，內容結束
}