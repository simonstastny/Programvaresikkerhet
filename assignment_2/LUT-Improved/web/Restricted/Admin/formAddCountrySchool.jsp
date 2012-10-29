<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page errorPage="ErrorPage.jsp" %>

<sql:query var="countryShortName" dataSource="jdbc/lut2">
    SELECT short_name FROM country
</sql:query>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a country</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
</head>
<body>
	<h1>Welcome to the admin homepage. <br />Here you can add a new country or a new school in the database.</h1>
	
	<table border="0">
		<thead>
			<tr>
			<th>Adding of a new country in the database.</th>
			</tr>
		</thead>
                    
        <tbody>
        <tr>
        <td>            
                   <form method="post" action="<c:url value="/Restricted/Admin/form_country"/>">

                            <p>Full name: <input type="text" id="full_name" name="full_name" value="<c:out value="${country.fullName}"/>" size="20" maxlength="50" ></p>
                            <span class="error">${form.errors['full_name']}</span>
							<br />
                            
                            <p>Short name: <input type="text" id="short_name" name="short_name" value="<c:out value="${country.shortName}"/>" size="3" maxlength="3" ></p>
                            <span class="error">${form.errors['short_name']}</span>
							<br />
							
                            <p><input type="submit" value="Submit country"></p>
               				<p class="${empty form.errors ? 'success' : 'error'}">${form.result['country']}</p>
					</form></td>
			</tr>
						</tbody>
		</table>
		<br />
		
		<table border="0">
		<thead>
			<tr>
			<th>Adding of new school in the database.</th>
			</tr>
		</thead>
                    
        <tbody>
			<tr>
        <td>            
                   <form method="post" action="<c:url value="/Restricted/Admin/form_school"/>">

                            <p>Full name: <input type="text" id="full_name_school" name="full_name_school" value="<c:out value="${school.fullName}"/>" size="20" maxlength="100" ></p>
                            <span class="error">${form.errors['full_name_school']}</span>
							<br />
                            
                            <p>Short name: <input type="text" id="short_name_school" name="short_name_school" value="<c:out value="${school.shortName}"/>" size="10" maxlength="10" ></p>
                            <span class="error">${form.errors['short_name_school']}</span>
							<br />
							
							<p>Place: <input type="text" id="place" name="place" value="<c:out value="${school.place}"/>" size="20" maxlength="50" ></p>
                            <span class="error">${form.errors['place']}</span>
							<br />
							
							<p>Zip: <input type="text" id="zip" name="zip" value="<c:out value="${school.zip}"/>" size="11" maxlength="11" ></p>
                            <span class="error">${form.errors['zip']}</span>
							<br />
							
							<p>Country: 
							<select name="country">
                                <c:forEach var="row" items="${countryShortName.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select></p>
                            <span class="error">${form.errors['country']}</span>
							<br />
							
                            <p><input type="submit" value="Submit school"></p>
               				<p class="${empty form.errors ? 'success' : 'error'}">${form.result['school']}</p>
					</form></td>
			</tr>
			</tbody>
		</table>
    </body>
</html>
