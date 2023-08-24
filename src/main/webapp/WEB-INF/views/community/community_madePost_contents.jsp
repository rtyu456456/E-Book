<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/community/community_main.css">
</head>
<body>
	<div class="community-list">
		<br>
		<form action="/seach.all.community">
		<button id="x-btn">
			<img alt="" src="/img/x_icon.png">
		</button>
		</form>
		
		<form action="/do.made.post">
		<div class="made-post-contents">
			<div class="made-post-title">새 게시판 만들기</div>
			<input name="c_name" class="made-post-input" placeholder="게시판 이름">
			<button>완료</button>
		</div>
		</form>
	</div>
</body>
</html>