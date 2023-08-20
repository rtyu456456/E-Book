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
	transition: 1s ease 0.3s;
}

.whatshowwrapper {
	position: relative;
}

.whatshow1 {
	position: absolute;
	top: 0px;
}

.whatshow2 {
	position: absolute;
	top: 0px;
	display: none;
}
</style>
</head>
<body>
	<div class="flex flex-col w-full">
		<c:forEach items="${bookrecords }" var="br">
			<div
				class="br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6 bg-white ml-10 mb-10">
				<div class="w-full h-full flex">
					<div class="flex justify-center items-center ml-10 w-1/4 h-full">
						<img class="object-fit w-40 h-60" alt="" src="${br.b_thumbnail }">
					</div>
					<div
						class="flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]">
						<div class="w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3">
							<span>${br.b_title }</span>
							<div class="w-1/4 h-full flex justify-center">
								<a> <img class="object-fit w-8 h-8" alt=""
									src="imgs/x_icon.png">
								</a>
							</div>
						</div>
						<div
							class="text-[1.7rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
							<span>${br.b_authors.replace("!", ", ") }</span>
						</div>
						<div class="w-11/12 h-1/3 text-[1.7rem] font-bold whatshowwrapper">
							<div class="whatshow2 w-11/12">
								<span>총 페이지</span> <input hidden class="br-no" name="br_no"
									value="${br.br_no }"> <input disabled
									class="total-page text-center w-1/6" value="${br.b_page }">
								<span>쪽</span> <br> <span>읽은 페이지</span> <input
									class="cur-page text-center w-1/6" value="${br.br_page }">
								<span>쪽</span>
							</div>
							<div class="whatshow1 w-full h-full">
								<div class="flex w-full justify-between">
									<span>현재 진행률</span> <span class="progress-num pr-5">현재
										진행률</span>
								</div>
								<div class="flex w-full h-1/2 items-center">
									<div
										class="w-3/4 h-1/2 rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 bg-[rgba(255,255,255,1)] mr-5">
										<div class="progress-bar"></div>
									</div>
									<div class="flex justify-center w-1/4">
										<span class="progress-per">%</span>
									</div>
								</div>
							</div>
						</div>
						<div
							class="flex justify-end items-end w-full h-1/6 text-[2rem] font-bold ">
							<div
								class="flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
								<button
									class="update w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">수정</button>
								<button
									class="cancel-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl"
									style="display: none;">취소</button>
								<button
									class="confirm-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl"
									style="display: none;">완료</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
		$(function() {

			$('.br-box').each(function() {
				let br_page = parseInt($(this).find('.cur-page').val());
				let b_page = parseInt($(this).find('.total-page').val());
				let progress_bar = $(this).find('.progress-bar');
				let progress_num = $(this).find('.progress-num');
				let progress_per = $(this).find('.progress-per');
				let progress_width = Math.ceil(100 * br_page / b_page) + '%';

				progress_bar.css('width', progress_width);
				progress_num.text('(' + br_page + '/' + b_page + ')');
				progress_per.text(progress_width);
			});

			$('.update').click(function(e) {
				let brBox = $(this).closest('.br-box');
				let whatshow1 = brBox.find('.whatshow1');
				let whatshow2 = brBox.find('.whatshow2');
				let cancelBtn = brBox.find('.cancel-btn');
				let confirmBtn = brBox.find('.confirm-btn');

				whatshow2.show();
				confirmBtn.show();
				cancelBtn.show();
				whatshow1.hide();
				$(this).hide();
			});

			$(".cancel-btn").click(function(e) {
				let brBox = $(this).closest('.br-box');
				let whatshow1 = brBox.find('.whatshow1');
				let whatshow2 = brBox.find('.whatshow2');
				let updateBtn = brBox.find('.update');
				let confirmBtn = brBox.find('.confirm-btn');

				whatshow1.show();
				updateBtn.show();
				whatshow2.hide();
				confirmBtn.hide();
				$(this).hide();
			});

			$(".confirm-btn").click(
					function() { // 완료 누를 시 click 시 function 실행
						let brBox = $(this).closest('.br-box'); // 가장 가까운 br-box라는 div 탐색
						let br_no = brBox.find('.br-no').val(); // br-box에 있는 br-no라는 input을 찾아 value 가져오기
						let b_page = brBox.find('.total-page').val(); // br-box에 있는 total-page라는 input을 찾아 value 가져오기
						let br_page = brBox.find('.cur-page').val(); // br-box에 있는 cur-page라는 input을 찾아 value 가져오기
						let progress_bar = brBox.find('.progress-bar');
						let progress_num = brBox.find('.progress-num');
						let progress_per = brBox.find('.progress-per');

						brBox.find('.whatshow2').hide();
						brBox.find('.whatshow1').show();
						brBox.find('.update').show();
						brBox.find('.cancel-btn').hide();
						brBox.find('.confirm-btn').hide();

						$.ajax({
							url : "bookRecord.page",
							data : {
								"br_no" : br_no,
								"br_page" : br_page
							},
							success : function(data) {
								console.log(data);
								console.log(b_page);
								let progress_width = Math.ceil(data / b_page
										* 100)
										+ '%';
								progress_bar.css('width', progress_width);
								progress_num.text('(' + data + '/' + b_page
										+ ')');
								progress_per.text(progress_width);
							}

						});
					});
		}); // ready
	</script>
</body>
</html>