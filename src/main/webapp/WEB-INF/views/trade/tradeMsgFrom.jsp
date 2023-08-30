<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="m" items="${msgsFrom }">
		<div class="msg-list">
			<div class="trade-book-img">
				<img alt="" src="${t.t_thumbnail}">
				<div>${m.t_book_title }</div>
			</div>
			<div class="msg-info">
				<div class="msg-trader">${m.m_to }
					님께
					<div class="cancle">
						<img alt="" src="img/cancleXbutton.png"
							onclick="location.href='/delete.msg.from?m_no=${m.m_no }&u_id=${sessionScope.loginMember.u_id}'">
					</div>
				</div>
				<div class="msg-txt">${m.m_txt }</div>
				<div class="msg-time">
					<fmt:formatDate value="${m.m_when }" pattern="yyyy.MM.dd HH:mm" />

				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>