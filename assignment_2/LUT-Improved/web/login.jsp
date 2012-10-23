
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:choose>
<c:when test="${param.login!=null}">    
    <sql:query var="users" dataSource="jdbc/lut2">
        SELECT password FROM users
        WHERE  login = ? <sql:param value="${param.username}" />
    </sql:query>

    <sql:query var="admin" dataSource="jdbc/lut2">
        SELECT * FROM admin_users
        WHERE  login = ? <sql:param value="${param.username}" />
    </sql:query>

    <c:set var="userDetails" value="${users.rows[0]}"/>
    <c:set var="adminDetails" value="${admin.rows[0]}"/>
    
    <c:choose>
        <c:when test="${userDetails.password != BCrypt.hashpw(param.password, BCrypt.gensalt(13))}">
            Login Failed
        </c:when>
        <c:otherwise>
            <c:set scope="session" var="username" value="false"/>
            
            <c:choose>
            <c:when test="${empty adminDetails}">
                <c:set scope="session" var="admin" value="false"/>
            </c:when>
            <c:otherwise>
                <c:set scope="session" var="admin" value="true"/>
            </c:otherwise>    
            </c:choose>
            <c:redirect url="index.jsp"/>
        </c:otherwise>
    </c:choose>
</c:when>
</c:choose>
            
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="lutstyle.css">
        <title>LUT Admin pages</title>
    </head>
    <body>
        <h1> Login page </h1>
        <form method="post" action="login.jsp">
            <p>Username:</font><input type="text" name="username" size="20"></p>
            <p>Password:</font><input type="password" name="password" size="20"></p>
            <p><input type="submit" value="submit" name="login"></p>
        </form>
    </body>
</html>
