package forms;

import java.util.HashMap;
import sec.BCrypt;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import beans.User;

public class FormLogin {
	private static final String FIELD_USERNAME = "username";
    private static final String FIELD_PASSWORD = "password";
    private String result;
    private Map<String, String> errors = new HashMap<String, String>();

    public String getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }
    
    public User connectUser( HttpServletRequest request ) {
        String username = getFieldValue( request, FIELD_USERNAME );
        String password = getFieldValue( request, FIELD_PASSWORD );
        String passwordHashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
        		
        User user = new User();

        try {
            validationUsername( username );
        } catch ( Exception e ) {
            setError( FIELD_USERNAME, e.getMessage() );
        }
        user.setUsername(username);
        
        try {
            validationPassword( password );
        } catch ( Exception e ) {
            setError( FIELD_PASSWORD, e.getMessage() );
        }   
        user.setPassword(passwordHashed);
        
        if ( errors.isEmpty() ) {
        	setResult("Login successfull !");
        } else {
        	setResult("Login failure !");
        }
        
        return user;
    }
    
    private void validationUsername( String username ) throws Exception {
    	if ( username == null || (username != null && !username.matches("^[A-Za-z0-9_-]{1,26}$")) ) {
            throw new Exception( "Allowed characters : [A-Z] and [a-z] and [0-9] and '_' and '-'" );
        }
    }
    
    private void validationPassword( String password ) throws Exception {
    	if ( password == null || (password != null && !password.matches("^[A-Za-z0-9]{1,26}$")) ) {
            throw new Exception( "Allowed characters : [A-Z] and [a-z] and [0-9]" );
        }
    }
    
    private void setError( String champ, String message ) {
        errors.put( champ, message );
    }
    
    private void setResult( String message ) {
        this.result = message;
    }
    
    private static String getFieldValue( HttpServletRequest request, String fieldName ) {
        String value = request.getParameter( fieldName );
        if ( value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value.trim();
        }
    }
	
}
