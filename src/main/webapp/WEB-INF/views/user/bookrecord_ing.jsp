<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.progress-bar {
	width: 10%;
	height: 100%;
	border-radius: 60px;
	background-color: rgba(246, 110, 110, 0.8);
}

.whatshowwrapper{
position: relative;}
.whatshow1{
position: absolute;
top: 0px;
}
.whatshow2{
position: absolute;
top: 0px;
display: none;
}

</style>
</head>
<body>
	<div class="flex flex-col w-full">
		<c:forEach items="${bookrecords }" var="br">
			<div id="form"
				class="block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6 bg-white ml-10 mb-10">
					<div class="w-full h-full flex">
						<input hidden class="br-no" value="${br.br_no }">
						<div class="flex justify-center items-center ml-10 w-1/4 h-full">
							<img class="object-fit w-40 h-60" alt="" src="${br.b_thumbnail }">
						</div>
						<div
							class="flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]">
							<div class="text-[2.5rem] font-bold pt-10 h-1/3">
								<span>${br.b_title }</span>
							</div>
							<div
								class="text-[1.7rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
								<span>${br.b_authors.replace("!", ", ") }</span>
							</div>
							<div class="w-11/12 h-1/3 text-[1.7rem] font-bold whatshowwrapper">
								<div class="whatshow2 w-11/12">
									<span>총 페이지</span>
									<input disabled class="total-page text-center w-1/6" value="${br.b_page }"> <span>쪽</span>
									<br>
									<span>읽은 페이지</span>
									 <input
										class="cur-page text-center w-1/6" value="${br.br_page }">
										<span>쪽</span>
								</div> 
								<div class="whatshow1 w-full h-full">
									<span>현재 진행률</span>
									<div
										class="w-3/4 h-1/4 rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 bg-[rgba(255,255,255,1)]">
										<div class="progress-bar"></div>
									</div>
								</div>
							</div>
							<div
								class="flex justify-end items-end w-full h-1/6 text-[2rem] font-bold ">
								<div
									class="flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
									<button
										class="update w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">수정</button>
									<button class="cancel-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl" style="display: none;">취소</button>
									<button class="confirm-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl" style="display: none;">완료</button>
								</div>
							</div>
						</div>
					</div>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
	$(function(){
		$('.update').click(function(e){
			e.preventDefault();
			$('.whatshow2').show();
			$('.whatshow1').hide();
			$('.update').hide();
			$('.cancel-btn').show();
			$('.confirm-btn').show();
		});
		
		$(".cancel-btn").click(function(e){
			e.preventDefault();
			$('.whatshow2').hide();
			$('.whatshow1').show();
			$('.update').show();
			$('.cancel-btn').hide();
			$('.confirm-btn').hide();
		});
		
		
	});
	</script>
</body>
</html>