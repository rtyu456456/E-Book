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
		<c:forEach var="c" items="${communitys }">
			<form id="communitys-name" action="/go.commu.post">
				<button class="commu_board_btn" name="c_no" value="${c.c_no }">
					<img src="/img/커뮤니티_즐겨찾기안함_icon.png"> &nbsp; ${c.c_name }
				</button>
			</form>
		</c:forEach>
		<br>

	 	<div class="go-made-community">
			<img alt="" src="/img/돋보기_icon.png">
			<div>찾으시는 게시판이 없으신가요?</div>
			<button>&nbsp; 새 게시판 만들기 &nbsp;</button>
		</div>
	</div>
</body>
</html>