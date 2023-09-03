<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	overflow: hidden;
}

body * {
	touch-action: none;
}
</style>
</head>
<body>
	<div class="flex absolute w-full justify-center items-center">
		<img class="w-[18rem] h-[18rem]" alt="" src="${sessionScope.user.u_profile }">
	</div>
	<div id="form"
		class="flex flex-col rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner
 shadow-slate-500 w-11/12 h-5/6 bg-white ml-10 mt-28">
		<form action="userUpdate.go">

			<div id="profile-img" class="w-full h-[12rem]"></div>
			<div id="info-div" class="flex flex-col w-full h-96">
			
			<!-- blank div  -->
				<div id="blank-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4">
					</div>
				</div>
				<!-- ID div  -->
				<div id="u-id-div"
					class="flex flex-row block justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">ID | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">${sessionScope.user.u_id }</span>
						</div>
					</div>
				</div>

				<!-- nickname div  -->
				<div id="u_name"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">이름 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">${sessionScope.user.u_name }</span>
						</div>
					</div>
				</div>


				<!-- gender check div  -->
				<div id="u_gender_check_div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">성별 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">${sessionScope.user.u_gender }</span>
						</div>
					</div>
				</div>

				<!-- age check div  -->
				<div id="u_age_check_div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">나이 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">${sessionScope.user.u_age }</span>
						</div>
					</div>
				</div>

				<!-- del user div  -->
				<div class="flex w-full justify-center mt-10">
					<div class="w-1/2 text-center">
						<a class="del-user-confirm" class=""> <span
							class="text-[2.3rem] font-bold text-[rgba(38,40,61,0.5)] border-b border-b-black">
								회원탈퇴 </span>
						</a>
					</div>
					<div class="w-1/2 text-center">
						<a class="logout-confirm w-1/2" class=""> <span
							class="text-[2.3rem] font-bold text-[rgba(38,40,61,0.5)]  border-b border-b-black">
								로그아웃 </span>
						</a>
					</div>
				</div>
			</div>



			<!-- login div  -->
			<div id="update-user"
				class="flex w-full h-[46rem] justify-end items-end mt-4">
				<button
					class="bg-[rgba(38,40,61,1)] w-5/12 h-[8rem] rounded-tl-[60px] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">정보수정</button>
			</div>
		</form>
	</div>

	<!-- logout용 modal -->
	<dialog
		class="logout-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center rounded-[60px] w-11/12 h-1/2 mt-20 bg-white">
			<span class="text-[2.5rem] font-bold">로그아웃 하시겠습니까?</span>
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="logout-cancel bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
			<button
				class="logout-yes bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
		</div>
	</div>
	</dialog>

	<!-- 탈퇴용 modal -->
	<dialog
		class="del-user-modal rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/4">
	<div class="w-full h-full flex flex-col justify-center items-center">
		<div
			class="flex flex-col justify-center items-center rounded-[60px] w-11/12 h-1/2 mt-20 bg-white">
			<span class="text-[2.5rem] font-bold">탈퇴 하시겠습니까? 모든 기록이 삭제됩니다.</span>
			<span class="text-[2.5rem] font-bold">탈퇴하시려면 비밀번호를 입력하세요.</span> <input
			 type="password" class="del-pw h-24 mt-10 w-2/3 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
		</div>
		<div class="flex w-full h-1/2 justify-end items-end pt-20">
			<button
				class="del-user-cancel bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
			<button
				class="del-user-yes bg-[rgba(38,40,61,1)] w-1/4 h-[5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
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
<script type="text/javascript">
	let logout_modal = document.querySelector(".logout-modal");
	let del_user_modal = document.querySelector(".del-user-modal");
	let wrong_pw_modal = document.querySelector(".wrong-pw-modal")
	$(function() {

		$('.logout-confirm').click(function() {

			logout_modal.showModal();
		});

		$('.logout-cancel').click(function() {

			logout_modal.close();
		});

		$('.logout-yes').click(function() {
			location.href = 'logout.go';
		});

		$('.del-user-confirm').click(function() {
			del_user_modal.showModal();
		});

		$('.del-user-cancel').click(function() {
			del_user_modal.close();
		});

		$('.wrong-pw-confirm').click(function() {
			wrong_pw_modal.close();
			del_user_modal.close();
		});

		$('.del-user-yes').click(function() {
			let del_pw = del_user_modal.querySelector('.del-pw');
			console.log(del_pw.value);

			$.ajax({
				type : 'post',
				url : "pwCheck.do",
				data : {
					u_pw : del_pw.value
				},
				success : function(data) {
					console.log('ajax는 돌아간듯');
					if (data == 1) {
						location.href = "delUser.do";
					} else {
						console.log('비밀번호 불일치');
						wrong_pw_modal.showModal();
					}

				}
			}); // ajax end

		});

	}); // ready end
</script>
</html>