<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="flex flex-col w-full">
		<div id="form"
			class="block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6 bg-white ml-10 mb-10">
			<form action="userUpdate.go" class="h-full">
				<div class="w-full h-full flex">
					<div
						class="img-box flex justify-center items-center ml-10 w-1/4 h-full">
						<img class="object-fit" alt="" src="imgs/default_user.png">
					</div>
					<div
						class="flex flex-col justify-start items-start pl-5 w-3/4 h-full">
						<div class="text-[3rem] font-bold pt-2 h-1/3">
							<span>책제목</span>
						</div>
						<div class="text-[2rem] font-bold h-1/3 text-[rgba(38,40,61,0.5)]">
							<span>작가이름</span>
						</div>
						<div class="h-1/6 text-[2rem] font-bold">
							<span>읽은 날짜</span>
						</div>
						<div
							class="flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
								<button class="w-1/4 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">서평쓰기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>