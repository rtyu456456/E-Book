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
	<div class="post_background" style="height: 100vh;">
		<br> <br> <br>
		<c:forEach var="comment" items="${comment }">
			<form action="/go.commu.detail.mycomment">
				<input type="hidden" name="c_no" value="${comment.c_no }"> <input
					type="hidden" name="cr_no" value="${comment.cr_no }"> <input
					type="hidden" class="cr-like" name="cr_like"
					value="${comment.cr_like }">
				<button name="cp_no" value="${comment.cp_no }"
					class="comment-notice-box">
					<div class="comment-notice">새로운 댓글이 달렸어요</div>
					<br>
					<div style="position: relative; align-content: center;">
						<div class="comment-post">${comment.c_name }</div>
						<div class="comment-content">
							<div class="comment-user">${comment.cr_owner }:</div>
							<div class="comment-txt">&nbsp; ${comment.cr_contents }</div>
						</div>
						<div class="comment-date">
							<fmt:formatDate value="${comment.cr_date }" pattern="MM/dd HH:mm" />
						</div>
					</div>
					<br>
				</button>
			</form>
			<br>
			<br>
		</c:forEach>
	</div>


</body>
</html>