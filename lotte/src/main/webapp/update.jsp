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
	<% 
		String pid = request.getParameter("pid");
		String pname = "";
		String pposition = "";
		String pdate = "";
		String pgrade = "";
	
		try{
			String sql = "select * from giants_player where pid="+pid;
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pname = rs.getString(2);
			pposition = rs.getString(3);
			pdate = rs.getString(4);
			pgrade = rs.getString(5);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
	<form name="frm" action="action.jsp" method="get">
	<input type="hidden" name="mode" value="update">
		<table border="1">
			<tr>
				<td>선수번호</td>
				<td><input type="text" name = "pid" value = "<%= pid %>" readonly></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name = "pname" value = "<%= pname %>"></td>
			</tr>
			<tr>
				<td>선수포지션</td>
				<td>
					<select name = "pposition">
						<option value=""></option>
						<option value="투수" <% if(pposition.equals("투수")) out.println("selected"); %>>투수</option>
						<option value="외야수" <% if(pposition.equals("외야수")) out.println("selected"); %>>외야수</option>
						<option value="내야수" <% if(pposition.equals("내야수")) out.println("selected"); %>>내야수</option>
						<option value="포수" <% if(pposition.equals("포수")) out.println("selected"); %>>포수</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name = "pdate" value = "<%= pdate %>"></td>
			</tr>
			<tr>
				<td>선수등급</td>
				<td>
					<input type="radio" name = "pgrade" value="S" <% if(pgrade.equals("S")) out.println("checked"); %>>S
					<input type="radio" name = "pgrade" value="A" <% if(pgrade.equals("A")) out.println("checked"); %>>A
					<input type="radio" name = "pgrade" value="B" <% if(pgrade.equals("B")) out.println("checked"); %>>B
					<input type="radio" name = "pgrade" value="C" <% if(pgrade.equals("C")) out.println("checked"); %>>C
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick = "insertCheck2()">
					<input type="button" value="다시쓰기" onclick = "res()">
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>