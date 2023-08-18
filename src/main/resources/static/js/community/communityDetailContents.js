function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	 }
	
	
let defaultBtn = document.getElementById("post_menu_etc");
let logoBtn = document.getElementById("menu-etc");
let btnOnOff = document.querySelector(".menu-etc-onoff");

function showMenu(etcM){
	defaultBtn.style.visibility ='hidden';
	logoBtn.style.visibility ='visible';
	
}

/*button-etc 영역 외에 다른 것을 눌렀을 때 코드*/
document.addEventListener('mouseup', function(e) {
    if (!btnOnOff.contains(e.target)) {
	defaultBtn.style.visibility ='visible';
	logoBtn.style.visibility ='hidden';
    }
});