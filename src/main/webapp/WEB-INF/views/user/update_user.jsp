<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="user-detail-container">
		<form action="userUpdate.go" method="post">
			<div>
				id : <input disabled value="${sessionScope.user.u_id }">
			</div>
			<div>
				pw : <input value="${sessionScope.user.u_pw }">
			</div>
			<div>
				profile : <img alt="" src="imgs/${sessionScope.user.u_id }">
				<input type="file">
			</div>
			<button>수정하기</button>
		</form>

	</div>
</body>
</html>