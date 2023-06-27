/**
 * 
 */

 function insertCheck(){
	 if(frm2.car_number.value.length == 0){
		 alert("차량번호가 입력되지 않았습니다");
		 frm2.car_number.focus();
		 return false;
	 }else if(frm2.car_name.value.length == 0){
		 alert("소유자 이름이 입력되지 않았습니다");
		 frm2.car_name.focus();
		 return false;
	 }else if(frm2.location.value.length == 0){
		 alert("주차위치가 입력되지 않았습니다");
		 frm2.location.focus();
		 return false;
	 }else if(frm2.entrance_time.value.length ==0){
		 alert("입차 시간이 입력되지 않았습니다");
		 frm2.entrance_time.focus();
		 return false;
	 }else{
		alert("차량입차가 정상적으로 등록되었습니다!");
		return true;
	 }
 }
 
 function insertCheck2(){
	 if(frm.car_number.value.length == 0){
		 alert("차량번호가 입력되지 않았습니다.");
		 frm.car_number.focus();
		 return false;
	 }else if(frm.car_name.value.length == 0){
		 alert("소유주 이름이 입력되지 않았습니다.");
		 frm.car_name.focus();
		 return false;
	}else if(frm.departure_time.value.length == 0){
		alert("출차시간이 입력되지 않았습니다.");
		frm.departure_time.focus();
		return false;
	}else{
		alert("차량출차가 완료되었습니다.");
		return true;
	}
 }
 
 function rst(){
	 alert("정보를 지우고 처음부터 다시 입력합니다!");
	 document.frm2.reset();
 }
 
 
 function search(){
	 if(frm.car_number.value.length == 0){
		 alert("차량번호가 입력되지 않았습니다.");
		 frm.car_numbe.focus();
		 return false;
	}
 }
 
function getValue(car_number_value){
	document.getElementById("owner_name").value = car_number_value;
	console.log(car_number_value);
}