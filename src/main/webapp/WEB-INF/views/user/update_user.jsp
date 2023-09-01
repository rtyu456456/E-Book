<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="flex absolute w-full justify-center items-center">
		<img class="w-[18rem] h-[18rem]" alt="" src="${sessionScope.user.u_profile }">
	</div>
	<div id="form"
		class="flex flex-col rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner
 shadow-slate-500 w-11/12 h-5/6 bg-white ml-10 mt-28">
		<form action="userUpdate.do" method="post" enctype="multipart/form-data">

			<div id="profile-img" class="w-full h-[10rem]"></div>
			<div id="info-div" class="flex flex-col w-full h-96">

				<!-- nickname div  -->
				<div id="u-name-div"
					class="flex flex-row block justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-16 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">이름 | </span>
						</div>
						<div class="w-2/3">
							<input class="w-5/6 text-black text-center bg-[#F5F6FA]" name="u_name"
								value="${sessionScope.user.u_name }">
						</div>
					</div>
				</div>

				<!-- age div  -->
				<div id="u-age-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">나이 | </span>
							<input hidden class="u-old-age" name="u_old_age" value="${sessionScope.user.u_age }">
						</div>
						<div class="w-2/3">
							<select class="w-5/6 text-black text-center bg-[#F5F6FA]"
								name="u_age">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대</option>
								<option value="50">50대</option>
								<option value="60">60대</option>
								<option value="70">70대</option>
								<option value="80">80대</option>
								<option value="90">90대</option>
							</select>
						</div>
					</div>
				</div>


				<!-- PW div  -->
				<div id="u-pw-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]">비밀번호 | </span>
						</div>
						<div class="w-2/3">
							<input type="password" class="w-5/6 text-black text-center bg-[#F5F6FA]" name="u_old_pw">
						</div>
					</div>
				</div>

				<div id="u-new-pw-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]">새 비밀번호 | </span>
						</div>
						<div class="w-2/3">
							<input type="password" class="w-5/6 text-black text-center bg-[#F5F6FA]" name="u_pw">
						</div>
					</div>
				</div>

				<!-- PW check div  -->
				<div id="u-pwcheck-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]">비밀번호 <br> 확인</span> 
						</div>
							<span> | </span>
						<div class="w-2/3">
							<input type="password" class="w-511/12 text-black text-center bg-[#F5F6FA]" name="u_pw">
						</div>
					</div>
				</div>

				<!-- u_profile div  -->
				<div id="u-profile-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-12 w-3/4 rounded-3xl border=none border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]"> 프로필 사진 변경 </span> 
						</div>
							<span> | </span>
						<div class="w-2/3">
							<input type="file" id="u-profile-input" hidden class="w-1/2 text-black rounded- text-center bg-[#F5F6FA]" name="u_file">
							<label for="u-profile-input">사진 선택</label>
						</div>
						<input hidden name="u_profile" value="${sessionScope.user.u_profile }">
					</div>
				</div>

			</div>
				<div id="confirm-cancel" class="flex w-full h-[49rem] justify-end items-end">
					<button
						class="update-cancel bg-[rgba(38,40,61,1)] w-1/4 h-[6.5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
					<button
						class="update-go bg-[rgba(38,40,61,1)] w-1/4 h-[6.5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
				</div>
		</form>
	</div>
	
	<!-- 수정취소용 모달 -->
	<dialog
		class="update-cancel-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center rounded-[60px] w-11/12 h-1/2 mt-20 bg-white">
			<span class="text-[2.5rem] font-bold">수정사항을 취소하시겠습니까?</span> <span
				class="text-[2.5rem] font-bold">변경사항은 저장되지 않습니다.</span>
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="update-cancel-no bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
			<button
				class="update-cancel-yes bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
		</div>
	</div>
	</dialog>
	
	<!-- 비밀번호 불일치 modal -->
	<dialog
		class="wrong-pw-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center rounded-[60px] w-11/12 h-1/2 mt-20 bg-white">
			<span class="text-[2.5rem] font-bold">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="wrong-pw-confirm bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
		</div>
	</div>
	</dialog>
</body>
<script>
  // 페이지 로딩이 완료되면 실행되는 함수
  window.addEventListener('DOMContentLoaded', function () {
    // sessionScope.user.u_age 값을 가져옵니다.
    let u_old_age = document.querySelector(".u-old-age").value;

    // select 요소를 찾습니다.
    var age_select_box = document.querySelector('select[name="u_age"]');

    // select 요소 내의 모든 option 요소를 순회하며 선택 여부를 결정합니다.
    for (var i = 0; i < age_select_box.options.length; i++) {
      let age_option = age_select_box.options[i];

      // option의 value와 selectedAge가 일치하면 selected 속성을 추가합니다.
      if (age_option.value === u_old_age) {
        age_option.selected = true;
      }
    }
  });
  
$(function() {
	let update_cancel_modal = document.querySelector('.update-cancel-modal');
	
	$('.update-cancel').click(function(e){
		e.preventDefault();
		
		update_cancel_modal.showModal();
	});
	
	$('.update-cancel-yes').click(function(){
		location.href="usermain"
	});
	
	$('.update-cancel-no').click(function(){
		update_cancel_modal.close();
	});
	
	
	
}); //ready end
</script>
</html>