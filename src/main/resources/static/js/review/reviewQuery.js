$(function() {
sortItems();
setLike();
likeFunc();
disLikeFunc();
bookmarkFunc();
setBookmark();

});


/*베스트 서평 상세*/
/* 오늘 */
$(function() {
	let best = document.querySelector('.best-review-day');
	let dialog = document.querySelector('.best-day-dialog');
	best.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
		console.log(111);
	});

	dialog.addEventListener('click', function(event) {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  });
/* 이번주 */
$(function() {
	let best = document.querySelector('.best-review-week');
	let dialog = document.querySelector('.best-week-dialog');
	best.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
		console.log(111);
	});

	dialog.addEventListener('click', function(event) {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  });
/*이번달*/
$(function() {
	let best = document.querySelector('.best-review-month');
	let dialog = document.querySelector('.best-month-dialog');
	best.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
		console.log(111);
	});

	dialog.addEventListener('click', function(event) {
    if (event.target === dialog) {
      dialog.close();
    }
  });

  });

/*사이드 메뉴 창*/
$(function() {
	let menu = document.querySelector('.menu-gh img');
	let dialog = document.querySelector('#menu-dialog');
	menu.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
	});
	
	dialog.addEventListener('click', function(event) {
    if (event.target === dialog) {
      dialog.close();
    }
  });
});


/*책갈피 끼우기*/
function setBookmark(){
	let likeCheck = $(".like-check-bookmark");
		if($(likeCheck).val() == 0){
			jQuery("#logoGH").show();
			console.log($(".bookmark-gh").attr("src", "/img/logo_bookmark_empty.png"));
		}else if($(likeCheck).val() == 1){
			jQuery("#logoGH").hide();
			console.log($(".bookmark-gh").attr("src", "/img/logo_bookmark.png"));
		}
}


function bookmarkFunc(){
	let num = 0;
	$(".bookmark-gh").click(function() {
	let lr_owner = $('.user_id').val();
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let lr_typeEl = $(this).parent().find('.like-check-bookmark'); // 0, 1
		if ($(lr_typeEl).val() == 0) {
			console.log("끼우기-------------");
			num++;
			$(lr_typeEl).val(1);
			console.log("lr_typeEl: " + lr_typeEl);
		} else if ($(lr_typeEl).val() == 1){
			console.log("뺴기-------------");
			num = 0;
			$(lr_typeEl).val(0);
			console.log("lr_typeEl: " + lr_typeEl);
		}
		lr_type = $(lr_typeEl).val();

	$.ajax({
		url: "like.do",
		data: {lr_where_no, lr_owner, lr_where_type, lr_type}		
	}).done(function(data){
		console.log(data);
		if(data == 0 && num == 0){
			jQuery("#logoGH").show();
			$(".bookmark-gh").attr("src", "/img/logo_bookmark_empty.png");
			$(lr_type).val(1);
			console.log("책갈피 num: " + num);
			console.log("lr_type: " + lr_type);
		} else if (data == 1 && num == 1){
			jQuery("#logoGH").hide();
			$(".bookmark-gh").attr("src", "/img/logo_bookmark.png");
			$(lr_type).val(0);
			console.log("책갈피 num: " + num);
			console.log("lr_type: " + lr_type);
		}
	});
	});

	
}


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


/*좋아요 싫어요 버튼*/
function setLike(){
	let likeCheck = $(".like-check");
	console.log(likeCheck);
	$(likeCheck).each(function(i, e){
		console.log(e.value)
		if(e.value == 1){
			console.log($(e).parent().find('.reviewLikeImg').addClass( 'on' ));
			console.log($(e).parent().find('.reviewLikeCnt').addClass( 'on' ));
		}else if(e.value == 2){
			console.log($(e).parent().find('.reviewDislikeImg').addClass( 'on' ));
			console.log($(e).parent().find('.reviewDislikeCnt').addClass( 'on' ));
		}
	});
}

let dataSet = ['', '좋아요','싫어요'];

function likeFunc(){
	
	$(".reviewLikeBtn").click(function(){
	let lr_owner = $('.user_id').val(); //'gh';
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let reviewLikeCnt = $(this).find('.reviewLikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let img = $(this).find('.reviewLikeImg');
	let span = $(this).find('.reviewLikeCnt');
	
	if($(lr_typeEl).val() == 2){
		alert("이미" + dataSet[$(lr_typeEl).val()] + '를 눌렀어요');
		return;
	}else if($(lr_typeEl).val() == 0){
		$(lr_typeEl).val(1);
	}else{
		$(lr_typeEl).val(0);
	}
	lr_type= $(lr_typeEl).val()
	$.ajax({
		url : "like.do",
		data : {lr_where_no,lr_owner,lr_where_type,lr_type}
	}).done(function(data) {
			console.log('data  ' + data);
			console.log('lr_owner  ' + lr_owner);
			if(data == 1){
				$(span).addClass('on');
				$(img).addClass('on');
				$(lr_type).val(1);
				$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())+1)
			}else{
				$(span).removeClass('on');
				$(img).removeClass('on');
				$(lr_type).val(0);
				$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())-1)
			}
	});
	});
}

function disLikeFunc(){
	
	$(".reviewDislikeBtn").click(function(){
	let lr_owner = $('.user_id').val(); //
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let reviewDislikeCnt = $(this).find('.reviewDislikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let img = $(this).find('.reviewDislikeImg');
	let span = $(this).find('.reviewDislikeCnt');
	if($(lr_typeEl).val() == 1){
		alert("이미" + dataSet[$(lr_typeEl).val()] + '를 눌렀어요');
		return;
	}else if($(lr_typeEl).val() == 0){
		$(lr_typeEl).val(2);
	}else{
		$(lr_typeEl).val(0);
	}
	lr_type= $(lr_typeEl).val()
	$.ajax({
		url : "like.do",
		data : {lr_where_no,lr_owner,lr_where_type,lr_type}
	}).done(function(data) {
			console.log('data  ' + data);
			console.log('lr_owner  ' + lr_owner);
			if(data == 2){
				$(img).addClass('on');
				$(span).addClass('on');
				$(lr_type).val(2);
				$(reviewDislikeCnt).text(parseInt($(reviewDislikeCnt).text())+1)
			}else{
				$(img).removeClass('on');
				$(span).removeClass('on');
				$(lr_type).val(0);
				$(reviewDislikeCnt).text(parseInt($(reviewDislikeCnt).text())-1)
			}
	});
	});
}

	
