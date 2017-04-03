<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="design_home.BoardBean"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String nowPage = request.getParameter("nowPage");
BoardBean bean = (BoardBean)session.getAttribute("bean");
String title = bean.getTitle();
String name = bean.getName();
String content = bean.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���� </title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script>
function check() {
if (document.updateFrm.pass.value == "") {
alert("������ ���� �н����带 �Է��ϼ���.");
document.updateFrm.pass.focus();
return false;
}
document.updateFrm.submit();
}
</script>
</head>
<body>
	<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			%>
			<jsp:include page = "../top.jsp"/>
	<%
		} else {
	%>
		<jsp:include page = "../login/login.jsp"/>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
		<div id="logo">
	<img src="../img/soccer.PNG" width="250" heigth="150">
		<br>
		<br>
	</div>
	<div class="menubar">
		<ul>
			<li><a href="../index.jsp" id="current">Home</a></li>
			<li><a href="#" id="current">Impomation</a>
				<ul>
					<li><a href="Impomation.html">������ ����</a></li>
					<li><a href="Impomation1.html">������ ��ǰ</a></li>
					<li><a href="Impomation2.html">������Ģ</a></li>
				</ul></li>
			<li><a href="http://localhost:8080/Web/main.jsp?pagefile=board/list">Board</a></a></li>
		</ul>
	</div>
<div class="nav-wrapper">
<div class="nav pagewidth">

</div>
</div>
<div class="pagewidth">
<div class="page-wrap">
<div class="content">
<!-- CONTENT -->
<h3>�Խ��� �ۼ���</h3>
<form name="updateFrm" method="post" action="updateProc.jsp" >
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="idx" value="<%=idx%>">
<table width="70%" cellspacing="0" cellpadding="7">
<tr>
<td width="20%">�� ��</td>
<td width="80%">
<input type="text" name="name" value="<%=name%>"size="30" maxlength="20">
</td>
</tr>
<tr>
<td width="20%">�� ��</td>
<td width="80%">
<input type="text" name="title" size="50" maxlength="50" value="<%=title%>">
</td>
<tr>
<td width="20%">�� ��</td>
<td width="80%">
<textarea name="content" rows="10" cols="50"><%=content %></textarea>
</td>
</tr>
<tr>
<td width="20%">��� ��ȣ</td>
<td width="80%"><input type="password" name="pass" size="15" maxlength="15">
�����ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
</tr>
<tr>
<td colspan="2" height="5"><hr/></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="�����Ϸ�" onClick="check()">
<input type="reset" value="�ٽü���">
<input type="button" value="�ڷ�" onClick="history.go(-1)">
</td>
</tr>
</table>
</form>
</div>