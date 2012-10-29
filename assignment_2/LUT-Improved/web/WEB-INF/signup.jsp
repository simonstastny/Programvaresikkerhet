<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:query var="login_available" dataSource="jdbc/lut2">
        SELECT login FROM users
        WHERE  login = ? <sql:param value="${param.login}" />
</sql:query>

<c:set var="verif_login" value="${login_available.rows[0]}"/>

<c:choose>
<c:when test="${param.signup != null and empty verif_login and empty form.errors}">
    <c:choose>
        <c:when test="${empty verif_login}">
            <sql:transaction dataSource="jdbc/lut2">
                <sql:update var="add_user">
                    INSERT INTO users VALUES (?, ?, ?);
                    <sql:param value="${fn:escapeXml(param.login)}" />
                    <sql:param value="${fn:escapeXml(user.password)}" />
                    <sql:param value="${fn:escapeXml(param.mail)}" />
                </sql:update>
            </sql:transaction>
            <c:redirect url="confirm_registration.jsp"></c:redirect>
        </c:when>
    </c:choose>
</c:when>
</c:choose>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LUT 2.0 signup</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
    </head>
    <body>
        <h1>Sign up</h1>
        <form method="post" action="">
            <p><label>Login:</label><input type="text" name="login" value="${param.login}" size="26" maxlength="26"></p>
            <c:choose>
                <c:when test="${not empty verif_login}">
                    <span class="error">Login already used</span>
                     <br />
                </c:when>
            </c:choose>
            
            <p><label>Password:</label><input type="password" name="password" size="26" maxlength="26"></p>
            <span class="error">${form.errors['password']}</span>
            <br />
            
            <p><label>Email Adress:</label><input type="text" name="mail" value="${param.mail}" size="52" maxlength="52"></p>
            <span class="error">${form.errors['mail']}</span>
            <br />
            ${BCrypt.hashpw(param.password, BCrypt.gensalt(13))}
            <p><input type="submit" value="signup" name="signup"></p>
        </form>
    </body>
</html>
