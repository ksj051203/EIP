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
<%
	request.setCharacterEncoding("utf-8");
	String car_number = request.getParameter("car_number");

%> 
<jsp:include page= "header.jsp"></jsp:include>
	<section>
		<h2>차량조회</h2>
		<form>
			<table border="1">
				<tr>
					<td>차량번호</td>
					<td>차량종류</td>
					<td>소유자이름</td>
					<td>주차위치</td>
					<td>입차시간</td>
					<td>출차시간</td>
					
					<%
						try{
							String sql = "select ca.car_number, car_name, owner_name, location, entrance_time, departure_time " + 
										"from tbl_car_202301 ca, tbl_parking_202301 pa "
										+"where ca.car_number = pa.car_number and ca.car_number = '" + car_number + "'";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
						
							while(rs.next()){
								%>
									<tr>
										<td><%= rs.getString(1) %></td>
										<td><%= rs.getString(2) %></td>
										<td><%= rs.getString(3) %></td>
										<td><%= rs.getString(4) %></td>
										<td><%= rs.getString(5) %></td>
										<td><%= rs.getString(6) %></td>									
									</tr>
								<%	
							}
						}catch(Exception e){
							e.printStackTrace();
						}
						
					%>
					
				
				</tr>
			</table>
		</form>
	</section>
<jsp:include page= "footer.jsp"></jsp:include>
</body>
</html>