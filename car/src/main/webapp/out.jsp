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
		<h2>차량출차</h2>
		<form method = "get" name="frm" action="action.jsp" >
			<input type="hidden" name="mode" value="update">
			<table border="1">
				<tr>
					<td>차량번호</td>
					<td>
						<%
							String sql = "select * from tbl_car_202301";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							%>
							<select name="car_number" onchange="getValue(this.value)">
								<option value="" ></option>
							<%
							while(rs.next()){
								%>
									<option value="<%= rs.getString(3) %>"><%= rs.getString(1)%></option>
								<% 
							}
							%>
							</select>
							<%
						%>
					</td>
				</tr>
				
				<tr>
					<td>소유자이름</td>
					<td><input type="text" id = "owner_name" name="owner_name" readonly></td>
				</tr>
				
				<tr>
					<td>출차시간</td>
					<td><input type="text" name="departure_time"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="차량조회" onclick="return insertCheck2()">
						<input type="button" value="홈으로" onclick="window.location.href='index.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page = "footer.jsp"></jsp:include>
</body>
</html>