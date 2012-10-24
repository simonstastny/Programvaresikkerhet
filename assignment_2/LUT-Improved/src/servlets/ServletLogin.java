package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import forms.FormLogin;

public class ServletLogin extends HttpServlet {
    public static final String ATT_USER         = "user";
    public static final String ATT_FORM         = "form";
    public static final String ATT_SESSION_USER = "user_session";
    public static final String VIEW              = "/WEB-INF/check_login.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher( VIEW ).forward( request, response );
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        FormLogin form = new FormLogin();

        User user = form.connectUser( request );

        HttpSession session = request.getSession();

        if ( form.getErrors().isEmpty() ) {
            session.setAttribute( ATT_SESSION_USER, user );
        } else {
            session.setAttribute( ATT_SESSION_USER, null );
        }

        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_USER, user );

        this.getServletContext().getRequestDispatcher( VIEW ).forward( request, response );
    }
}
