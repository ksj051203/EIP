<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String mode = request.getParameter("mode");
	String pid = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String pgrade = request.getParameter("pgrade");
	String pposition = request.getParameter("pposition");
	String pdate = request.getParameter("pdate");
	
	try{
		String sql = "";
		PreparedStatement pstmt = null;
		switch(mode){
			case "insert":
				sql = "insert into giants_player values(?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pid);
				pstmt.setString(2, pname);
				pstmt.setString(3, pposition);
				pstmt.setString(4, pdate);
				pstmt.setString(5, pgrade);
				pstmt.executeUpdate();
				
				%>
					<jsp:forward page = "insert.jsp"></jsp:forward>
				<%
				break;
			case "delete":
				sql = "delete from giants_player where pid = "+pid;	
				pstmt = con.prepareStatement(sql);
				pstmt.executeUpdate();
				
				%>
					<jsp:forward page = "list.jsp"></jsp:forward>
				<%
				break;
			case "update":
				sql = "update giants_player set pname = ?, pposition = ?, pdate = ?, pgrade = ? where pid = ?";	
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pname);
				pstmt.setString(2, pposition);
				pstmt.setString(3, pdate);
				pstmt.setString(4, pgrade);
				pstmt.setString(5, pid);
				pstmt.executeUpdate();
				
				%>
					<jsp:forward page = "list.jsp"></jsp:forward>
				<%
				break;
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>