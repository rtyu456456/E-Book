<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<div class="flex justify-center items-center h-screen bg-[#F5F6FA]">
		<div id="form"
			class="block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner
 shadow-slate-500 w-11/12 h-2/5 bg-white">
			<form action="login.do">
				<div class="flex w-full justify-center items-center mt-24 mb-10">
					<img class="object-cover w-1/2 h-auto" alt="" src="imgs/logo.png">
				</div>

				<!-- ID div  -->
				<div id="u_id" class="flex flex-row justify-center items-center">
					<input name="u_id" id="u_id"
						class="h-24 mt-10 w-2/3 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500"
						placeholder="아이디">
				</div>
				
				<!-- PW div  -->
				<div id="u_pw" class="flex flex-row justify-center items-center">
					<input type="text" name="u_pw" id="u_pw"
						class="h-24 mt-12 w-2/3 rounded-3xl border border-slate-300 text-[2.7rem] font-bold pl-2 bg-[#F5F6FA] outline-blue-600 shadow-md shadow-slate-500"
						placeholder="비밀번호">
				</div>
				
				<!-- reguser div  -->
				<div id="reg" class="flex w-5/6 justify-end mt-3">
					<div class="">
						<a class="" href="reguser.go" class=""> <span
							class="text-[2rem] font-bold text-[rgba(38,40,61,0.5)]">
								회원가입 </span>
						</a>
					</div>
				</div>
				
				<!-- login div  -->
				<div id="login" class="flex w-full h-[14rem] justify-end items-end mt-4">
					<button class="bg-[rgba(38,40,61,1)] w-1/2 h-[8rem] rounded-tl-[60px] rounded-br-[60px] mr-0 text-[3rem] font-bold text-[#FFFFFF]">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>