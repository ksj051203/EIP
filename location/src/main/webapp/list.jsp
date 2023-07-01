<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page= "header.jsp"></jsp:include>
<section>
	<h2>후보조회</h2>
	<form>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>소속정당</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>지역구</td>
				<td>대표전화</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select m_no, m_name, p_name, p_school, m_jumin, m_city, p_tel1, p_tel2, p_tel3 from tbl_member_202005 me, tbl_party_202005 pa where me.p_code = pa.p_code";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						String grade = rs.getString(4);
						String grades = "";
						if(grade.equals("1")){
							grades = "고졸";
						}else if(grade.equals("2")){
							grades = "학사";
						}else if(grade.equals("3")){
							grades = "석사";
						}else if(grade.equals("4")){
							grades = "박사";
						}
						%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= rs.getString(3) %></td>
								<td><%= grades %></td>
								<td><%= rs.getString(5).substring(0, 6)+"-" +rs.getString(5).substring(6, 13) %></td>
								<td><%= rs.getString(6) %></td>
								<td><%= rs.getString(7) + "-"+rs.getString(8) +"-" + rs.getString(9) %></td>
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

<jsp:include page= "footer.jsp"></jsp:include>

</body>
</html>