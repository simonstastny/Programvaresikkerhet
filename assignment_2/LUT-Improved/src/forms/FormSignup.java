/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import beans.User;
import sec.BCrypt;

public class FormSignup {
    private static final String FIELD_USER_NAME = "login";
    private static final String FIELD_PASSWORD = "password";
    private static final String FIELD_MAIL = "mail";
    private Map<String, String> errors = new HashMap<String, String>();
    private Map<String, String> result = new HashMap<String, String>();
    
    public Map<String, String> getErrors() {
        return errors;
    }
    
    public Map<String, String> getResult() {
        return result;
    }
    
    private void setError( String champ, String message ) {
        errors.put( champ, message );
    }
    
    private void setResult( String champ, String message ) {
        result.put( champ, message );
    }
    public User addUser( HttpServletRequest request ){
        String login = request.getParameter( FIELD_USER_NAME );
        String password = request.getParameter( FIELD_PASSWORD );
        String mail = request.getParameter(FIELD_MAIL);
        
        String passwordHashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
        
        User user = new User();
        
        try {
            validationLogin( login );
        } catch ( Exception e ) {
            setError( FIELD_USER_NAME, e.getMessage() );
        }
        user.setUsername(login);

        try {
            validationPassword( password );
        } catch ( Exception e ) {
            setError( FIELD_PASSWORD, e.getMessage() );
        }
        user.setPassword(passwordHashed);

        try {
            validationMail( mail );
        } catch ( Exception e ) {
            setError( FIELD_MAIL, e.getMessage() );
        }
        user.setMail(mail);

        if ( errors.isEmpty() ) {
        	setResult("user", "The user has been added !");
        } else {
        	setResult("user", "Failure in the adding of the new user!");
        }
        
        return user;
    }

    private void validationMail( String mail ) throws Exception {
        if ( mail == null || (mail != null && !mail.matches( "^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)+$")))
        {
            throw new Exception( "The email adress must be valid" );
        }
    }
    
    private void validationLogin( String login ) throws Exception {
        if ( login == null || login.length() < 3)
        {
            throw new Exception( "A login must be composed of 3 letters minimum." );
        }
        else if (login.length() > 26)
        {
            throw new Exception( "A login must be composed of 26 letters minimum." );
        }
        else if (login != null && !login.matches("^[A-Za-z_0-9-]+$")){
            throw new Exception( "A login must be composed of basics letters only." );
        }
    }
    
    private void validationPassword( String password ) throws Exception {
        if ( password == null || password.length() < 4)
        {
            throw new Exception( "A password must be composed of 4 letters minimum." );
        }
        else if (password.length() >  26)
        {
            throw new Exception( "A password must be composed of 26 letters maximum." );
        }
        else if (password != null && !password.matches("^[A-Za-z0-9]+$")){
            throw new Exception( "A password must be composed of letters and numbers only." );
        }
    }
}
