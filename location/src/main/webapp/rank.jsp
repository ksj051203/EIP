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
	<h2>후보자등수</h2>
	<form>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>총투표건수</td>
			</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				try{
					String sql = "select me.m_no, m_name, count(vo.m_no) as count from tbl_member_202005 me, tbl_vote_202005 vo where vo.m_no = me.m_no and v_confirm = 'Y' "
								+ "group by me.m_no, m_name order by count desc";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					
					while(rs.next()){
						String v_confirms = rs.getString(3);
						int count = 0;
						if(v_confirms.equals("Y")){
							count += 1;
						}
						%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= rs.getString(3) %></td>
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