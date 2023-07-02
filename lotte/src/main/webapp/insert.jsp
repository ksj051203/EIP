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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>선수 등록</h2>
	<form name="frm" action="action.jsp" method="get">
	<% 
		String sql = "select max(pid)+1 from giants_player";
		String pid = "";
	
		try{
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pid = rs.getString(1);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
	<input type="hidden" name="mode" value="insert">
		<table border="1">
			<tr>
				<td>선수번호</td>
				<td><input type="text" name = "pid" value = "<%= pid %>" readonly></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name = "pname"></td>
			</tr>
			<tr>
				<td>선수포지션</td>
				<td>
					<select name = "pposition">
						<option value=""></option>
						<option value="투수">투수</option>
						<option value="외야수">외야수</option>
						<option value="내야수">내야수</option>
						<option value="포수">포수</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name = "pdate"></td>
			</tr>
			<tr>
				<td>선수등급</td>
				<td>
					<input type="radio" name = "pgrade" value="S">S
					<input type="radio" name = "pgrade" value="A">A
					<input type="radio" name = "pgrade" value="B">B
					<input type="radio" name = "pgrade" value="C">C
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick = "insertCheck()">
					<input type="button" value="다시쓰기" onclick = "res()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>