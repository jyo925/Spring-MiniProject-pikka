<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>모두 다 가능해요</h1>

<security:authorize access="isAnonymous()">
<a href="/customLogin">Login</a>
</security:authorize>

<security:authorize access="isAuthenticated()">
<form action="/logout" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<button type="submit">Logout</button>
</form>
</security:authorize>

</body>
</html>