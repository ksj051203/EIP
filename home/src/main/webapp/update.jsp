<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page = "header.jsp"></jsp:include>
<section>
	<h2>홈쇼핑 회원 정보 수정</h2>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String custname= "";
	String address = "";
	String phone = "";
	String joindate = "";
	String grade = "";
	String city = "";
	try{
		String sql ="select * from member_tbl_02 where custno = " + id;
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		custname = rs.getString(2);
		phone = rs.getString(3);
		address = rs.getString(4);
		joindate = rs.getString(5).substring(0, 10);
		grade = rs.getString(6);
		city = rs.getString(7);
	}catch(Exception e){
		e.printStackTrace();
	}	

	%>
	<form name="frm" action="action.jsp" method="get">
		<input type="hidden" name="mode" value="update">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="custno" value= "<%= id %>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname" value="<%= custname %>"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone" value="<%= phone %>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address" value="<%= address %>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate" value="<%= joindate %>"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade" value="<%= grade %>"></td>
			</tr>
			<tr>
				<td>거주지역</td>
				<td><input type="text" name="city" value="<%= city %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify()">
					<input type="button" value="취소" onclick="res()">
				</td>
			</tr>
		</table>
	</form>
	<%
		%>
</section>
<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>