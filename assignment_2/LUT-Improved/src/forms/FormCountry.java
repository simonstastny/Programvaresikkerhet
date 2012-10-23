package forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import beans.Country;

public class FormCountry {
	
	private static final String FIELD_SHORT_NAME = "short_name";
    private static final String FIELD_FULL_NAME = "full_name";
    private Map<String, String> result = new HashMap<String, String>();
    private Map<String, String> errors = new HashMap<String, String>();

    public Map<String, String> getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }
    
    public Country addCountry( HttpServletRequest request ) {
        String shortName = getFieldValue( request, FIELD_SHORT_NAME );
        String fullName = getFieldValue( request, FIELD_FULL_NAME );

        Country country = new Country();

        try {
            validationShortName( shortName );
        } catch ( Exception e ) {
            setError( FIELD_SHORT_NAME, e.getMessage() );
        }
        country.setShortName(shortName);

        try {
            validationFullName( fullName );
        } catch ( Exception e ) {
            setError( FIELD_FULL_NAME, e.getMessage() );
        }
        country.setFullName(fullName);

        if ( errors.isEmpty() ) {
        	setResult("country", "The country has been added !");
        } else {
        	setResult("country", "Failure in the adding of the new country...");
        }

        return country;
    }
    
    private void validationShortName( String shortName ) throws Exception {
        if ( shortName == null || shortName.length() > 3 || (shortName != null && !shortName.matches("^[A-Z]{3}$")) ) {
            throw new Exception( "A short name country must be composed of 3 letters maximum." );
        }
    }
    
    private void validationFullName( String fullName ) throws Exception {
        if ( fullName == null || (fullName != null && !fullName.matches("^[A-Za-z-'\t\n\r\f]{1,20}$")) ) {
            throw new Exception( "Only basic letters without accents in a full name country." );
        }
    }
    
    private void setError( String champ, String message ) {
        errors.put( champ, message );
    }
    
    private void setResult( String champ, String message ) {
        result.put( champ, message );
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
