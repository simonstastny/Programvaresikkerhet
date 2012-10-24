<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
        <title>LUT Admin pages</title>
    </head>
    <body>
        <h1> Login page </h1>
        <form method="post" action="check_login">
            <p>Username:<input type="text" name="username" size="20"></p>
            <p>Password:<input type="password" name="password" size="20"></p>
            <p><input type="submit" value="submit" name="login"></p>
        </form>
    </body>
</html>
