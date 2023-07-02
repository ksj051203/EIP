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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h2>롯데자이언츠 선수 목록</h2>
	<form>
		<table border="1">
			<tr>
				<td>코치번호</td>
				<td>코치이름</td>
				<td>코치포지션</td>
				<td>관리선수</td>
				<td>관리선수연봉합계</td>
				<td>관리선수연봉평균</td>
				<td>관리선수최대연븅</td>
				<td>관리선수최소연봉</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select co.cid, cname, cposition, count(pid), sum(pcost), avg(pcost), max(pcost), min(pcost) from giants_coach co, giants_money mo where co.cid = mo.cid group by co.cid, cname, cposition order by sum(pcost) desc";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= rs.getString(3) %></td>
								<td><%= rs.getString(4)+"명" %></td>
								<td><%= rs.getString(5) %></td>
								<td><%= rs.getString(6) %></td>
								<td><%= rs.getString(7) %></td>
								<td><%= rs.getString(8) %></td>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>