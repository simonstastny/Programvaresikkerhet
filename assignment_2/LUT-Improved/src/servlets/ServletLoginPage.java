package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLoginPage extends HttpServlet {
    public static final String VIEW_ADMIN = "/Restricted/Admin/admin_page.jsp";
    public static final String VIEW_USER = "/Restricted/user_page.jsp";
    public static final String VIEW_NOT_CONNECTED = "/LUT_2.0_IMPROVED/index.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	
    	 if ( request.getSession().getAttribute( "sessionAdmin" ) != null ) {

    		 this.getServletContext().getRequestDispatcher( VIEW_ADMIN ).forward( request, response );
         } 
    	 else if ( request.getSession().getAttribute( "sessionUser" ) != null) {
    		 this.getServletContext().getRequestDispatcher( VIEW_USER ).forward( request, response );
    	 }
    	 else {
    		 this.getServletContext().getRequestDispatcher( VIEW_NOT_CONNECTED ).forward( request, response );
    	 }
    }
}
