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
	<h2>참가자 목록 조회</h2>
	<form>
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>특기</td>
				<td>소속사</td>
			</tr>
	<%
		try{
			String sql = "select artist_id, artist_name, birth, gender, talent, agency from tbl_artist_201905";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String births = rs.getString(3);
				String birth = births.substring(0, 4) +"년"+ births.substring(4, 6) + "월"+births.substring(6, 8)+"일";
				
				String genders= rs.getString(4);
				String gender = "";
				if(genders.equals("F")) gender = "여";
				if(genders.equals("M")) gender = "남";
				
				String talents = rs.getString(5);
				String talent = "";
				if(talents.equals("1")) talent = "보컬";
				if(talents.equals("2")) talent = "댄스";
				if(talents.equals("3")) talent = "랩";
				
				
				%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= birth %></td>
						<td><%= gender %></td>
						<td><%= talent %></td>
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