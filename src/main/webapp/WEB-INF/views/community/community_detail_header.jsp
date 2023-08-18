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

		<div class="header_contents">
			<form action="go.commu.post">
				<button class="back_btn" name="c_no" value="${community.c_no }">
					<img src="/img/left-arrow.png">
				</button>
			</form>
			<div id="community_name">${community.c_name }</div>
			<div id="empty"></div>
		</div>

	</div>


</body>
</html>