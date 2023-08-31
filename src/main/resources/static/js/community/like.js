$(function() {
setLike();
likeFunc();
disLikeFunc();
});


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
	
	$(".post_like_icon").click(function(){
	let lr_owner = $('.user_id').val();
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
			console.log(data);
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
	$(".post_dislike_icon").click(function(){
	let lr_owner = $('.user_id').val();
	let lr_where_type = $(this).parent().find('.like-type').val();
	let lr_where_no = $(this).parent().find('.like-no').val();
	let reviewDislikeCnt = $(this).find('.reviewDislikeCnt');
	let lr_typeEl = $(this).parent().find('.like-check'); // 0, 1
	let span = $(this).find('.reviewDislikeCnt');
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

	




