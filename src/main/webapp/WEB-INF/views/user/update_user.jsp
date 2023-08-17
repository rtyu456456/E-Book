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
		<img class="w-1/4" alt="" src="imgs/default_user.png">
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
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">이름 | </span>
						</div>
						<div class="w-2/3">
							<input class="w-5/6 text-black text-center bg-[#F5F6FA]" name="u_name"
								value="참새경찰">
						</div>
					</div>
				</div>

				<!-- age div  -->
				<div id="u-name-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">나이 | </span>
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
				<div id="u-achieve-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/4">
							<span class="text-black">등급 | </span>
						</div>
						<div class="w-3/4">
							<select class="w-11/12 text-black text-center bg-[#F5F6FA]"
								name="u_age">
								<option value="10">작심삼일 탈출</option>
								<option value="20">신참 책벌레</option>
								<option value="30">베이커가 이웃주민</option>
							</select>
						</div>
					</div>
				</div>

				<!-- PW div  -->
				<div id="u-pw-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]">비밀번호 | </span>
						</div>
						<div class="w-2/3">
							<input type="password" class="w-5/6 text-black text-center bg-[#F5F6FA]" name="u_pw">
						</div>
					</div>
				</div>

				<div id="u-pw-div"
					class="flex flex-row justify-center items-center text-center">
					<div
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
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
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
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
						class="flex flex-row items-center h-[6.5rem] mt-10 w-3/4 rounded-3xl border=none border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<div class="w-1/3">
							<span class="text-black text-[2.2rem]"> 프로필 사진 변경 </span> 
						</div>
							<span> | </span>
						<div class="w-2/3">
							<input type="file" id="u-profile-input" hidden class="w-1/2 text-black rounded- text-center bg-[#F5F6FA]" name="u_profile">
							<label for="u-profile-input">사진 선택</label>
						</div>
					</div>
				</div>

			</div>
				<div id="confirm-cancel" class="flex w-full h-[49rem] justify-end items-end">
					<button
						class="bg-[rgba(38,40,61,1)] w-1/4 h-[6.5rem] rounded-tl-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">취소</button>
					<button
						class="bg-[rgba(38,40,61,1)] w-1/4 h-[6.5rem] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">확인</button>
				</div>
		</form>
	</div>
</body>
</html>