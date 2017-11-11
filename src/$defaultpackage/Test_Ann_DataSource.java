package $defaultpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/Test_Ann_DataSource")
public class Test_Ann_DataSource extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/plain; charset=Big5");
		PrintWriter out = res.getWriter();

		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/BA104G5");
			if (ds != null) {
				Connection con = ds.getConnection();

				if (con != null) {
					out.println("Get Conn: " + con.toString());
					PreparedStatement pstmt = con.prepareStatement("SELECT * FROM ANN");
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						out.println("Ann_No = " + rs.getInt(1));
					}
					con.close();
				}
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
