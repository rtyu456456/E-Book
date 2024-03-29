<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						class="relative flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]">
								<a onclick="delWish(${br.lr_no})"> <img class="absolute object-fit w-12 h-18 top-0 right-12" alt=""
									src="imgs/logo_icon.png">
								</a>
						<div
							class="w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3">
							<span> 
							<c:choose>
								<c:when test="${fn:length(br.b_title) > 12}">
   									${fn:substring(br.b_title, 0, 12)}...
            					</c:when>
								<c:otherwise>
               						 ${br.b_title}
            					</c:otherwise>
							</c:choose>
						</span>
							<div class="w-1/4 h-full flex justify-center">
							</div>
						</div>
						<div
							class="text-[1.7rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4">
							<span>${br.b_authors.replace("!", ", ") }</span>
						</div>
						<div class="w-11/12 h-1/3">
						</div>
						<div
							class="flex justify-end items-end w-full h-1/6 text-[2rem] font-bold ">
							<div
								class="flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold">
								<button onclick="regIngWish(${br.b_no }, ${br.lr_no })"
									class="reg-ing w-1/6 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl">책
									읽기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>