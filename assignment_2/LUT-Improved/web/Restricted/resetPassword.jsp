<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
<c:when test="${param.reset_password != null}">    
     
    <c:choose>
        <c:when test="${param.bOk}">
            <sql:update dataSource="${conn}" var="addresses">
                UPDATE Users SET password=? WHERE login=?
                <sql:param value='${param["password"]}'/>
                <sql:param value='${session["login"]}'/>
            </sql:update>
        </c:when>
    </c:choose>
</c:when>
</c:choose>
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reseting password</title>
    </head>
    <body>
        <h1>Reset your password</h1>
        <form method="post" action="">
            <p>New password:<input type="password" name="nPpassword" size="20" maxlength="26"></p>
            <c:choose>
                <c:when test="${param.bOk}">
                    <span class="error">A password must be composed by letters and figures</span>
                </c:when>
            </c:choose>
            <p><input type="submit" value="submit" name="reset_password"></p>
        </form>
    </body>
</html>
