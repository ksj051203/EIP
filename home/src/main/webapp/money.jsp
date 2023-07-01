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
				<td>고객등급</td>
				<td>매출</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select me.custno, custname, grade, sum(price) from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4) %></td>
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