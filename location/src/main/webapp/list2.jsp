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
	<h2>투표검수조회</h2>
	<form>
		<table border="1">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select v_name, v_jumin, v_jumin, v_jumin, me.m_no, v_time, v_confirm from tbl_member_202005 me, tbl_vote_202005 vo where me.m_no = vo.m_no";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()){
						String v_jumins = rs.getString(2);
						String v_jumin = "";
						String gender = "";
						String genders = v_jumins.substring(6,7);
						if(genders.equals("1") || genders.equals("3")){
							gender = "남";
							
						}else if(genders.equals("2") || genders.equals("4")){
							gender = "여";
						}
						
						if(genders.equals("1") || genders.equals("2")){
							v_jumin = "19"+ v_jumins.substring(0,2)+"년"+v_jumins.substring(2,4)+"월"+v_jumins.substring(4, 6)+ "일";
						}else if(genders.equals("3") || genders.equals("4")){
							v_jumin = "20"+ v_jumins.substring(0,2)+"년"+v_jumins.substring(2,4)+"월"+v_jumins.substring(4,6)+ "일";
						}
						
						int ages = Integer.parseInt(v_jumin.substring(0,4));
						int age = 2020 - ages;
						
						
						String checks = rs.getString(7);
						String check = "";
						if(checks.equals("Y")){
							check = "확인";
						}else if(checks.equals("N")){
							check = "미확인";
						}
						
						
						%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= v_jumin %></td>
								<td><%= "만 "+age+"세" %></td>
								<td><%= gender %></td>
								<td><%= rs.getString(5)%></td>
								<td><%= rs.getString(6).substring(0,2) +":" +rs.getString(6).substring(2, 4) %></td>
								<td><%= check %></td>
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