<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table id="loginSuccessTable">
		<tr>
			<td style="height: 20px;">${sessionScope.loginMember.u_id }</td>
		</tr>
		<tr>
			<td align="right" valign="top">(${sessionScope.loginMember.u_name })</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button onclick="goMemberInfo()">내 정보</button>
				<button onclick="logout()">로그아웃</button>
			</td>
		<tr>
	</table>



</body>
</html>