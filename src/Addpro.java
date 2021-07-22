
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.pept.transport.Connection;
import java.sql.*;
/**
 * Servlet implementation class Addpro
 */
@WebServlet("/Addpro")
public class Addpro extends HttpServlet {
	
	protected void  service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		String Name=request.getParameter("name");
		String P=request.getParameter("price");
		int price=Integer.parseInt(P);
		String category=request.getParameter("cat");
		String comp=request.getParameter("comp");
		//datbase
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","");
			String qr="insert into product values(?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, id);
			ps.setString(2, Name);
			ps.setInt(3, price);
			ps.setString(4,category);
			ps.setString(5,comp);
		    ps.setString(6,"NULL");
		int i=ps.executeUpdate();
          if(i>0)
          {            RequestDispatcher rd=request.getRequestDispatcher("adminhome.html");
                           rd.include(request, response);
                           out.println("<script>window.alert('product added')</script>");
          }else
          {
        	  RequestDispatcher rd=request.getRequestDispatcher("adminhome.html");
              rd.include(request, response);
              out.println("<script>window.alert('product not  added')</script>");
          }
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e);
			
		}
		
		
		
		
	}

}
