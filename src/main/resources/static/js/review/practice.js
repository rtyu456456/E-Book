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