package com.realtor.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.util.CompositeQuery.RealtorFindByKeyWord;
import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Realtor;

public class RealtorDAO implements RealtorDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G5");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO Realtor(RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_PHOTO, RTR_AREA, RTR_INTRO, RTR_IDNO, RE_NO) "
			+ " VALUES('RT'||(LPAD(to_char(RTR_SEQ.NEXTVAL),8,'0')), ?, ?, ?, ?, ?, ?, ?, ?)";
	// private static final String UPDATE_STMT = "UPDATE Realtor SET RTR_ID=?,
	// RTR_NAME=?, RTR_PHOTO=?, RTR_AREA=?, RTR_INTRO=? WHERE RTR_NO =
	// ?";//預留給之後可能要改服務地區，還有emailID帳號
	private static final String UPDATE_STMT = "UPDATE Realtor SET RTR_NAME=?, RTR_PHOTO=?, RTR_INTRO=? WHERE RTR_NO = ?";// 修改姓名、照片、簡介用
	private static final String GET_ONE_STMT = "SELECT RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_PHOTO, RTR_AREA, RTR_INTRO, RTR_IDNO, RE_NO, RTR_STATE FROM Realtor WHERE RTR_NO = ?";
	private static final String GET_ALL_STMT = "SELECT RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_PHOTO, RTR_AREA, RTR_INTRO, RTR_IDNO, RE_NO, RTR_STATE FROM Realtor ORDER BY RTR_NO";
	private static final String UPDATE_FOR_PHOTO = "UPDATE Realtor SET RTR_PHOTO=?, RTR_INTRO=? WHERE RTR_NO=?";

	private static final String GET_ONE_BY_ID = "SELECT RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_PHOTO, RTR_AREA, RTR_INTRO, RTR_IDNO, RE_NO, RTR_STATE FROM Realtor WHERE RTR_ID = ?";
	private static final String CHANGE_PASSWORD = "UPDATE Realtor SET RTR_PSW=? WHERE RTR_NO= ?";
	private static final String SET_RTR_STATE = "UPDATE Realtor SET RTR_STATE=? WHERE RTR_NO= ?";
	private static final String GET_ONE_BY_NAME = "SELECT RTR_NO, RTR_ID, RTR_PSW, RTR_NAME, RTR_PHOTO, RTR_AREA, RTR_INTRO, RTR_IDNO, RE_NO, RTR_STATE FROM Realtor WHERE RTR_NAME = ? ORDER BY RTR_NO";
	private static final String GET_ID_LIST = "SELECT RTR_ID FROM Realtor";

	// 新增
	@Override
	public void insert(RealtorVO realtorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			con.setAutoCommit(false);

			pstmt.setString(1, realtorVO.getRtr_id());
			pstmt.setString(2, realtorVO.getRtr_psw());
			pstmt.setString(3, realtorVO.getRtr_name());
			pstmt.setBytes(4, realtorVO.getRtr_photo());
			pstmt.setString(5, realtorVO.getRtr_area());
			pstmt.setString(6, realtorVO.getRtr_intro());
			pstmt.setString(7, realtorVO.getRtr_idno());
			pstmt.setString(8, realtorVO.getRe_no());

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
	}// 新增結束

	// 修改
	// @Override
	// public void update(RealtorVO realtorVO) {
	// Connection con = null;
	// PreparedStatement pstmt = null;
	//
	// try {
	// con = ds.getConnection();
	// pstmt = con.prepareStatement(UPDATE_STMT);
	//
	// con.setAutoCommit(false);
	//
	// pstmt.setString(1, realtorVO.getRtr_id());
	// pstmt.setString(2, realtorVO.getRtr_psw());
	// pstmt.setString(3, realtorVO.getRtr_name());
	// pstmt.setBytes(4, realtorVO.getRtr_photo());
	// pstmt.setString(5, realtorVO.getRtr_area());
	// pstmt.setString(6, realtorVO.getRtr_intro());
	// pstmt.setString(7, realtorVO.getRtr_idno());
	// pstmt.setString(8, realtorVO.getRe_no());
	// pstmt.setString(9, realtorVO.getRtr_state());
	// pstmt.setString(10, realtorVO.getRtr_no());
	//
	// pstmt.executeUpdate();
	// con.commit();
	// con.setAutoCommit(true);
	//
	// } catch (SQLException se) {
	// throw new RuntimeException("A database error occured. " +
	// se.getMessage());
	// } finally {
	// if (pstmt != null) {
	// try {
	// pstmt.close();
	// } catch (SQLException se) {
	// se.printStackTrace(System.err);
	// }
	// }
	// if (con != null) {
	// try {
	// con.close();
	// } catch (Exception e) {
	// e.printStackTrace(System.err);
	// }
	// }
	// }
	// }// 修改結束

	// 修改姓名，照片，簡介
	@Override
	public void update(RealtorVO realtorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STMT);

			con.setAutoCommit(false);

			pstmt.setString(1, realtorVO.getRtr_name());
			pstmt.setBytes(2, realtorVO.getRtr_photo());
			pstmt.setString(3, realtorVO.getRtr_intro());
			pstmt.setString(4, realtorVO.getRtr_no());

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
	}// 修改姓名，照片，簡介結束

	// 查單一rtr_no
	@Override
	public RealtorVO findByPrimaryKey(String rtr_no) {
		RealtorVO realtorvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, rtr_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return realtorvo;
	}// 查單一rtr_no結束

	// 查全部
	@Override
	public List<RealtorVO> getAll() {
		List<RealtorVO> realtorlist = new ArrayList<RealtorVO>();
		RealtorVO realtorvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
				realtorlist.add(realtorvo);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return realtorlist;
	}// 查全部結束

	// 專門塞房仲照片以及簡介
	@Override
	public void updatePhoto(RealtorVO realtorVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_FOR_PHOTO);

			con.setAutoCommit(false);

			pstmt.setBytes(1, realtorVO.getRtr_photo());
			pstmt.setString(2, realtorVO.getRtr_intro());
			pstmt.setString(3, realtorVO.getRtr_no());

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
	}// 專門塞房仲照片以及簡介結束

	// 找房仲ID
	@Override
	public RealtorVO findById(String rtr_id) {
		RealtorVO realtorvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_ID);

			pstmt.setString(1, rtr_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return realtorvo;
	}// 找房仲ID結束

	// 修改房仲密碼
	@Override
	public void changePassword(RealtorVO realtorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_PASSWORD);

			con.setAutoCommit(false);

			pstmt.setString(1, realtorVO.getRtr_psw());
			pstmt.setString(2, realtorVO.getRtr_no());

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
	}// 修改房仲密碼結束

	// 修改房仲狀態
	@Override
	public void changeRealtorState(RealtorVO realtorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SET_RTR_STATE);

			con.setAutoCommit(false);

			pstmt.setString(1, realtorVO.getRtr_state());
			pstmt.setString(2, realtorVO.getRtr_no());

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
	}// 修改房仲狀態結束

	// 找單一房仲透過名字
	@Override
	public RealtorVO findByName(String rtr_name) {
		RealtorVO realtorvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_NAME);

			pstmt.setString(1, rtr_name);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return realtorvo;
	}// 找單一房仲透過名字結束

	// 得到房仲Id(email)
	@Override
	public List<RealtorVO> getIdList() {
		List<RealtorVO> realtorlist = new ArrayList<RealtorVO>();
		RealtorVO realtorvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ID_LIST);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorlist.add(realtorvo);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return realtorlist;
	}// 得到房仲Id(email)結束

	// 房仲萬用複合查詢
	@Override
	public List<RealtorVO> getAll(Map<String, String[]> map) {

		List<RealtorVO> list = new ArrayList<RealtorVO>();
		RealtorVO realtorvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			String finalSQL = "SELECT * FROM REALTOR " + jdbcUtil_CompositeQuery_Realtor.get_WhereCondition(map)
					+ "ORDER BY RTR_NO";
			pstmt = con.prepareStatement(finalSQL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
				list.add(realtorvo);
			}
			System.out.println("●●finalSQL = " + finalSQL);

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return list;
	} // 房仲萬用複合查詢結束

	// 房仲萬用複合查詢ByKeyword
	@Override
	public List<RealtorVO> findByKeyword(String keyword) {

		List<RealtorVO> list = new ArrayList<RealtorVO>();
		RealtorVO realtorvo = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			String finalSQL = "select * from Realtor " + RealtorFindByKeyWord.getKeyWordSQL(keyword) + " ORDER BY RTR_NO";
			pstmt = con.prepareStatement(finalSQL);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				realtorvo = new RealtorVO();
				realtorvo.setRtr_no(rs.getString("RTR_NO"));
				realtorvo.setRtr_id(rs.getString("RTR_ID"));
				realtorvo.setRtr_psw(rs.getString("RTR_PSW"));
				realtorvo.setRtr_name(rs.getString("RTR_NAME"));
				realtorvo.setRtr_photo(rs.getBytes("RTR_PHOTO"));
				realtorvo.setRtr_area(rs.getString("RTR_AREA"));
				realtorvo.setRtr_intro(rs.getString("RTR_INTRO"));
				realtorvo.setRtr_idno(rs.getString("RTR_IDNO"));
				realtorvo.setRe_no(rs.getString("RE_NO"));
				realtorvo.setRtr_state(rs.getString("RTR_STATE"));
				list.add(realtorvo);
			}
			System.out.println("getKeywordSQL: " + finalSQL);

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException re) {
					re.printStackTrace(System.err);
				}
			}
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
		return list;
	} // 房仲萬用複合查詢結束 ByKeyword

}
