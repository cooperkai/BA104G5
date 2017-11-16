package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemJDBCDAO implements MemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BA104G5";
	String passwd = "ba104g5";
	
	private static final String INSERT_STMT = 
			"INSERT INTO Member (mem_no,mem_id,mem_psw,mem_name,mem_addr,search_state,lock_state) "
			+ "VALUES ('MB'||(LPAD(to_char(MEM_SEQ.NEXTVAL),8,'0')),?,?,?,?,?,?)";
	//一般的 GET 時不抓密碼
	private static final String GET_ALL_STMT =
			"SELECT mem_no,mem_id,mem_name,mem_addr,search_state,lock_state FROM Member order by mem_no";
	private static final String GET_ONE_STMT =
			"SELECT mem_no,mem_id,mem_psw,mem_name,mem_addr,search_state,lock_state FROM Member WHERE mem_no=?";
	private static final String GET_ONE_BY_ID =
			"SELECT mem_no,mem_id,mem_psw,mem_name,mem_addr,search_state,lock_state FROM Member WHERE mem_id=?";
	private static final String GET_ID_LIST = "SELECT mem_id FROM Member";
	// 不 DELETE 會員帳號，只將 LOCK_STATE 更新成 OFF
	private static final String UPDATE = "UPDATE Member SET mem_name=?, mem_addr=?, search_state=? where mem_no=?";
	private static final String LOCK = "UPDATE Member SET lock_state=? where mem_no=?";
	private static final String CHANGE_PASSWORD = "UPDATE Member SET mem_psw=? where mem_no=?";	
	
	@Override
	public void insert(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, memVO.getMem_id());
			pstmt.setString(2, memVO.getMem_psw());
			pstmt.setString(3, memVO.getMem_name());
			pstmt.setString(4, memVO.getMem_addr());
			pstmt.setString(5, memVO.getSearch_state());
			pstmt.setString(6, "OFF"); // 此為 lock_state，新加入為 Off，通過 e-mail 驗證才會改為 On
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(insert出問題了) " + se.getMessage());
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
	}

	@Override
	public void update(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memVO.getMem_name());
			pstmt.setString(2, memVO.getMem_addr());
			pstmt.setString(3, memVO.getSearch_state());
			pstmt.setString(4, memVO.getMem_no()); //where的條件
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(update) " + se.getMessage());
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
	}

	@Override
	public void changeLockState(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(LOCK);

			pstmt.setString(1, memVO.getLock_state());
			pstmt.setString(2, memVO.getMem_no()); //where的條件
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(changeLockState) " + se.getMessage());
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
	}

	@Override
	public void changePassword(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CHANGE_PASSWORD);

			pstmt.setString(1, memVO.getMem_psw());
			pstmt.setString(2, memVO.getMem_no()); //where的條件
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(changePassword) " + se.getMessage());
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
	}
	
	@Override
	public MemVO findByPrimaryKey(String mem_no) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mem_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_psw(rs.getString("mem_psw"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setSearch_state(rs.getString("search_state"));
				memVO.setLock_state(rs.getString("lock_state"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(findByPrimaryKey) "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
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
		return memVO;
	}
	
	@Override
	public MemVO findById(String mem_id) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_BY_ID);

			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_psw(rs.getString("mem_psw"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setSearch_state(rs.getString("search_state"));
				memVO.setLock_state(rs.getString("lock_state"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(findByPrimaryKey) "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
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
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_no(rs.getString("mem_no"));
				memVO.setMem_id(rs.getString("mem_id"));
				memVO.setMem_name(rs.getString("mem_name"));
				memVO.setMem_addr(rs.getString("mem_addr"));
				memVO.setSearch_state(rs.getString("search_state"));
				memVO.setLock_state(rs.getString("lock_state"));
				list.add(memVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(getAll) "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
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
	}
	
	@Override
	public List<MemVO> getIdList() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ID_LIST);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memVO = new MemVO();
				memVO.setMem_id(rs.getString("mem_id"));
				list.add(memVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured.(getAll) "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
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
	}
	
	public static void main(String args[]) {
		
		MemJDBCDAO dao = new MemJDBCDAO();
		
		MemVO memVO1 = new MemVO();
		
		// 註冊新會員
		memVO1.setMem_id("bbb@gmail.com");
		memVO1.setMem_psw("123456");
		memVO1.setMem_name("趙子龍");
		memVO1.setMem_addr("中壢區中大路資策會大樓300號");
		memVO1.setSearch_state("On");
		dao.insert(memVO1);
		
		// 會員 update 資料
//		memVO1.setMem_name("趙子龍");
//		memVO1.setMem_addr("資策會大樓205機房");
//		memVO1.setSearch_state("Off");
//		memVO1.setMem_no("MB00000005");
//		dao.update(memVO1);
		
		// 更改會員帳號狀態， lock_state=ON 為啟用，才可登入系統
//		memVO1.setLock_state("ON");
//		memVO1.setMem_no("MB00000005");
//		dao.changeLockState(memVO1);
		
		// 更改會員密碼
//		memVO1.setMem_psw("888888");
//		memVO1.setMem_no("MB00000005");
//		dao.changePassword(memVO1);
		
		// 顯示所有會員
//		List<MemVO> list = dao.getAll();
//		System.out.println(" " + " mem_no " + "\t" + "  e-mail  " + "\t" + "\t" + "name " + "\t" + "Address " + "\t" + " " + " search_state" + " " + " lock_state");
//		for (MemVO aMem : list) {
//			System.out.print(aMem.getMem_no() + "\t");
//			System.out.print(aMem.getMem_id() + "\t");
//			System.out.print(aMem.getMem_name() + "\t");
//			System.out.print(aMem.getMem_addr() + "\t");
//			System.out.print(aMem.getSearch_state() + "\t");
//			System.out.println(aMem.getLock_state());
//		}
		
		// 以會員編號 mem_no 搜尋某個會員 or 某個會員檢視自己的資料
//		memVO1 = dao.findByPrimaryKey("MB00000001");
//		System.out.println("  mem_no    : " + memVO1.getMem_no());
//		System.out.println("  mem_id    : " + memVO1.getMem_id());
//		System.out.println("  mem_psw   : " + memVO1.getMem_psw());
//		System.out.println("  mem_name  : " + memVO1.getMem_name());
//		System.out.println("  Address   : " + memVO1.getMem_addr());
//		System.out.println("SearchState : " + memVO1.getSearch_state());
//		System.out.println(" LockState  : " + memVO1.getLock_state());
		
		// 以會員ID(e-mail) mem_id 搜尋某個會員 or 某個會員檢視自己的資料
//		memVO1 = dao.findById("BillGates@gmail.com");
//		System.out.println("  mem_no    : " + memVO1.getMem_no());
//		System.out.println("  mem_id    : " + memVO1.getMem_id());
//		System.out.println("  mem_name  : " + memVO1.getMem_name());
//		System.out.println("  Address   : " + memVO1.getMem_addr());
//		System.out.println("SearchState : " + memVO1.getSearch_state());
//		System.out.println(" LockState  : " + memVO1.getLock_state());
		
		// 取得所有會員ID(e-mail) 用以比對新註冊會員輸入的ID
//		List<MemVO> list = dao.getIdList();
////		System.out.println(" " + " mem_no " + "\t" + "  e-mail  " + "\t" + "\t" + "name " + "\t" + "Address " + "\t" + " " + " search_state" + " " + " lock_state");
//		for (MemVO idList : list) {
//			System.out.println(idList.getMem_id());
//		}
	}
}