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
		<h2>차량입차</h2>
		<form method="get" action="action.jsp" name="frm2">
			<input type="hidden" name="mode" value="insert">
			<table border="1">
				<tr>
					<td>차량번호</td>
					<td>
						<input type="text" name="car_number">

					</td>
				</tr>
				
				<tr>
					<td>소유자이름</td>
					<td><input type="text" name="owner_name"></td>
				</tr>
				<tr>
					<td>주차위치선택</td>
					<td>
						<input type="radio" name="location" value="A001">A001
						<input type="radio" name="location" value="A002">A002
						<input type="radio" name="location" value="A003">A003
						<input type="radio" name="location" value="A004">A004
						<input type="radio" name="location" value="A005">A005
					</td>
				</tr>
				<tr>
					<td>입차시간</td>		
					<td><input type="text" name="entrance_time"></td>	
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="출차등록" onclick = "return insertCheck()">
						<input type="button" value="다시쓰기" onclick = "rst()">
					</td>
				</tr>
			</table>	
			
		</form>
	</section>
	<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>