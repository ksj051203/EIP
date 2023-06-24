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
	<h2>학생정보현황</h2>
	<form>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>주민번호</td>
				<td>학과명</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>이메일</td>
			</tr>
			
			<%
				
				try{
					
					String sql = "select * from tbl_student_202210";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						String jumins = rs.getString(4);
						String jumin = jumins.substring(0,6) + "-"+ jumins.substring(6, 13);
						
						String gender = jumin.substring(7,8); //3 or 4
						if(gender.equals("3")) gender="남자";
						else if(gender.equals("4")) gender="여자";
						
						%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= jumin %></td>
								<td><%= rs.getString(3) %></td>
								<td><%= gender %></td>
								<td><%= rs.getString(5) %></td>
								<td><%= rs.getString(6) %></td>
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