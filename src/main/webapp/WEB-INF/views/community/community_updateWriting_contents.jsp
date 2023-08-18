<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/do.update.post">
	<div class="post_background">
	<div class="commu-writing">
		<div class="writing-title">
		<input name="cp_title" style="overflow: hidden;"  class="writing-title-text" value="${communityPost.cp_title }"></input>
		</div>
		<hr class="line">
		<div class="writing-contents">
		<textarea name="cp_contents" class="writing-contents-text"  rows="1" cols="">${communityPost.cp_contents }</textarea>
		</div>
	</div>
	</div>
	<div class="commu-writing-btn">
		<button name="cp_no" value="${communityPost.cp_no }" class="writing-btn">완료</button>
	</div>
	<input type="hidden" name="c_no" value="${community.c_no }">
	</form>

</body>

</html>