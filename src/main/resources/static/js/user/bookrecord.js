function delWish(lr_no){
	location.href="del.wish?lr_no=" + lr_no;		
}
	
function regIngWish(b_no, lr_no){
	location.href="reg.ing?b_no=" + b_no + "&lr_no=" + lr_no;
}

function regIngModal(b_no){
	location.href="reg.ing?b_no=" + b_no;
}

function delIng(br_no){
	location.href="del.ing?br_no=" + br_no;
}

function delFin(br_no){
	location.href="del.fin?br_no=" + br_no;
}

function makeDom(data){
	let dom = "";
	for(let i = 0; i < data.length; i++){
		let b_title= data[i].b_title;
		console.log(b_title);
		let b_thumbnail = data[i].b_thumbnail;
		console.log(b_thumbnail);
		let b_authors = data[i].b_authors;
		console.log(b_authors);
		let b_publisher = data[i].b_publisher;
		console.log(b_publisher);
		
		
 		dom += `<div class='br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/4 bg-white ml-10 mb-10'>
             <div class='w-full h-full flex'>
                 <div class='flex justify-center items-center ml-10 w-1/4 h-full'>
                     <img class='object-fit w-40 h-60' alt='${b_title}' src="${b_thumbnail}">
                 </div>
                 <div class='flex flex-col justify-center items-start pl-5 w-3/4 h-full text-[rgba(38,40,61,1)]'>
                     <div class='w-full flex justify-between text-[2.5rem] font-bold pt-10 h-1/3'>
                         <span>${b_title}</span>
                     </div>
                     <div class='text-[1.7rem] text-[rgba(38,40,61,0.5)] font-bold h-1/4'>
                         <span>${b_authors}</span>
                     </div>
                     <div class='w-11/12 h-1/3 text-[1.7rem] font-bold whatshowwrapper'>
                         <div class='whatshow1 w-full h-full'>
                             <div class='flex w-full justify-between'>
                                 <span>${b_publisher}</span>
                             </div>
                         </div>
                     </div>
                     <div class='flex justify-end items-end w-full h-1/6 text-[2rem] font-bold '>
                         <div class='flex justify-end items-end w-full h-1/6 text-[1.5rem] text-white font-bold'>
                             <button class='update w-1/4 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl'>읽기 시작</button>
                         </div>
                     </div>
                 </div>
             </div>
         </div>`;
	}
	$('.result-box').html(dom);
}		