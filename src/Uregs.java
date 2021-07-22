

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Uregs
 */
@WebServlet("/Uregs")
public class Uregs extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
	 try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","");
		String qr="insert into user values(?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setString(1, name);
		ps.setString(2, city);
		ps.setString(3, id);
		ps.setString(4, pwd);
		
		int i=ps.executeUpdate();
		if(i>0){
			RequestDispatcher rd=request.getRequestDispatcher("Ulogin.html");
			rd.include(request,response);
			out.println("<script>window.alert('successfully registered')</script>");
			
		}else{RequestDispatcher rd=request.getRequestDispatcher("Ulogin.html");
		rd.include(request,response);
		out.println("<script>window.alert('Not registered')</script>");}
		
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		out.println(e);
	}
	 
		
	}

}
