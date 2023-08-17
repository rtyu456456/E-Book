function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	 }
	
	
let defaultBtn = document.getElementById("post_menu_etc");
let logoBtn = document.getElementById("menu-etc");

function showMenu(etcM){
	defaultBtn.style.visibility ='hidden';
	logoBtn.style.visibility ='visible';
				
}
