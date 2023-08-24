<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
</head>
<body>
<p>pp : <sec:authorize access="isAuthenticated()">111</sec:authorize> </p>
<sec:authorize access="isAnonymous()">
    <a href="/customLogin">????</a>
</sec:authorize>
${principal.UserDTO}
<hr>
<p>principal : <sec:authentication var="principal"  property="principal"/>${principal.username}</p>
<p>MemberVO : <sec:authentication property="principal.user"/></p>
<p>사용자 아이디: <sec:authentication property="principal.username"/></p> 

  <h1>Welcome to the Secure Page</h1>

    <p>Logged in as: <sec:authentication property="principal.username" /></p>
    <p>User Roles: <sec:authentication property="principal.authorities" /></p>
    
<sec:authorize access="permitAll">
   로그인
   회원가입
</sec:authorize>

<sec:authorize access="isAuthenticated()">
   로그아웃
   회원정보보기
</sec:authorize>

<sec:authorize access="hasRole('user')">
  관리자 페이지
</sec:authorize>

    <a href="/logout">Logout</a>
    
    
</body>
</html>
