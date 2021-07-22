

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String id=request.getParameter("id");
		String pass=request.getParameter("pwd");
	    // Cookie ck[]=request.getCookies();
	     //out.println(ck[0].getName()+" "+ck[0].getValue());
	     
		if(id.equals("admin")&&(pass.equals("12345"))){
			
			RequestDispatcher rd=request.getRequestDispatcher("adminhome.html");
			//rd.forward(request,response);
            rd.include(request,response);
	        
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("Alogin.jsp");
			rd.include(request,response);
			out.println("<script>window.alert('Invalid id and password');</script>");
		}
	}

}
