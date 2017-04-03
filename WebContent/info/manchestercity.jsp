<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select a.player_name, a.position, a.player_age, a.player_con, b.team_name from player as a, team as b where b.team_name = '맨체스터시티';");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>맨시티</title>
</head>
<body>
<TABLE BORDER="1" width=500>
			<%
				while (rs.next()) {
			%>
	<tr align=center>
		<td><%=rs.getString("player_name")%></td>
		<td><%=rs.getString("position")%></td>
		<td><%=rs.getString("player_age")%></td>
		<td><%=rs.getString("player_con")%></td>
		<td><%=rs.getString("team_name")%></td>
	</tr>
	<%
	
	}
	%>
</TABLE>
</body>
</html>