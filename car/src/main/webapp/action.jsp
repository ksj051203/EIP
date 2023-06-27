<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String car_number = request.getParameter("car_number");
	String owner_name = request.getParameter("owner_name");
	String location = request.getParameter("location");
	String entrance_time = request.getParameter("entrance_time");
	String departure_time = request.getParameter("departure_time");
	String mode = request.getParameter("mode");
			
	try{
		String car_number1 = "";
		String sql = "";
		switch(mode){
			case "insert" :
				sql = "insert into tbl_parking_202301(car_number,location, entrance_time) values(?, ?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, car_number);
				pstmt.setString(2, location);
				pstmt.setString(3, entrance_time);
				pstmt.executeUpdate();
				
				%>
					<jsp:forward page = "in.jsp"></jsp:forward>
				<% 
				break;
			case "update":
				String sql1 = "select car_number from tbl_car_202301 where owner_name= '" +owner_name+"'";
				System.out.println(sql1);
				PreparedStatement pstmt2 = con.prepareStatement(sql1);
				ResultSet rs = pstmt2.executeQuery();
				if(rs.next()){
					car_number1 = rs.getString(1);
				}
				sql = "update tbl_parking_202301 set departure_time = '" + departure_time + "' where car_number = '" + car_number1 + "'";
				PreparedStatement pstmt1 = con.prepareStatement(sql);
				
				
				pstmt1.executeUpdate();
				System.out.println(car_number1);
				System.out.println(sql);
				%>
					<jsp:forward page = "out.jsp"></jsp:forward>
				<% 
				break;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>