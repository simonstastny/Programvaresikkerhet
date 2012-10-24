<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/lutstyle.css"/>" />
        <title>Check</title>
    </head>

<body>
        
        <c:choose>
        <c:when test="${userDetails.password != param.password}">
            Login Failed
        </c:when>
        <c:otherwise>
            <c:choose>
            <c:when test="${empty adminDetails}">
                Login as normal user.
            </c:when>
            <c:otherwise>
                <c:set scope="session" var="admin" value="true"/>
                <p>Login as admin.</p>
                
                <p><a title="lien" href="Restricted/formAddCountrySchool">Add a new country or a new school.</A></p>
                
                <p>Or maybe you wan't to <a title="lien" href="logout.jsp">log out</A>.</p>
            </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</c:when>
</c:choose>
        
    </body>
</html>
    
    

