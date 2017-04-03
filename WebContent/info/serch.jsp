<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String keyWord = "";
	String keyField = "";
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		if (keyField.equals("team")) {
			if (keyWord.equals("manchesterunited")) {
				pstmt = conn.prepareStatement(
						"select a.player_name, a.position, a.player_age, a.player_con, b.team_name from player as a, team as b where b.team_name = '��ü����������Ƽ��';");
			} else if (keyWord.equals("manchestercity")) {
				pstmt = conn.prepareStatement(
						"select a.player_name, a.position, a.player_age, a.player_con, b.team_name from player as a, team as b where b.team_name = '��ü���ͽ�Ƽ';");
			} else {
				pstmt = conn.prepareStatement(
						"select a.player_name, a.position, a.player_age, a.player_con, b.team_name from player as a, team as b where b.team_name = '�ƽ���';");
			}
		} 
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}

		document.searchFrm.submit();
	}
</script>
<title>�����˻����</title>
</head>
<body>
	<%
		if (request.getParameter("keyWord") == null) {
	%>
	<form name="searchFrm" method="post" action="http://localhost:8080/Web/main.jsp?pagefile=info/serch">
		<div class="boardSearch">
			<select name="keyField">
				<option value="team" selected="selected">��</option>
			</select> <input type="text" id="txt" name="keyWord" /> <input type="button"
				value="�˻�" onClick="javascript:check()" />

		</div>
	</form>
	<%
		}

		else {
	%>
	<TABLE BORDER="1" width=500>
		<TABLE BORDER="1" width=500>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td><%=rs.getString("player_name")%></td>
				<td><%=rs.getString("position")%></td>
				<td><%=rs.getString("player_age")%></td>
				<td><%=rs.getString("player_con")%></td>
			</tr>
			<%
				}

				}
			%>
		</TABLE>
</body>
</html>