package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Country;
import forms.FormCountry;

public class ServletFormCountry extends HttpServlet {
	public static final String ATT_COUNTRY = "country";
    public static final String ATT_FORM = "form";
    public static final String VIEW_SUCCESS = "/Restricted/add_country.jsp";
    public static final String VIEW_FORM = "/Restricted/formAddCountrySchool.jsp";
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        this.getServletContext().getRequestDispatcher( VIEW_FORM ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{   	
    	FormCountry form = new FormCountry();
		
        Country country = form.addCountry( request );
		
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_COUNTRY, country );
    
        if ( form.getErrors().isEmpty() ) {
            this.getServletContext().getRequestDispatcher( VIEW_SUCCESS ).forward( request, response );
        } else {
            this.getServletContext().getRequestDispatcher( VIEW_FORM ).forward( request, response );
        }
    }
}
