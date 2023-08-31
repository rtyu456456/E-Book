<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="post_background">
		<c:forEach var="cp" items="${communityPosts }">
			<form action="/go.commu.detail">
				<input type="hidden" name="c_no" value="${cp.cp_community }">
				<button class="post_contents" name="cp_no"
					value="${cp.cp_no }">
					<div class="post_title">${cp.cp_title }</div>
					<div style="position: absolute; margin-left: 50rem; margin-top: -4rem;"
						onclick="deleteMyPost('${cp.cp_no}', '${cp.cp_owner }', '${cp.cp_title }')">삭제</div>
					<div class="post_txt">${cp.cp_contents }</div>
					<div class="post_flex">
						<div class="post_flex_left">
							<div>${cp.cp_date2 }</div>
							&nbsp;|&nbsp;
							<div>${cp.cp_owner }</div>
						</div>
						<div class="post_flex_right">
							<div class="post_like">
								<img src="/img/like_icon.png">${cp.cp_like }
							</div>
							&nbsp;&nbsp;
							<div class="post_dislike">
								<img alt="" src="/img/dislike_icon.png">${cp.cp_dislike }
							</div>
							&nbsp;&nbsp;
							<div class="post_chat">
								<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png">${cp.cp_reviewCnt }
							</div>
						</div>
					</div>
				</button>
			</form>
			<br>
			<hr class="line">
		</c:forEach>
	</div>

	<dialog id="deleteModal">
	<div class="delete-background">
		<div class="delete-text" style="font-size: 3.3rem;">삭제하시겠습니까?</div>
		<div class="delete-flex">
			<button id="back-btn">취소</button>
			<button id="delete-ok">확인</button>
		</div>
	</div>
	</dialog>
</body>
<script type="text/javascript">
	let deleteModal = document.getElementById("deleteModal");
	let modalBackBtn = document.getElementById("back-btn");
	let deleteOkBtn = document.getElementById("delete-ok");
	let deleteText = document.querySelector(".delete-text");

	function deleteMyPost(cp_no, cp_owner, cp_title) {
		console.log(cp_no);
		deleteModal.showModal();
		deleteText.innerHTML = "'"+ cp_title + "'<br>삭제하겠습니까?";
		deleteOkBtn.addEventListener('click', function() {
			location.href = "/delete.my.post?cp_no=" + cp_no + "&&cp_owner=" + cp_owner;
		})

	}

	modalBackBtn.addEventListener('click', function() {
		deleteModal.close();
	})
</script>
</html>