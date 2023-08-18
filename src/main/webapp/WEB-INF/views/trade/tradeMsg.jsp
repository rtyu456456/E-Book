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

		<div class="msg-nav">
			<div class="msg-to">
				<a href="/trade.Msg.get.to?u_id=${param.u_id}">
				<span> 받은 쪽지 </span></a>
			</div>

			<div class="msg-from">
				<a href="/trade.Msg.get.from?u_id=${param.u_id}"> 
				<span> 보낸 쪽지 </span></a>
			</div>
		</div>

		<div class="msg-page">
			<jsp:include page="${msgpage }" />
		</div>
	</div>

</body>
</html>