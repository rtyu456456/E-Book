	//페이지 로드 시에 Local Storage에서 입력 값을 읽어와서 적용하는 함수
	function loadInputsFromLocalStorage() {
		const t_title = localStorage.getItem('t_title');
		const t_book_title = localStorage.getItem('t_book_title');
		const t_authors = localStorage.getItem('t_authors');
		const t_publisher = localStorage.getItem('t_publisher');
		const t_price = localStorage.getItem('t_price');

		document.getElementsByName('t_title')[0].value = t_title;
		document.getElementsByName('t_book_title')[0].value = t_book_title;
		document.getElementsByName('t_authors')[0].value = t_authors;
		document.getElementsByName('t_publisher')[0].value = t_publisher;
		document.getElementsByName('t_price')[0].value = t_price;
	}

	// 페이지 로드 시에 Local Storage에서 값 불러오기
	window.onload = function() {
		loadInputsFromLocalStorage();
	}