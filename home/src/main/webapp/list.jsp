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
<jsp:include page = "header.jsp"></jsp:include>
<section>
	<h2>회원목록조회/수정</h2>
	<form>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select * from member_tbl_02";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						
						String dates = rs.getString(5);
						String date = dates.substring(0, 10);
						String grades = rs.getString(6);
						String grade = "";	
						if(grades.equals("A")){
							grade = "VIP";
						}else if(grades.equals("B")){
							grade = "일반";
						}else if(grades.equals("C")){
							grade = "직원";
						}
						%>
							<tr>
								<td><a href="update.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1)%></a></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4) %></td>
								<td><%=date %></td>
								<td><%=grade %></td>
								<td><%=rs.getString(7) %></td>
							</tr>
						<% 
						
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				
			
			%>
		</table>
	</form>
</section>
<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>