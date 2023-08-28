<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#review-textarea:focus {
	outline: none; /* 포커스 시 나타나는 외곽선 제거 */
}
</style>
</head>
<body>
	<div class="flex flex-col w-full">
		<c:forEach items="${bookrecords }" var="br">
			<div
				class="br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6 bg-white ml-10 mb-10">
				<div class="w-full h-full flex">
					<input hidden class="b-no" value="${br.b_no }"> <input
						hidden class="b-title" value="${br.b_title }"> <input
						hidden class="b-authors" value="${br.b_authors }"> <input
						hidden class="br-date"
						value="<fmt:formatDate value="${br.br_date }"
										pattern="yyyy-MM-dd" /> ">
					<input hidden class="b-thumbnail" value="${br.b_thumbnail }">
					<input hidden class="review-check" value="">
					<div class="flex justify-center items-center ml-10 w-1/4 h-full">
						<img class="object-fit w-40 h-60" alt="" src="${br.b_thumbnail }">
					</div>
					<div
						class="relative flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]">
						<a onclick="delFin(${br.br_no})"> <img
							class="absolute object-fit w-12 h-18 top-0 right-12" alt=""
							src="imgs/logo_icon.png">
						</a>
						<div
							class="w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3">
							<span> <c:choose>
									<c:when test="${fn:length(br.b_title) > 12}">
   									${fn:substring(br.b_title, 0, 12)}...
            					</c:when>
									<c:otherwise>
               						 ${br.b_title}
            					</c:otherwise>
								</c:choose>
							</span>
							<div class="w-1/4 h-full flex justify-center"></div>
						</div>
						<div
							class="text-[1.7rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
							<span>${br.b_authors.replace("!", ", ") }</span>
						</div>
						<div class="w-11/12 h-1/3">
							<div class="h-1/6 text-[1.7rem] font-bold">
								<span><fmt:formatDate value="${br.br_date }"
										pattern="yyyy-MM-dd" /> </span>
							</div>
						</div>
						<div
							class="flex justify-end items-end w-full h-1/6 text-[2rem] font-bold ">
							<div
								class="open-btn-box flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
								<button
									class="review-open-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">서평쓰기</button>
							</div>
							<div
								class="update-btn-box flex hidden justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
								<button
									class="review-update-btn w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">서평보기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 서평 등록용 dialog  -->
	<dialog
		class="review-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-4/6 bg-white">
	<div class="flex flex-col w-full h-1/4 justify-center items-center ">
		<div
			class="review-book-box  flex sticky justify-center items-center px-10 mt-10 rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-full">
			<div class="w-full h-full flex">
				<div class="flex justify-center items-center ml-10 w-1/3 h-full">
					<img class="review-thumbnail object-fit w-48 h-72" alt="" src="">
					<input hidden class="r-b-no">
				</div>
				<div
					class="relative flex flex-col justify-center items-start pl-5 w-full h-full text-[rgba(38,40,61,1)]">
					<div
						class="w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3">
						<span class="review-title w-full"> </span>
						<div class="w-1/4 h-full flex justify-center"></div>
					</div>
					<div class="text-[2rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
						<span class="review-authors"></span>
					</div>
					<div class="w-11/12 h-1/3">
						<div class="h-1/6 text-[1.7rem] font-bold">
							<span class="review-date"><fmt:formatDate value=""
									pattern="yyyy-MM-dd" /> </span>
						</div>
						<div class="h-1/6 text-[2rem] font-bold mt-4">
							<label for="r-type1">추천</label> <input type="radio" id="r-type1"
								class="w-[1.8rem] h-[1.8rem] ml-2" name="r_type" value="1">
							<label class="ml-10" for="r-type2">비추천</label> <input
								type="radio" class="w-[1.8rem] h-[1.8rem] ml-2" id="r-type2"
								name="r_type" value="2">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="flex justify-center items-center w-full h-2/3">
		<div
			class="review-contents-box flex flex-col justify-center items-center w-full h-full bg-white">
			<div
				class="flex flex-col justify-center items-center w-11/12 h-5/6 text-[2.3rem] rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500">
				<textarea class="review-contents w-11/12 h-5/6 mt-10 leading-[4rem]"
					id="review-textarea" rows="4" cols="50"></textarea>
				<div class="flex w-full h-1/6 justify-end">
					<div class="h-1/6 mt-4">
						<p class="text-[2.1rem] font-bold mr-10">
							<span class="review-count">0</span> / 200
						</p>
					</div>
					<div
						class="flex justify-end items-end w-1/3 h-1/6 text-[1.5rem] font-bold mt-10">
						<button
							class="review-reg-btn w-1/2 bg-[rgba(38,40,61,1)] mr-5 text-white rounded-3xl">완료</button>
						<button
							class="review-cancel-btn w-1/2 bg-[rgba(245,246,250,1)] mr-5 rounded-3xl text-black">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</dialog>

	<!-- 서평 수정용 dialog  -->
	<dialog
		class="review-update-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-4/6 bg-white">
	<div class="flex flex-col w-full h-1/4 justify-center items-center ">
		<div
			class="review-book-box  flex sticky justify-center items-center px-10 mt-10 rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-full">
			<div class="w-full h-full flex">
				<div class="flex justify-center items-center ml-10 w-1/3 h-full">
					<img class="review-thumbnail object-fit w-48 h-72" alt="" src="">
					<input hidden class="r-no">
				</div>
				<div
					class="relative flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]">
					<div
						class="w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3">
						<span class="review-title w-full"> </span>
						<div class="w-1/4 h-full flex justify-center"></div>
					</div>
					<div class="text-[2rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
						<span class="review-authors"></span>
					</div>
					<div class="w-11/12 h-1/3">
						<div class="h-1/6 text-[1.7rem] font-bold">
							<span class="review-date"><fmt:formatDate value=""
									pattern="yyyy-MM-dd" /> </span>
						</div>
						<div class="h-1/6 text-[2rem] font-bold mt-4">
							<label for="r-type1">추천</label> <input disabled type="radio"
								id="r-type1" class="w-[1.8rem] h-[1.8rem] ml-2" name="r_type"
								value="1"> <label class="ml-10" for="r-type2">비추천</label>
							<input disabled type="radio" class="w-[1.8rem] h-[1.8rem] ml-2"
								id="r-type2" name="r_type" value="2">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="flex justify-center items-center w-full h-2/3">
		<div
			class="review-contents-box flex flex-col justify-center items-center w-full h-full bg-white">
			<div
				class="flex flex-col justify-center items-center w-11/12 h-5/6 text-[2.3rem] rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500">
				<textarea disabled
					class="review-contents w-11/12 h-5/6 mt-10 leading-[4rem]"
					id="review-textarea" rows="4" cols="50"></textarea>
				<div class="flex w-full h-1/6 justify-end">
					<div class="h-1/6 mt-4">
						<p class="text-[2.1rem] font-bold mr-10">
							<span class="review-count">0</span> / 200
						</p>
					</div>
					<div
						class="flex justify-end items-end w-1/3 h-1/6 text-[1.5rem] font-bold mt-10">
						<button
							class="review-update-open w-1/2 bg-[rgba(38,40,61,1)] mr-5 text-white rounded-3xl">수정</button>
						<button
							class="review-update-exit w-1/2 bg-[rgba(245,246,250,1)] mr-5 rounded-3xl text-black">취소</button>
						<button
							class="review-update-btn w-1/2 bg-[rgba(38,40,61,1)] mr-5 text-white rounded-3xl">확인</button>
						<button
							class="review-update-cancel w-1/2 bg-[rgba(245,246,250,1)] mr-5 rounded-3xl text-black">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</dialog>

	<!-- 서평 작성 취소용 dialog  -->
	<dialog
		class="review-cancel-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center rounded-[60px] w-11/12 h-1/2 mt-20 bg-white">
			<span class="text-[2.5rem] font-bold">서평 작성을 중단하시겠습니까?</span> <span
				class="text-[2.5rem] font-bold">(작성된 내용은 저장되지 않습니다)</span>
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="review-cancel-no bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
			<button
				class="review-cancel-yes bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
		</div>
	</div>
	</dialog>

	<!-- 서평 type 안정했을 떄 정하게하는 dialog  -->
	<dialog
		class="review-alert-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center rounded-[60px] w-11/12 h-1/2 mt-32 bg-white">
			<span class="text-[2.5rem] font-bold">추천여부를 선택해주세요</span>
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="review-alert-close bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
		</div>
	</div>
	</dialog>
</body>
<script type="text/javascript">
let review_modal = document.querySelector('.review-modal');
let review_update_modal = document.querySelector('.review-update-modal');
let review_cancel_modal = document.querySelector('.review-cancel-modal');
let review_alert_modal = document.querySelector('.review-alert-modal');

// 페이지 로드될 때, 서평이 있을 경우 서평보기 버튼이, 서평이 없을경우 서평쓰기 버튼이 나오게
document.addEventListener("DOMContentLoaded", function() {
	let br_boxes = document.querySelectorAll('.br-box');
	
br_boxes.forEach(function(br_box){
	let r_b_no = br_box.querySelector('.b-no').value;
	let open_btn_box = br_box.querySelector('.open-btn-box');
	let update_btn_box = br_box.querySelector('.update-btn-box');
	
	$.ajax({
		url : "reviewCheck.do",
		data : {
			r_b_no
		},
		success : function(data) {
			console.log('ajax는 돌아간듯');
			if(data == 1){
                update_btn_box.style.display = 'flex';
                open_btn_box.style.display = 'none';
            } else {
                update_btn_box.style.display = 'none';
                open_btn_box.style.display = 'flex';
			}
		}
	}); // ajax end
}); // foreach end
}); // eventlistener end


$(function() {
	
	// 서평쓰기 버튼 누를 때 모달 열리고 각 칸에 값 실어주기
	$('.review-open-btn').click(function() {
		let br_box = $(this).closest('.br-box');
		let r_b_no = br_box.find('.b-no').val();
		let b_title = br_box.find('.b-title').val();
		let b_authors = br_box.find('.b-authors').val();
		let b_thumbnail = br_box.find('.b-thumbnail').val();
		let br_date = br_box.find('.br-date').val();
		
		let review_book_box = review_modal.querySelector('.review-book-box');
        let review_thumbnail = review_book_box.querySelector('.review-thumbnail');
        let review_title = review_book_box.querySelector('.review-title');
        let review_authors = review_book_box.querySelector('.review-authors');
        let review_date = review_book_box.querySelector('.review-date');
		let review_book_no = review_book_box.querySelector('.r-b-no');
        
        review_thumbnail.src = b_thumbnail;
        if(b_title.length >= 12){
        	review_title.textContent = b_title.substr(0, 12) + '...';
        } else {
        review_title.textContent = b_title;
        }
        review_authors.textContent = b_authors.replace("!", ", ");
        review_date.textContent = br_date;
        review_book_no.value = r_b_no;
       	
        
        review_modal.showModal();	
	});
	
	// update용 modal 기능
	$('.review-update-btn').click(function(){
		let br_box = $(this).closest('.br-box');
		let r_b_no = br_box.find('.b-no').val();
		
		
		let review_book_box = review_update_modal.querySelector('.review-book-box');
        let review_thumbnail = review_book_box.querySelector('.review-thumbnail');
        let review_title = review_book_box.querySelector('.review-title');
        let review_authors = review_book_box.querySelector('.review-authors');
        let review_date = review_book_box.querySelector('.review-date');
		let review_no = review_book_box.querySelector('.r-no');
		let review_contents = review_update_modal.querySelector('.review-contents');
		
		let review_update_open = review_update_modal.querySelector('.review-update-open');
		let review_update_exit = review_update_modal.querySelector('.review-update-exit');
		let review_update_btn = review_update_modal.querySelector('.review-update-btn');
		let review_update_cancel = review_update_modal.querySelector('.review-update-cancel');
		
		$.ajax({
			url : "getReviewbyNo.do",
			data : {
				r_b_no
			},
			success : function(data) {
				console.log('ajax는 돌아간듯');

				review_thumbnail.src = data.b_thumbnail;
				
				// 12자 이상일 경우 칸에 맞게 자르기
				if(data.b_title.length >= 12){
			       	review_title.textContent = data.b_title.substr(0, 12) + '...';
			       } else {
			       review_title.textContent = data.b_title;
			       }
				
			    review_authors.textContent = data.b_authors.replace("!", ", ");
			    
				
			    // json으로 받아온 br_date값 yyyy-MM-dd로 포매팅
			    let br_date = data.br_date;
			    
			    let format_date = new Date(br_date);
			    let year = format_date.getFullYear(); // 년도
			    let month = ('0' + (format_date.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 +1 필요)
			    let day = ('0' + format_date.getDate()).slice(-2); // 일

			    let formatted_br_date = year + '-' + month + '-' + day;
			    review_date.textContent = formatted_br_date;
			    
			    // json으로 받아온 r_type의 값에 맞는 곳에 checked 설정
			    let review_type = review_book_box.querySelector('input[name="r_type"][value="' + data.r_type  + '"]');
			    review_type.checked = true;
			    
			    review_no.value = data.r_no;
			    review_contents.value = data.r_contents.replaceAll('<br>', '\n');
			    
			}
		}); // ajax end
		
		review_update_open.style.display = 'inline-block';
	    review_update_exit.style.display = 'inline-block';
	    review_update_btn.style.display = 'none';
	    review_update_cancel.style.display = 'none';
	    
		review_update_modal.showModal();
	}); // click end
	
	$('.review-update-cancel').click(function(){
		review_cancel_modal.showModal();
	});
		
	
	
	// 취소 버튼 누를 때, 취소 확인 모달 띄우기
	$('.review-cancel-btn').click(function() {
		review_cancel_modal.showModal();
	});
	
	$('.review-cancel-no').click(function(){
		review_cancel_modal.close();
	});
	
	$('.review-cancel-yes').click(function(){
		review_cancel_modal.close();
		review_modal.close();
		review_update_modal.close();
	});
	
	
	// 확인 버튼 누를 때, 리뷰 등록
	$('.review-reg-btn').click(function(){
		let review_book_box = review_modal.querySelector('.review-book-box');
		let review_book_no = review_book_box.querySelector('.r-b-no');
		let review_type = review_book_box.querySelector('input[name="r_type"]:checked');
		let review_type_value = review_type ? review_type.value : -1; // 선택된 경우에만 값을 가져오도록 변경

		let review_contents_box = review_modal.querySelector('.review-contents-box');
		let review_contents = review_contents_box.querySelector('.review-contents');
		
		//review_contents의 value에서 띄어쓰기를 br로 처리
		let r_contents = encodeURIComponent(review_contents.value.replaceAll(/\n/g, '<br>'));
		
		if(review_type_value == -1){
			review_alert_modal.showModal();
		} else {
			location.href='regReview.do?r_b_no=' + review_book_no.value + '&r_contents=' + r_contents + '&r_type=' + review_type_value;
		}
		
	});
	
	$('.review-alert-close').click(function(){
		review_alert_modal.close();
	});
	
	$('.review-update-exit').click(function(){
		review_update_modal.close();
	});
	
	$('.review-update-open').click(function(){
		let review_book_box = review_update_modal.querySelector('.review-book-box');
		let review_contents_box = review_update_modal.querySelector('.review-contents-box');
		let review_contents = review_contents_box.querySelector('.review-contents');
		let review_types = review_book_box.querySelectorAll('input[name="r_type"]');
		
		let review_update_open = review_update_modal.querySelector('.review-update-open');
		let review_update_exit = review_update_modal.querySelector('.review-update-exit');
		let review_update_btn = review_update_modal.querySelector('.review-update-btn');
		let review_update_cancel = review_update_modal.querySelector('.review-update-cancel');
		
		review_types.forEach(function(review_type){
			review_type.removeAttribute('disabled');
		});
		
		review_contents.removeAttribute('disabled');
		
		review_update_open.style.display = 'none';
	    review_update_exit.style.display = 'none';
	    review_update_btn.style.display = 'inline-block';
	    review_update_cancel.style.display = 'inline-block';
	});
	
	$('.review-update-btn').click(function(){
		let review_book_box = review_update_modal.querySelector('.review-book-box');
		let review_no = review_book_box.querySelector('.r-no');
		let review_type = review_book_box.querySelector('input[name="r_type"]:checked');
		let review_contents = review_update_modal.querySelector('.review-contents');
		
		// 줄 바꿈 예외처리
		let r_contents = encodeURIComponent(review_contents.value.replaceAll(/\n/g, '<br>'));
		
		location.href='updateReview.do?r_no=' + review_no.value + '&r_contents=' + r_contents + '&r_type=' + review_type.value;
	});
	
}); // ready end

// js로 글자수 세기 및 200자 넘으면 못쓰게 하기

let textareas = document.querySelectorAll('.review-contents');
let review_counts = document.querySelectorAll('.review-count');
let max_review_count = 200; // 최대 글자 수 제한
        
textareas.forEach((textarea, i) => {
	
textarea.addEventListener('input', function() {
   let cur_review_count = textarea.value.length;
   review_counts[i].textContent = cur_review_count;
      
   if (cur_review_count > max_review_count) {
	  // 글자 수 제한 초과 시 처리
       textarea.value = textarea.value.substring(0, max_review_count);
       review_counts[i].style.color = 'red';
       review_counts[i].textContent = cur_review_count - 1;
   } else {
   		review_counts[i].style.color = 'black';
   }
});
});
        
        
</script>
</html>
