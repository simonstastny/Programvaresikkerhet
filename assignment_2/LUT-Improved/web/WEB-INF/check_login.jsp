<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="sec.BCrypt" %> 

<c:choose>
<c:when test="${param.login!=null}">
    <sql:query var="users" dataSource="jdbc/lut2">
        SELECT password FROM users
        WHERE login = ? <sql:param value="${param.username}" />
    </sql:query>

    <sql:query var="admin" dataSource="jdbc/lut2">
        SELECT * FROM admin_users
        WHERE login = ? <sql:param value="${param.username}" />
    </sql:query>

    <c:set var="userDetails" value="${users.rows[0]}"/>
    <c:set var="adminDetails" value="${admin.rows[0]}"/>
    
	<c:set var="userDetailsPwd" value="${users.rows[0].password}" scope="request" />
	<% String s = (String) request.getAttribute("userDetailsPwd"); %>
    
    
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
        <title>Check</title>
    </head>

<body>

        <c:choose>
        
        <c:when test="<%=!BCrypt.checkpw(request.getParameter("password"),s) %>">
            Login Failed
            <p><a title="lien" href="/LUT_2.0_IMPROVED/index.jsp">Continue</A>.</p>
        </c:when>
        <c:otherwise>
        <c:set var="login" scope="session" value="${param.username} }"/>
            <c:choose>
            <c:when test="${empty adminDetails}">
            	<c:set var="sessionUser" scope="session" value="user"/>
                <p>Login as normal user.</p>
            </c:when>
            <c:otherwise>
                <c:set var="sessionAdmin" scope="session" value="admin"/>
                <p>Login as an admin.</p>
            </c:otherwise>
            </c:choose>
        <p><a title="lien" href="Restricted/user_page">Continue</A>.</p>
        </c:otherwise>
    </c:choose>
</c:when>
</c:choose>
    </body>
</html>
    
    

