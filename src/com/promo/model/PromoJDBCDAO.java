package com.promo.model;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PromoJDBCDAO implements PromoDAO_interface {

	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String userid = "BA104G5";
	private static final String password = "ba104g5";

	private static final String INSERT_STMT = "INSERT INTO Promo (Promo_No, Promo_From, Promo_To, Promo_Name, Promo_Content, Promo_Photo, Promo_State, EMP_NO) VALUES('PRO'||LPAD(TO_CHAR(SEQ_PRO.NEXTVAL), 7, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STMT = 
			"UPDATE Promo SET Promo_From=?, Promo_To=?, Promo_Name=?, Promo_Content=?, Promo_Photo=?, Promo_State=?, EMP_NO=? WHERE Promo_No = ?";
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
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

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
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

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
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

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
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

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
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

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_FOR_PHOTO);

			con.setAutoCommit(false);

			pstmt.setBytes(1, promoVO.getPromo_photo());
			pstmt.setString(2, promoVO.getPromo_content());
			pstmt.setString(3, promoVO.getPromo_no());

			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (ClassNotFoundException ce) {
			throw new RuntimeException("Couldn't load database driver. " + ce.getMessage());
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

	public static void main(String[] args) throws IOException {
		PromoJDBCDAO dao = new PromoJDBCDAO();

		// 新增
//		PromoVO vo = new PromoVO();
//		vo.setPromo_from(java.sql.Date.valueOf("2017-12-18"));
//		vo.setPromo_to(java.sql.Date.valueOf("2017-12-25"));
//		vo.setPromo_name("哇哈哈");
//		vo.setPromo_content("哇哈哈內容");
//		byte[] pic = getPictureByteArray("WebContent/images/promophoto/promo001.jpg");
//		vo.setPromo_photo(pic);
//		vo.setPromo_state("已上架");
//		vo.setEmp_no("EM00000001");
//		dao.insert(vo);

		// 修改
		// PromoVO vo2 = new PromoVO();
		// vo2.setPromo_from(java.sql.Date.valueOf("2017-12-18"));
		// vo2.setPromo_to(java.sql.Date.valueOf("2017-12-25"));
		// vo2.setPromo_name("aaaaaaaaaaaa");
		// vo2.setPromo_content("ffffff");
		// byte[] pic =
		// getPictureByteArray("WebContent/images/promophoto/promo001.jpg");
		// vo2.setPromo_photo(pic);
		// vo2.setPromo_state("已上架");
		// vo2.setPromo_no("PRO0005004");
		// vo2.setEmp_no("EM00000001");
		// dao.update(vo2);

		// 查單一
		// PromoVO vo3 = dao.findByPrimaryKey("PRO0005001");
		// System.out.println(vo3.getPromo_no());
		// System.out.println(vo3.getPromo_from());
		// System.out.println(vo3.getPromo_to());
		// System.out.println(vo3.getPromo_name());
		// System.out.println(vo3.getPromo_content());
		// System.out.println(vo3.getPromo_photo());
		// System.out.println(vo3.getPromo_state());
		// System.out.println(vo3.getPromo_date());
		// System.out.println(vo3.getEmp_no());

		// 查全部
//		 List<PromoVO> vo4 = dao.getAll();
//		 for(PromoVO apro : vo4){
//		 System.out.println(apro.getPromo_no());
//		 System.out.println(apro.getPromo_from());
//		 System.out.println(apro.getPromo_to());
//		 System.out.println(apro.getPromo_name());
//		 System.out.println(apro.getPromo_content());
//		 System.out.println(apro.getPromo_photo());
//		 System.out.println(apro.getPromo_state());
//		 System.out.println(apro.getPromo_date());
//		 System.out.println(apro.getEmp_no());
//		 }

		// 查詢照時間To
//		List<PromoVO> vo4 = dao.getAllByTime();
//		for (PromoVO apro : vo4) {
//			System.out.println(apro.getPromo_no());
//			System.out.println(apro.getPromo_to());
//			System.out.println(apro.getPromo_name());
//			System.out.println(apro.getPromo_content());
//			System.out.println(apro.getPromo_photo());
//			System.out.println(apro.getPromo_state());
//			System.out.println(apro.getPromo_date());
//			System.out.println(apro.getPromo_from());
//			System.out.println(apro.getEmp_no());
//			System.out.println();
//		}

		// 專門塞促銷資訊照片，內容
		for (int i = 0; i < 5; i++) {
			FileInputStream in = new FileInputStream("WebContent/images/promophoto/promo00" + i + ".jpg");
			String reader = getLongString("WebContent/txt/promo_txt/promo" + i + ".txt");
			String promo_no = "PRO000500" + i;
			byte[] promopic = new byte[in.available()];
			in.read(promopic);
			PromoVO vo5 = new PromoVO();
			vo5.setPromo_photo(promopic);
			vo5.setPromo_content(reader);
			vo5.setPromo_no(promo_no);
			dao.updatePhoto(vo5);
			in.close();
		}
	}

	// 上傳照片的方法
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	// 使用String 上傳促銷簡介用
	public static String getLongString(String path) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(path));
		StringBuilder sb = new StringBuilder(); // StringBuffer is thread-safe!
		String str;
		while ((str = br.readLine()) != null) {
			sb.append(str);
			sb.append("\n");
		}
		br.close();

		return sb.toString();
	}

}
