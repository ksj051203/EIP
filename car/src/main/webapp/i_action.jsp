<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String car_number = request.getParameter("car_number");
	
	try{
		String sql = "select * from tbl_car_202301 where car_number = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, car_number);
		pstmt.executeQuery();
		%>
			
			<jsp:forward page = "success.jsp"></jsp:forward>
		<%	
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>