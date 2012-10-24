package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Country;
import forms.FormCountry;

public class ServletFormAddCountrySchool extends HttpServlet {
    public static final String VIEW = "/Restricted/formAddCountrySchool.jsp";
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        this.getServletContext().getRequestDispatcher( VIEW ).forward( request, response );
    }
}
