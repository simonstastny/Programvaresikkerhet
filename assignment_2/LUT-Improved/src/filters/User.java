package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class User implements Filter {
    public static final String PUBLIC_ACCESS     = "/index.jsp";

    public void init( FilterConfig config ) throws ServletException {
    }

    public void doFilter( ServletRequest req, ServletResponse res, FilterChain chain ) throws IOException,
            ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession();

        if ( session.getAttribute( "sessionUser" ) != null || session.getAttribute( "sessionAdmin" ) != null) {
        	chain.doFilter( request, response );
        } else {
        	response.sendRedirect( request.getContextPath() + PUBLIC_ACCESS );
        }
    }

    public void destroy() {
    }
}
