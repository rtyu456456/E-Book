<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="commu_header">
		<div class="commu_logo">
			<div class="logo_icon">
				<img src="/img/logo_icon.png">
			</div>
		</div>
		
		<div class="writing_header">
			<form action="/go.commu.detail">
			<input type="hidden" name="cp_no" value="${communityPost.cp_no }">
			<button class="x_btn" name="c_no" value="${community.c_no }">
				<img src="/img/x_icon.png">
			</button>
			</form>
			<div id="writing">글쓰기</div>
		</div>

	</div>
</body>
</html>