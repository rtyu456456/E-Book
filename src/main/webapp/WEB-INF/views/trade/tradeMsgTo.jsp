<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeMsg.css">
</head>
<body>

	<div class="container-msg">
	
		<c:forEach var="m" items="${msgsTo }">
			<div class="msg-list">
				<div>
					<img alt="" src="">
				</div>
				<div>
					<div>
						<div>${m.m_from }</div>
						<div>${m.u_achievement }</div>
					</div>
					<div>${m.m_txt }</div>
				</div>
				<div>
					<fmt:formatDate value="${m.m_when }" pattern="yyyy.MM.dd HH:mm" />
				</div>
			</div>
			
		</c:forEach>
		<div>
			<img alt="" src="/static/img/bookimgsample.jpg">


		</div>


	</div>

</body>
</html>