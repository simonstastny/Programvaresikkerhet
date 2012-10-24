<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page errorPage="ErrorPage.jsp" %>

<sql:transaction dataSource="jdbc/lut2">
    <sql:update var="count">
        INSERT INTO user_reviews VALUES (?, ?, ?);
        <sql:param value="${fn:escapeXml(param.school_id)}" />
        <sql:param value="${fn:escapeXml(param.name)}" />
        <sql:param value="${fn:escapeXml(param.review)}" />
    </sql:update>
</sql:transaction>
        
<sql:query var="schools" dataSource="jdbc/lut2">
    SELECT * FROM school
    WHERE school.school_id= ? <sql:param value="${param.school_id}"/>
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5;url=index.jsp"> 
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
        <title>Review added!</title>
    </head>
    <body>
      
      <c:set var="school" value="${schools.rows[0]}"/>
        <c:choose>
            <c:when test="${ empty school }">
                School with id  ${param.school_id} does not exist.
                <br><br>
            </c:when>
            <c:otherwise>
                <h1>Thanks ${param.name}!</h1>
                Your contribution is appreciated.<br>
                You will be redirected to the LUT2.0 main page in a few seconds.
            </c:otherwise>
        </c:choose>
</body>
</html>
