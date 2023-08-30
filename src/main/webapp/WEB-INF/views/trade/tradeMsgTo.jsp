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
	<c:forEach var="m" items="${msgsTo }">
	
		<div class="msg-list">
			<div class="trade-book-img">
				<img alt="" src="${m.t_thumbnail }">
				
			</div>
			<div class="msg-info">
				<div class="msg-trader">

					<div>${m.m_from }님으로부터</div>
					<div class="cancle">
						<img alt="" src="img/cancleXbutton.png"
							onclick="location.href='/delete.msg.to?m_no=${m.m_no }&u_id=${sessionScope.user.u_id}'">

					</div>
				</div>
				<div class="msg-txt">${m.m_txt }</div>
				<div class="msg-book-title">${m.t_book_title }</div>
				<div class="msg-time">
					<fmt:formatDate value="${m.m_when }" pattern="yyyy.MM.dd HH:mm" />
					<button class="btn-open-modal">답장</button>
				</div>
			</div>
		</div>
		<form action="trade.Send.Msg">
			<div class="modal">
				<div class="modal_body">
					<input type="hidden" value="${m.t_no }" name="m_trade"> <input
						type="hidden" value="${m.m_from }" name="m_to"> <input
						type="hidden" value="${sessionScope.user.u_id }" name="m_from">
					<h1>${m.m_from}님에게보내는쪽지</h1>
					<br>
					<textarea name="m_txt"></textarea>
					<button class="sendMsg">전송</button>
				</div>
			</div>
		</form>
	</c:forEach>

	<script type="text/javascript">

		const modal = document.querySelector('.modal');
		const btnOpenModal=document.querySelector('.btn-open-modal');
		
		btnOpenModal.addEventListener("click", ()=>{
		    modal.style.display="flex";
		    
		    map.setDraggable(false);
		    map.setZoomable(false);
		});
		modal.addEventListener("click", (event) => {
		    if (event.target === modal) {
		        modal.style.display = "none";
		        map.setDraggable(true);
		        map.setZoomable(true);
		    }
		});
		
		document.addEventListener("click", (event) => {
		    if (event.target.classList.contains("btn-open-modal")) {
		        modal.style.display = "flex";
		        map.setDraggable(false);
		        map.setZoomable(false);
		    }
		});
		</script>


</body>
</html>