<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/sale.css">
</head>
<body>
	<div class="container-sale">
		<div class="sale-nav">
			<div class="sale-now">
				<a href="/trade.sale.now?u_id=${sessionScope.loginMember.u_id}">
					<span> 판매 중 </span>
				</a>
			</div>

			<div class="sale-complete">
				<a href="/trade.sale.complete?u_id=${sessionScope.loginMember.u_id}">
					<span> 판매 완료 </span>
				</a>
			</div>
		</div>

		<div class="sale-Page">
			<jsp:include page="${salePage }" />
		</div>
	</div>

	<script>
		if(${param.title == null}){
			localStorage.clear()
		}
	</script>
</body>
</html>