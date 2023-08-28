

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
/*누르면 lr_where_no = b_no를 이용해서
lr_where_type='BOOK' -> lr_type_number에 1을 넣었다 뺐다 할 수 있게*/

function bookmarkFunc(){
	let num = 0;
	let bookmarkImg = [ "/img/logo_bookmark_empty.png",
			"/img/logo_bookmark.png" ];
	$(".bookmark-gh").click(function(){
	let lr_owner = 'gh';   // $('.user_id').val();
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	//let bookmarkCnt = $(this).find('.reviewLikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let img = $(this).find('.bookmark-gh');
	if($(lr_typeEl).val() == 0){
		$(lr_typeEl).val(1);
		return;
	}else{
		$(lr_typeEl).val(0);
	}
	lr_type= $(lr_typeEl).val()
	$.ajax({
		url : "like.do",
		data : {lr_where_no,lr_owner,lr_where_type,lr_type}
	}).done(function(data) {
			console.log(data);
			if(data == 1 && num == 1){
				$(img).addClass('on');
				$(lr_type).val(1);
				num = 0;
				jQuery("#logoGH").show();
				//$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())+1)
			}else{
				$(img).removeClass('on');
				$(lr_type).val(0);
				num++;
				jQuery("#logoGH").hide();
				//$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())-1)
			}
			$(this).attr("src", bookmarkImg[num]);
	});
	});
}

$(function() {
	/*let num = 0;
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
		*/
		
sortItems();
setLike();
likeFunc();
disLikeFunc();
moreReview();
bookmarkFunc();

});


/*베스트 서평 더보기*/

function moreReview() {
	 $('.moreReviewBtn').click(function() {
    const h6 = $(this).prev('h6');
    if (h6.hasClass('asdf')) {
      h6.removeClass('asdf');
      $(this).text('Show Less');
    } else {
      h6.addClass('asdf');
      $(this).text('Show More');
    }
  });
  
};
	
	/*$('.best-review-gh').click(function() {
		let h6 = $(this).prev('h6');
		if (h6.hasClass('asdf')) {
			h6.removeClass('asdf');
			$(this).text('Show Less');
		} else {
			let r_contents = "<c:out value='${dailyBest.r_contents}'/>";
			h6.addClass('asdf');
			$(this).text(r_contents);
			console.log(r_contents);
		}
		
		
	$('.best-review-gh').each(function(){
		let h6 = $(this).find('h6');
		let button = $(this).find('.best-review-gh');
		if (h6[0].scrollHeight > h6.innerHeight()){
			button.show();
		} else{
			button.hide();
		}
		
	});*/










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


function setLike(){
	let likeCheck = $(".like-check");
	console.log(likeCheck);
	$(likeCheck).each(function(i, e){
		if(e.value == 1){
			console.log($(e).parent().find('.reviewLikeImg').addClass( 'on' ));
		}else if(e.value == 2){
			console.log($(e).parent().find('.reviewDislikeImg').addClass( 'on' ));
		}
	});
	
	
}



let dataSet = ['', '좋아요','싫어요'];

function likeFunc(){
	
	$(".reviewLikeBtn").click(function(){
	let lr_owner = 'gh';   // $('.user_id').val();
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let reviewLikeCnt = $(this).find('.reviewLikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let img = $(this).find('.reviewLikeImg');
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
			console.log(data);
			if(data == 1){
				$(img).addClass('on');
				$(lr_type).val(1);
				$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())+1)
			}else{
				$(img).removeClass('on');
				$(lr_type).val(0);
				$(reviewLikeCnt).text(parseInt($(reviewLikeCnt).text())-1)
			}
	});
	});
}

function disLikeFunc(){
	
	$(".reviewDislikeBtn").click(function(){
	let lr_owner = 'gh';   // $('.user_id').val();
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let reviewDislikeCnt = $(this).find('.reviewDislikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let img = $(this).find('.reviewDislikeImg');
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
			console.log(data);
			if(data == 2){
				$(img).addClass('on');
				$(lr_type).val(2);
				$(reviewDislikeCnt).text(parseInt($(reviewDislikeCnt).text())+1)
			}else{
				$(img).removeClass('on');
				$(lr_type).val(0);
				$(reviewDislikeCnt).text(parseInt($(reviewDislikeCnt).text())-1)
			}
	});
	});
}

	
