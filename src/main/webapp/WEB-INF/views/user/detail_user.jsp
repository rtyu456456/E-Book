<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
</head>
<body>

<p>principal : <sec:authentication property="principal"/></p>
<p>MemberVO : <sec:authentication property="principal.user"/></p>
<p>사용자이름: <sec:authentication property="principal.user.userName"/></p>
<p>사용자 아이디: <sec:authentication property="principal.username"/></p> 
<p> 사용자 권한 리스트: <sec:authentication property="principal.user.authList"/></p>

  <h1>Welcome to the Secure Page</h1>

    <p>Logged in as: <sec:authentication property="principal.username" /></p>
    <p>User Roles: <sec:authentication property="principal.authorities" /></p>

    <a href="/logout">Logout</a>
</body>
</html>
