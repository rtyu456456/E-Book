/*사이드 메뉴 창*/
$(function() {
	let menu = document.querySelector('.menu-gh img');
	let dialog = document.querySelector('#menu-dialog');
	menu.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
	})
});

/*책갈피 끼우기*/
$(function() {
	let num = 0;
	let bookmarkImg = [ "/img/logo_bookmark_empty.png",
			"/img/logo_bookmark.png" ];
	$("#bookmarkGH").click(function() {
		if (num == 1) {
			num = 0;
			jQuery("#logoGH").show();
		} else {
			num++;
			jQuery("#logoGH").hide();
		}
			$(this).attr("src", bookmarkImg[num]);
		});
		
sortItems();
likeFunc();
});



/*서평 정렬*/

function sortItems() {
		let doms = $('.review-list-gh').clone();
		$("#order-selector").change(function(e) {
			let selectedOption = this.value;
			let sortedDoms;

			if (selectedOption === 'recent') {
				sortedDoms = sortDomsByDate(doms);
			} else if (selectedOption === 'like') {
				sortedDoms = sortDomsByLikes(doms);
			}

			// 정렬된 DOM 객체들을 화면에 표시
			$('.detail-review-box').html(sortedDoms);
		});
		function sortDomsByDate(doms) {
			// DOM 객체를 날짜에 따라 정렬하는 함수
			return doms.sort(function(a, b) {
				let dateA = parseDate($(a).find('.detail-date-gh').text());
				let dateB = parseDate($(b).find('.detail-date-gh').text());
				return dateB - dateA;
			});
		}
		function parseDate(dateString) {
			// dateString을 파싱하여 JavaScript Date 객체로 변환
			// 이 예제에서는 단순히 문자열을 Date 객체로 변환하는 예시이며,
			// 실제 날짜 형식에 따라 파싱 방식을 조정해야 할 수 있습니다.
			return new Date(dateString);
		}
		function sortDomsByLikes(doms) {
			// 좋아요 순서에 따라 DOM 객체를 정렬하는 함수
			return doms.sort(function(a, b) {
				let likesA = parseInt($(a).find('.reviewLikeCnt').text()
						.replace(/,/g, ''));
				let likesB = parseInt($(b).find('.reviewLikeCnt').text()
						.replace(/,/g, ''));

				return likesB - likesA; // 내림차순 정렬
			});
		}
};











/*좋아요, 싫어요 버튼*/
function likeFunc(){
	// 임시 id
	let lr_owner = 'gh';
	let lr_where_type;   // type에  BOOK, REVIEW, COMMUNITY, POST, REPLY 값을 element 에서 찾아서 넣어주세요.
	
	// type
	$(".like-dislike").click(function(){
	let lr_type =	$(this).val();		// 1이면 좋아요 누른거  2이면 싫어요 누른거.
											// 눌렀던걸 또 누르면 0 으로
											
	lr_where_type = $(this).parent().find('.like-type').val();
	console.log(lr_where_type);
	let lr_where_no = $(this).parent().find('.like-no').val();
	let imgBtn = $(this).find(".like-dislike-img");
	let active = $(imgBtn).attr('class').includes("on");
	// 눌린거면 true	// 안눌린거면 false
	// id, 댓글의 pk
	console.log(lr_type)
	console.log(active);
	$.ajax({
		url : "like.do",
		data : {lr_where_no,lr_owner,lr_where_type,lr_type}
	}).done(function(data) {
		console.log(data);
		if(data == 1){
			
		}else if(data == 2){

		}else{
		}
			  $(imgBtn).toggleClass('on');
		
		
		});
	});
	
}