<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
%>
<html>
<head>
<title>ȸ������ �ý��� �α��� ������</title>
</head>
<body>
	<form name="loginform" action="http://localhost:8080/Web/login/LoginPro.jsp" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>�α���
								������</font></b></td>
				</tr>
				<tr>
					<td>���̵� :</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>��й�ȣ :</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" align=center><a
						href="javascript:loginform.submit()">�α���</a>&nbsp;&nbsp; <a
						href="http://localhost:8080/Web/main.jsp?pagefile=login/joinForm">ȸ������</a></td>
				</tr>
			</table>
		</center>
	</form>
	<%
		} else {
	response.sendRedirect("http://localhost:8080/Web/index.jsp");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>