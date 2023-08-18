<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeMsg.css">
</head>
<body>

	<div class="container-msg">
		<c:forEach var="m" items="msgs">
			<div class="msg-list">
				<div>
					<div> <img alt="" src=""> </div>
					<div> ${m.m_txt } </div>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>