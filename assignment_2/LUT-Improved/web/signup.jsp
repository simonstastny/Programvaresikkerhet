<%-- 
    Document   : signup
    Created on : 23 oct. 2012, 14:49:31
    Author     : Adrien
--%>

<c:choose>
<c:when test="${param.signup!=null}">    
    <sql:query var="login_available" dataSource="jdbc/lut2">
        SELECT login FROM users
        WHERE  login = ? <sql:param value="${param.login}" />
    </sql:query>

    <c:set var="verif_login" value="${login_available.rows[0]}"/>
    
    <c:choose>
        <c:when test="${empty verif_login}">
            Login Failed
        </c:when>
        <c:otherwise>
            
        </c:otherwise>
    </c:choose>
</c:when>
</c:choose>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LUT 2.0 signup</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="">
            <p><label>Login:</label><input type="text" name="login" size="26" maxlength="26"></p>
            <p><label>Password:</label><input type="password" name="password" size="26" maxlength="26"></p>
            <p><input type="submit" value="signup" name="signup"></p>
        </form>
    </body>
</html>
