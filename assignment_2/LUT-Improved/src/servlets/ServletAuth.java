package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletAuth extends HttpServlet {
    public static final String VIEW_CONNECTED = "/Restricted/user_page";
    public static final String VIEW_NOT_CONNECTED = "/WEB-INF/login.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
    	
    	 if ( request.getSession().getAttribute( "sessionAdmin" ) != null || request.getSession().getAttribute( "sessionUser" ) != null) {

    		 this.getServletContext().getRequestDispatcher( VIEW_CONNECTED ).forward( request, response );
         } 
    	 else {
    		 this.getServletContext().getRequestDispatcher( VIEW_NOT_CONNECTED ).forward( request, response );
    	 }
    }
}
