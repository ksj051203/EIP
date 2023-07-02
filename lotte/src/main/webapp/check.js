/**
 * 
 */

 function insertCheck(){
	 if(frm.pid.value.length == 0){
		 alert("선수번호가 입력되지 않았습니다.");
		 frm.pid.focus();
		 return false;
	 }else if(frm.pname.value.length == 0){
		 alert("선수이름가 입력되지 않았습니다.");
		 frm.pname.focus();
		 return false;
	 }else if(frm.pposition.value.length == 0){
		 alert("선수포지션이 입력되지 않았습니다.");
		 frm.pposition.focus();
		 return false;
	 }else if(frm.pdate.value.length == 0){
		 alert("선수등록일이 입력되지 않았습니다.");
		 frm.pdate.focus();
		 return false;
	 }else if(frm.pgrade.value.length == 0){
		 alert("선수등급이 입력되지 않았습니다.");
		 frm.pgrade.focus();
		 return false;
	 }else{
		 alert("선수등록이 완료되었습니다.");
		 document.frm.submit();
		 return true;
	 }
 }
 
 function insertCheck2(){
	 if(frm.pid.value.length == 0){
		 alert("선수번호가 입력되지 않았습니다.");
		 frm.pid.focus();
		 return false;
	 }else if(frm.pname.value.length == 0){
		 alert("선수이름가 입력되지 않았습니다.");
		 frm.pname.focus();
		 return false;
	 }else if(frm.pposition.value.length == 0){
		 alert("선수포지션이 입력되지 않았습니다.");
		 frm.pposition.focus();
		 return false;
	 }else if(frm.pdate.value.length == 0){
		 alert("선수등록일이 입력되지 않았습니다.");
		 frm.pdate.focus();
		 return false;
	 }else if(frm.pgrade.value.length == 0){
		 alert("선수등급이 입력되지 않았습니다.");
		 frm.pgrade.focus();
		 return false;
	 }else{
		 alert("수정이 완료되었습니다.");
		 document.frm.submit();
		 return true;
	 }
 }
 
 function res(){
	 alert("정보를 지우고 다시 입력합니다!");
	 document.frm.reset();
 }