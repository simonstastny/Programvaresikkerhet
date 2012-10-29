<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="country" dataSource="jdbc/lut2">
    SELECT full_name FROM country
</sql:query>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to the user page</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
</head>
<body>

	<p>You are connected as an admin.</p>
	
	<h1>Hi admin!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>LUT 2.0 provides information about approved international schools</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view information about schools in a country, please select a country below:</td>
                </tr>
                <tr>
                    <td><form action="schools.jsp">
                            <strong>Select a country:</strong>
                            <select name="country">
                                <c:forEach var="row" items="${country.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                            <input type="submit" value="submit" />
                        </form></td>
                </tr>
            </tbody>
        </table>
        
	<p><a title="lien" href="Admin/formAddCountrySchool">Add a new country or a new school.</A></p>
	<p>Or maybe you wan't to <a title="lien" href="/LUT_2.0_IMPROVED/logout">log out</A>.</p>
	
</body>
</html>