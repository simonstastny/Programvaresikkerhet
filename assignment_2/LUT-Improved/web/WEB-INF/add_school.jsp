<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page errorPage="ErrorPage.jsp" %>

<sql:query var="verif" dataSource="jdbc/lut2">
    SELECT * FROM school
    WHERE  short_name = ?  
    AND full_name = ?
    AND zip = ?
        <sql:param value="${(param.short_name_school)}" />
        <sql:param value="${(param.full_name_school)}" />
        <sql:param value="${(param.zip)}" />
</sql:query>

<sql:query var="verif_country" dataSource="jdbc/lut2">
    SELECT short_name FROM country
    WHERE  short_name = ?  
        <sql:param value="${(param.country)}" />
</sql:query>

<c:set var="test_verif" value="${verif.rows[0]}"/>
	<c:choose>
		<c:when test="${ empty test_verif and empty verif_country}">
			<sql:transaction dataSource="jdbc/lut2">
				<sql:update var="add_school">
					INSERT INTO school (school_id, full_name, short_name, place, zip, country) (SELECT MAX(school_id)+1, ?, ?, ?, ?, ? FROM school);
					<sql:param value="${fn:escapeXml(param.full_name_school)}" />
					<sql:param value="${fn:escapeXml(param.short_name_school)}" />
					<sql:param value="${fn:escapeXml(param.place)}" />
					<sql:param value="${fn:escapeXml(param.zip)}" />
					<sql:param value="${fn:escapeXml(param.country)}" />
				</sql:update>
			</sql:transaction>
		</c:when>
	</c:choose>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="5;url=/LUT_2.0_IMPROVED/index.jsp"> 
<title>Adding of a new school</title>
<link type="text/css" rel="stylesheet" href="lutstyle.css" />
</head>
<body>
	<table border="0">
		<thead>
			<tr>
			<th>Success !</th>
			</tr>
		</thead>      
       		 <tbody>
        		<tr>
        		<td>     
             	Your school ${param.full_name_school} has been added in the database. <br />
				Thank you for your contribution. <br />
				You will be redirected to the LUT2.0 main page in a few seconds. <br /> 
       			</td>
				</tr>
			</tbody>
		</table>
</body>
</html>
	
	