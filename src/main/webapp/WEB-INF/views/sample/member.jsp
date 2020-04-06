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

<security:authentication property="principal.userVO" var="abc"/><br>

<security:authentication property="principal"/><br>
==================================<br>
<security:authentication property="principal.userVO.userName" var="jy"/><br>
======================================<br>
<security:authentication property="principal.userVO.userId"/><br>
<security:authentication property="principal.userVO.authList"/><br>

${jy}<br>
================<br>
${abc.userName}


</body>
</html>