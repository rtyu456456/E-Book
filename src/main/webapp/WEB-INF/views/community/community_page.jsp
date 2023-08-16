<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css(위에 있음)// js(아래 있음) -->
<link rel="stylesheet" href="css/community/community_page.css">
<link rel="stylesheet" href="css/community/community_header.css">
<link rel="stylesheet" href="css/community/community_main.css">
<link rel="stylesheet" href="css/community/community_post_header.css">
<link rel="stylesheet" href="css/community/community_post_contents.css">
<!-- <link rel="stylesheet" href="css/community/community_board_page.css"> -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap')
	;
/* font-family: 'IBM Plex Sans KR', sans-serif; */
</style>
</head>
<body>
	<div class="commu_container">
		<div class="commu_header_page">
			<jsp:include page="${commu_header_page}"></jsp:include>
		</div>
		<div class="commu_contents_page">
			<jsp:include page="${commu_contents_page }"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/community/communityMainPage.js"></script>
</html>