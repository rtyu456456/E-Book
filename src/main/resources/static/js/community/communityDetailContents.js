let defaultBtn = document.getElementById("post_menu_etc");
let logoBtn = document.getElementById("menu-etc");
let btnOnOff = document.querySelector(".menu-etc-onoff");


/*댓글창 줄바꿈마다 height 조절기능 */
function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
}

/*button-etc 눌렀을 때 코드*/
function showMenu(etcM){
	defaultBtn.style.visibility ='hidden';
	logoBtn.style.visibility ='visible';
	
}

//button-etc 영역 외에 다른 것을 눌렀을 때 코드
document.addEventListener('mouseup', function(e) {
    if (!btnOnOff.contains(e.target)) {
	defaultBtn.style.visibility ='visible';
	logoBtn.style.visibility ='hidden';
    }
});



/*모달 코드*/
let deleteModal = document.querySelector(".deleteModal");
let deletePostBtn = document.getElementById("delete-post-btn");
let cNo = document.getElementById("c-no");
let c_no = document.getElementById("c-no").value;
let cp_no = document.getElementById("delete-post-btn").value;
let modalBackBtn = document.querySelector(".back-btn");
let deleteOkBtn = document.querySelector(".delete-ok");
let deleteText = document.querySelector(".delete-text");


function close(){
	deleteModal.close();
}
function show(){
	deleteModal.showModal();
}

deletePostBtn.addEventListener('click', function(){
	show();
	console.log(c_no);
})


deleteOkBtn.addEventListener('click', function(){
	location.href="/do.delete.post?cp_no="+ cp_no + "&&c_no=" + c_no;
})

modalBackBtn.addEventListener('click', function(){
	deleteText.textContent = "삭제하시겠습니까?";
	close();
})




/*댓글 삭제 기능*/
function deleteReply(cr_no, cp_no, c_no){
		show();
		deleteText.textContent = "댓글을 삭제하겠습니까?";
		deleteOkBtn.addEventListener('click', function() {
			location.href = "/delete.my.reply?cr_no=" + cr_no + "&&cp_no="+ cp_no + "&&c_no="+ c_no;
		})
	
}

