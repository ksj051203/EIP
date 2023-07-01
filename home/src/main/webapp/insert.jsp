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
<%
	String sql = "select max(custno)+1 from member_tbl_02";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String custno = rs.getString(1);
	
%>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page = "header.jsp"></jsp:include>
<section>
	<h2>홈쇼핑 회원 등록</h2>
	<form name="frm" action="action.jsp" method="get">
		<input type="hidden" name="mode" value="update">
		<table border="1">
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" name="custno" value=<%= custno %> readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>거주지역</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="insertCheck()">
					<input type="button" value="취소" onclick="res()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>