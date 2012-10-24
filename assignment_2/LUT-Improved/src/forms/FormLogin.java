package forms;

import java.util.HashMap;
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
        user.setPassword(password);
        
        if ( errors.isEmpty() ) {
        	setResult("Login successfull !");
        } else {
        	setResult("Login failure !");
        }
        
        return user;
    }
    
    private void validationUsername( String username ) throws Exception {
        //
    }
    
    private void validationPassword( String password ) throws Exception {
        //
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
