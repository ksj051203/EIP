/**
 * 
 */

 function insertCheck(){
	 if(frm.custno.value.length == 0){
		 alert("회원번호가 입력하지 않았습니다.");
		 frm.custno.focus();
		 return false;
	 }else if(frm.custname.value.length==0){
		 alert("회원이름이 입력하지 않았습니다.");
		 frm.custname.focus();
		 return false;
	 }else if(frm.phone.value.length == 0){
		 alert("전화번호가 입력하지 않았습니다.");
		 frm.phone.focus();
		 return false;
	 }else if(frm.address.value.length == 0){
		 alert("주소가 입력하지 않았습니디");
		 frm.address.focus();
		 return false;
	 }else if(frm.joindate.value.length == 0){
		 alert("가입일자를 입력하지 않았습니다.");
		 frm.joindate.focus();
		 return false;
	 }else if(frm.grade.value.lenth == 0){
		 alert("등급을 입력하지 않았습니다.")
		 frm.grade.focus();
		 return false;
	 }else if(frm.city.value.length == 0){
		 alert("거주지역을 입력하지 않았습니다.");
		 frm.city.focus();
		 return false;
	 }else{
		 alert("정상적으로 등록이 완료되었습니다.");
		 document.frm.submit();
		 return true;
	 }
 }
 
 function modify() {
	alert("회원정보수정이 완료되었습니다.");
	document.frm.submit(); 
	return true;
}
