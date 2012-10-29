package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import forms.FormSignup;

public class ServletFormSignup extends HttpServlet {
    public static final String ATT_USER = "user";
    public static final String ATT_FORM = "form";
    public static final String VIEW_SUCCESS = "/WEB-INF/confirm_registration.jsp";
    public static final String VIEW_FORM = "/WEB-INF/signup.jsp";
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        this.getServletContext().getRequestDispatcher( VIEW_FORM ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{   	
    	FormSignup form = new FormSignup();
		
        User user = form.addUser( request );
		
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_USER, user );
        
        this.getServletContext().getRequestDispatcher( VIEW_FORM ).forward( request, response );
    
    }
}
