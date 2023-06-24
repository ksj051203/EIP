<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>


<%
	request.setCharacterEncoding("utf-8");
	String sid = request.getParameter("sid");
	String subcode = request.getParameter("subcode");
	String midscore = request.getParameter("midscore");
	String finalscore = request.getParameter("finalscore");
	String attend = request.getParameter("attend");
	String report = request.getParameter("report");
	String etc = request.getParameter("etc");
	
	try{
		String sql = "insert into tbl_score_202210 values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sid);
		pstmt.setString(2, subcode);
		pstmt.setString(3, midscore);
		pstmt.setString(4, finalscore);
		pstmt.setString(5, attend);
		pstmt.setString(6, report);
		pstmt.setString(7, etc);
		
		pstmt.executeUpdate();
		
		%>
			<jsp:forward page = "insert.jsp"></jsp:forward>
		<%
		
		
	}catch(Exception e){
		
	}
	String sql = "";

%>