package Com.ATS;

import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		int userName = Integer.parseInt(name);
		String password = request.getParameter("password");
		String a = "a";
		String e = "e";
		int result = atsDao.loginDao(userName,password);
		if(result == 1)
		{
			HttpSession session=request.getSession();  
	        session.setAttribute("user",userName);
			if(userName == 1)
			{
				session.setAttribute("usertype",a);
				response.sendRedirect("AdminHome.jsp");
			}
			else
			{
				session.setAttribute("usertype",e);
				session.setAttribute("user",userName);
				atsDao.insertLoginDao(userName);
				response.sendRedirect("EmployeeHome.jsp");
			}
		}
		else
		{
			System.out.println("Incorrect Username/Password");
			response.sendRedirect("index.jsp");
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	}

}
