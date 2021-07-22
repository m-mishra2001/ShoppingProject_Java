

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ulogin
 */
@WebServlet("/Ulogin")
public class Ulogin extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","");
			String qr="select * from user where Email=? and Password=?";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, id);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("id",id);
				response.sendRedirect("uhome.jsp");
				
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("index.html");
				rd.include(request, response);
                out.println("<script>window.alert('wrong id or password')</script>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
		}
		
		
	}

}
