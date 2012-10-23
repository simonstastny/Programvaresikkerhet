package forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import beans.School;

public class FormSchool {
	
	private static final String FIELD_SHORT_NAME_SCHOOL = "short_name_school";
    private static final String FIELD_FULL_NAME_SCHOOL = "full_name_school";
    private static final String FIELD_PLACE = "place";
    private static final String FIELD_ZIP = "zip";
    private static final String FIELD_COUNTRY = "country";
    
    private Map<String, String> result = new HashMap<String, String>();
    private Map<String, String> errors = new HashMap<String, String>();

    public Map<String, String> getResult() {
        return result;
    }

    public Map<String, String> getErrors() {
        return errors;
    }
    
    public School addSchool( HttpServletRequest request ) {
        String shortName = getFieldValue( request, FIELD_SHORT_NAME_SCHOOL );
        String fullName = getFieldValue( request, FIELD_FULL_NAME_SCHOOL );
        String place = getFieldValue( request, FIELD_PLACE );
        int zip = getFieldValueInt( request, FIELD_ZIP );
        String country = getFieldValue( request, FIELD_COUNTRY);

        School school = new School();

        try {
            validationShortName( shortName );
        } catch ( Exception e ) {
            setError( FIELD_SHORT_NAME_SCHOOL, e.getMessage() );
        }
        school.setShortName(shortName);

        try {
            validationFullName( fullName );
        } catch ( Exception e ) {
            setError( FIELD_FULL_NAME_SCHOOL, e.getMessage() );
        }
        school.setFullName(fullName);
        
        try {
            validationPlace( place );
        } catch ( Exception e ) {
            setError( FIELD_PLACE, e.getMessage() );
        }
        school.setPlace(place);
        
        try {
            validationCountry( country );
        } catch ( Exception e ) {
            setError( FIELD_COUNTRY, e.getMessage() );
        }
        school.setCountry(country);
        
        try {
            validationZip( zip );
        } catch ( Exception e ) {
            setError( FIELD_ZIP, e.getMessage() );
        }
        school.setZip(zip);

        if ( errors.isEmpty() ) {
        	setResult ("school", "The school has been added !");
        } else {
        	setResult ("school", "Failure in the adding of the new school...");
        }

        return school;
    }
    
    private void validationShortName( String shortName ) throws Exception {
        if ( shortName == null || shortName.length() > 10 || (shortName != null && !shortName.matches("^[A-Z]{1,10}$")) ) {
            throw new Exception( "A short name school must be composed of 10 letters maximum." );
        }
    }
    
    private void validationFullName( String fullName ) throws Exception {
        if ( fullName == null || (fullName != null && !fullName.matches("^[A-Za-z-'\t\n\r\f]{1,20}$")) ) {
            throw new Exception( "Only basic letters without accents in a full name school." );
        }
    }
    
    private void validationZip( int zip ) throws Exception {
        if ( zip == -1 ) {
            throw new Exception( "Only numbers in a zip code." );
        }
    }
    
    private void validationPlace( String place ) throws Exception {
        if ( place == null || (place != null && !place.matches("^[A-Za-z-'\t\n\r\f]{1,50}$")) ) {
            throw new Exception( "Only basic letters without accents in a place name for school." );
        }
    }
    
    private void validationCountry( String country ) throws Exception {
        if ( country == null || (country != null && !country.matches("^[A-Z]{1,3}$")) ) {
            throw new Exception( "Please select a valid country name." );
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
    
    private static int getFieldValueInt( HttpServletRequest request, String fieldName ) {
    	int value;
    	try
    	{
    		value = Integer.parseInt(request.getParameter(fieldName));
    	}
    	catch (NumberFormatException nfe)
    	{
    		return -1;
    	}
    	return value;
    }
}
