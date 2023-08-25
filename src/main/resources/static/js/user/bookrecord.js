function delWish(lr_no){
	location.href="del.wish?lr_no=" + lr_no;		
}
	
function regIngWish(b_no, lr_no){
	location.href="reg.ing?b_no=" + b_no + "&lr_no=" + lr_no;
}

function regIngModalDB(b_no){
	location.href="reg.ing?b_no=" + b_no;
}

function regIngModalAPI(buttonElement){
	let book = buttonElement.closest('.br-box');
	
	let b_title = encodeURI(book.querySelector(".b-title").value);
	let b_authors = encodeURI(book.querySelector(".b-authors").value);
	let b_publisher = encodeURI(book.querySelector(".b-publisher").value);
	let b_thumbnail = encodeURI(book.querySelector(".b-thumbnail").value);
	let b_price = encodeURI(book.querySelector(".b-price").value);
	let b_isbn = encodeURI(book.querySelector(".b-isbn").value);
	let b_contents = encodeURI(book.querySelector(".b-contents").value);
		
	let b_url = encodeURIComponent(book.querySelector(".b-url").value);
	console.log(b_url);

			
			
	location.href="regbooking.modalapi?b_title=" + b_title + "&b_authors=" + b_authors +
				"&b_publisher=" + b_publisher + "&b_thumbnail=" + b_thumbnail + "&b_price="
				+ b_price + "&b_url=" + b_url + "&b_isbn=" + b_isbn + "&b_contents=" +  b_contents;
					
}

function delIng(br_no){
	location.href="del.ing?br_no=" + br_no;
}

function delFin(br_no){
	location.href="del.fin?br_no=" + br_no;
}

function makeDomDB(data){
	let dom = "";
	for(let i = 0; i < data.length; i++){
		let b_no = data[i].b_no;
		let b_title= data[i].b_title;
		let b_thumbnail = data[i].b_thumbnail;
		let b_authors = data[i].b_authors;
		let b_publisher = data[i].b_publisher;
		
		
 		dom += `<div class='br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/4 bg-white ml-10 mb-10'>
             <div class='w-full h-full flex'>
                 <div class='flex justify-center items-center ml-10 w-1/4 h-full'>
                     <img class='object-fit w-40 h-60' alt='' src="${b_thumbnail}">
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
                             <button class='update w-1/4 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl'
								onclick='regIngModalDB(${b_no})'
								>읽기 시작</button>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
		`;
	}
	
	
	
	
	/** api 콜 보내기 용 */
	dom += `<div
			class="br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/6 bg-white ml-10 mb-10">
			<div class="w-full h-full">
				<a
					class="api-search-btn w-full h-full flex flex-col justify-center items-center">
					<img class="w-20 h-20" alt="" src="imgs/plus_icon.jpg"> <span
					class="text-[2rem] font-bold">자세히 검색하기</span>
				</a>
			</div>
		</div>`
	
	$('.result-box').html(dom);
}		

function makeDomAPI(data){
	let dom = "";
	for(let i = 0; i < data.length; i++){
		let b_title_origin = data[i].b_title;
		let b_title = data[i].b_title;
		if(data[i].b_title.length > 12){
			b_title = data[i].b_title.substr(0, 11) + '...';			
		}
		let b_thumbnail = data[i].b_thumbnail;
		let b_authors = data[i].b_authors;
		let b_publisher = data[i].b_publisher;
		let b_contents = data[i].b_contents.replaceAll('"', "'");
		let b_url = data[i].b_url;
		let b_isbn = data[i].b_isbn;
		let b_price = data[i].b_price;
		
		
 		dom += `<div class='br-box block rounded-[60px] shadow-[1px_3px_5px_0_rgba(0,0,0,0.06)] shadow-inner shadow-slate-500 w-11/12 h-1/4 bg-white ml-10 mb-10'>
				<input hidden class="b-title" value="${b_title_origin }"> 
				<input hidden class="b-authors" value="${b_authors }"> 
				<input hidden class="b-publisher" value="${b_publisher }"> 
				<input hidden class="b-price" value="${b_price }"> 
				<input hidden class="b-url" value="${b_url }"> 
				<input hidden class="b-isbn" value="${b_isbn }"> 
				<input hidden class="b-thumbnail" value="${b_thumbnail }"> 
				<input hidden class="b-contents" value="${b_contents }">
             <div class='w-full h-full flex'>
                 <div class='flex justify-center items-center ml-10 w-1/4 h-full'>
                     <img class='object-fit w-40 h-60' alt='' src="${b_thumbnail}">
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
                             <button class='w-1/4 bg-[rgba(38,40,61,1)] mr-5 mb-3 rounded-3xl'
								onclick='regIngModalAPI(this)'
								>읽기 시작</button>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
		`;
	}
	
	$('.result-box').html(dom);
}		


$(function() {

 $(document).on("click", ".api-search-btn", function() { // 클릭 이벤트를 document에 위임하여 동적 생성 요소에 대한 클릭도 처리
		console.log(111);
		let modal = $(this).closest('.search-modal');
		let type = modal.find('.type').val();	
		console.log(type);
		let search_text = modal.find('.search-text').val();
		console.log(search_text);
						
		let search_data = {};
		search_data[type] = search_text;
					
		 $.ajax({
			url : "getbookJson.do",
			data : search_data 
			,
			success : function(data) {
				makeDomAPI(data);
				
			}
		
		}); // ajax end
 	}); // click event end
				
}); // ready