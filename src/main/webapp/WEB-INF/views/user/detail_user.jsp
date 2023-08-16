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
		<div>${result }</div>
		<form action="userUpdate.go" method="post">
		<div>id : ${sessionScope.user.u_id }</div>
		<div>pw : ${sessionScope.user.u_pw }</div>
		<div>profile : <img alt="" src="imgs/${sessionScope.user.u_profile }"> </div>
		<button>수정하기</button>
		</form>
		
	</div>
</body>
</html>