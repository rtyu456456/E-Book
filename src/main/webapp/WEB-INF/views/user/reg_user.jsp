<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex justify-center items-center h-screen bg-[#F5F6FA]">
		<div id="form"
			class="block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner
 shadow-slate-500 w-11/12 h-4/6 bg-white">
			<form action="reguser.do">
				<div class="flex w-full justify-center items-center mt-32 mb-20">
					<img class="object-cover w-1/2 h-auto" alt="" src="imgs/logo.png">
				</div>

				<!-- ID div  -->
				<div id="u_id_div" class="flex flex-row justify-center items-center">
					<div
						class="flex flex-row justify-center items-center h-24 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="text-[rgba(38,40,61,0.5)]">아이디</span> <input
							name="u_id" id="u_id"
							class="text-center bg-[#F5F6FA] text-[rgba(38,40,61,0.5)] w-2/3 ml-4">
					</div>
				</div>

				<!-- nickname div  -->
				<div id="u_name" class="flex flex-row justify-center items-center">
					<div
						class="flex flex-row justify-center items-center h-24 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="text-[rgba(38,40,61,0.5)]">닉네임</span> <input
							name="u_name" id="u_name"
							class="text-center bg-[#F5F6FA] text-[rgba(38,40,61,0.5)] w-2/3 ml-4">
					</div>
				</div>

				<!-- PW div  -->
				<div id="u_pw_div" class="flex flex-row justify-center items-center">
					<div
						class="flex flex-row justify-center items-center h-24 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="text-[rgba(38,40,61,0.5)]">비밀번호</span> <input
							type="password" name="u_pw" id="u_pw"
							class="text-center text-[3rem] bg-[#F5F6FA] text-[rgba(38,40,61,0.5)] w-7/12 ml-7">
					</div>
				</div>

				<!-- PW check div  -->
				<div id="u_pw_check_div"
					class="flex flex-row justify-center items-center">
					<div
						class="flex flex-row justify-center items-center h-24 mt-10 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="text-[rgba(38,40,61,0.5)]">비밀번호 확인</span> <input
							type="password" name="u_pw_check" id="u_pw_check"
							class="text-center text-[3rem] bg-[#F5F6FA] text-[rgba(38,40,61,0.5)] w-1/2 ml-7 mask-circle">
					</div>
				</div>

				<!-- gender div  -->
				<div id="u_gender_div" class="flex justify-center items-center">
					<div
						class="flex justify-start items-center space-x-20 h-24 mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="pl-[1rem] mr-[3rem] text-[rgba(38,40,61,0.5)]">성별</span> <label>
							<span class="text-[rgba(38,40,61,0.5)]"> 남 </span> <input
							type="radio" name="u_gender" id="u_gender_m" class="w-10 h-10"
							value="male">
						</label> <label> <span class="text-[rgba(38,40,61,0.5)]"> 여
						</span> <input type="radio" name="u_gender" id="u_gender_f"
							class="w-10 h-10" value="female">
						</label>
					</div>
				</div>


				<!-- age div  -->
				<div id="u_age_div"
					class="flex flex-row justify-center items-center">
					<div
						class="flex justify-start items-center space-x-30 h-24 mt-12 w-3/4 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500">
						<span class="pl-[1rem] mr-[1rem] text-[rgba(38,40,61,0.5)]">나이</span> <select
							class="w-2/3 bg-[#F5F6FA] ml-[2rem] text-center text-[rgba(38,40,61,0.5)]"
							name="u_age" id="u_age">
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
				<div id="reg" class="flex w-full h-[14rem] justify-end items-end">
					<button
						class="bg-[rgba(38,40,61,1)] w-1/2 h-[8rem] rounded-tl-[60px] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>