<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/do.writing.page">
	<div class="post_background">
	<div class="commu-writing">
		<div class="writing-title">
		<input name="cp_title" style="overflow: hidden;"  class="writing-title-text" placeholder="제목"></input>
		</div>
		<hr class="line">
		<div class="writing-contents">
		<textarea name="cp_contents" class="writing-contents-text"  rows="1" cols="" placeholder="내용을 입력하세요."></textarea>
		</div>
	</div>
	</div>
	<div class="commu-writing-btn">
	<input type="hidden" name="c_no" value="${community.c_no }">
		<button name="cp_community" value="${community.c_no }" class="writing-btn">완료</button>
	</div>
</form>
</body>

</html>