/*판매 완료전 되묻기*/
function confirmAndComplete(t_no) {
    var confirmation = confirm("정말로 판매를 완료하시겠습니까?");
    if (confirmation) {
        // 확인 버튼을 클릭한 경우
        location.href = 'trade.complete?t_no=' + t_no;
    } else {
        // 취소 버튼을 클릭한 경우
        // 아무 작업도 수행하지 않음
    }
}
$(function(){
	confirmAndComplete();
});