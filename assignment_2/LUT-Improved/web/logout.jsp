<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:remove scope="session" var="admin" />
<c:redirect url="login.jsp"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LUT 2.0</title>
    </head>
    <body>
        <p>You successfully logged out!</p>
        <p><a href="login.jsp">Log In</a></p>
    </body>
</html>
