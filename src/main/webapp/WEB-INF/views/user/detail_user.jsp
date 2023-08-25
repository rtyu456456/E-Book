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
		<img class="w-1/4" alt="" src="imgs/default_user.png">
	</div>
	<div id="form"
		class="flex flex-col rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner
 shadow-slate-500 w-11/12 h-5/6 bg-white ml-10 mt-28">
		<form action="userUpdate.go">

			<div id="profile-img" class="w-full h-[12rem]"></div>
			<div id="info-div" class="flex flex-col w-full h-96">
				<!-- ID div  -->
				<div id="u-id-div"
					class="flex flex-row block justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">ID | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">rtyu456456</span>
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
							<span class="text-black">참새경찰</span>
						</div>
					</div>
				</div>

				<!-- PW div  -->
				<div id="u_pw_div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">등급 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">신참 책벌레</span>
						</div>
					</div>
				</div>

				<!-- PW check div  -->
				<div id="u_pw_check_div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">성별 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">남</span>
						</div>
					</div>
				</div>

				<!-- PW check div  -->
				<div id="u_pw_check_div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-28 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">나이 | </span>
						</div>
						<div class="w-3/4">
							<span class="text-black">20대</span>
						</div>
					</div>
				</div>

				<!-- reguser div  -->
				<div id="del" class="flex w-full justify-center mt-10">
					<div class="w-1/2 text-center">
						<a class="" href="deluser.go" class=""> <span
							class="text-[2.3rem] font-bold text-[rgba(38,40,61,0.5)] border-b border-b-black">
								회원탈퇴 </span>
						</a>
					</div>
					<div class="w-1/2 text-center">
						<a class="w-1/2" href="logout.go" class=""> <span
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
</body>
</html>