<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<form action="login.go">
				<button>로그인 페이지로 이동</button>
			</form>
		</div>
		<div>
			<form action="calendar.go">
				<button>달력으로 이동</button>
			</form>
		</div>
		<div>
			<form action="reguser.go">
				<button>유저등록으로 이동</button>
			</form>
		</div>
		<div>
			<img alt="" src="imgs/logo.png">
		</div>
		<div>
			<form action="getbook.do">
				<input name="b_title">
				<button>검색</button>
			</form>
		</div>

		<c:forEach items="${books }" var="b">
			<div class="book">
				<div class="book-title">${b.b_title }</div>
				<div class="book-authors">${b.b_authors }</div>
				<div class="book-publisher">${b.b_publisher }</div>
				<div>
					<img alt="" src="${b.b_thumbnail }">
				</div>
				<input hidden class="b-title" value="${b.b_title }"> <input
					hidden class="b-authors" value="${b.b_authors }"> <input
					hidden class="b-publisher" value="${b.b_publisher }"> <input
					hidden class="b-price" value="${b.b_price }"> <input hidden
					class="b-url" value="${b.b_url }"> <input hidden
					class="b-isbn" value="${b.b_isbn }"> <input hidden
					class="b-thumbnail" value="${b.b_thumbnail }"> <input
					hidden class="b-contents" value="${b.b_contents }">
			</div>
		</c:forEach>

		<div class="book-container">
			<div>b_no : ${book.b_no }</div>
			<div>
				<img alt="" src="${book.b_thumbnail }">
			</div>
			<div>제목 : ${book.b_title }</div>
			<div>작가 : ${book.b_authors }</div>
			<div>출판사 : ${book.b_publisher }</div>
			<div>정가 : ${book.b_price }</div>
			<div>페이지 : ${book.b_page }</div>
			<div>내용 : ${book.b_contents }</div>
			<div>상세페이지 : ${book.b_url }</div>
			<div>isbn : ${book.b_isbn }</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	let books = document.querySelectorAll('.book');
	
	books.forEach((book) => {
		book.addEventListener("click", function(){
			let b_title = encodeURI(book.querySelector(".b-title").value);
			let b_authors = encodeURI(book.querySelector(".b-authors").value);
			let b_publisher = encodeURI(book.querySelector(".b-publisher").value);
			let b_thumbnail = encodeURI(book.querySelector(".b-thumbnail").value);
			let b_price = encodeURI(book.querySelector(".b-price").value);
			let b_isbn = encodeURI(book.querySelector(".b-isbn").value);
			let b_contents = encodeURI(book.querySelector(".b-contents").value);
			
			let b_url = encodeURIComponent(book.querySelector(".b-url").value);
			console.log(b_url);

			
			location.href="getbook.detail?b_title=" + b_title + "&b_authors=" + b_authors +
					"&b_publisher=" + b_publisher + "&b_thumbnail=" + b_thumbnail + "&b_price="
					+ b_price + "&b_url=" + b_url + "&b_isbn=" + b_isbn + "&b_contents=" +  b_contents;
			
		}); // eventListener end
	}); // forEach end
	
</script>
</html>