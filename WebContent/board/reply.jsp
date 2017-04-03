<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="design_home.BoardBean"%>
<jsp:useBean id="bean" class="design_home.BoardBean" scope="session"/>
<%
String nowPage = request.getParameter("nowPage");
String title = bean.getTitle();
String content = bean.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 답글</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script>
function check() {
if (document.post.pass.value == "") {
alert("패스워드를 입력하세요.");
document.post.pass.focus();
return false;
}
document.post.submit();
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
					<li><a href="Impomation.html">자전거 종류</a></li>
					<li><a href="Impomation1.html">자전거 용품</a></li>
					<li><a href="Impomation2.html">안전수칙</a></li>
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
<h3>게시판 답변</h3>
<form name="post" method="post" action="replyProc.jsp" >
<table border="0">
<tr>
<td width="20%">성 명</td>
<td width="80%"> <input type="text" name="name" size="30" maxlength="20"></td>
</tr>
<tr>
<td width="20%">제 목</td>
<td width="80%">
<input type="text" name="title" size="50" value="답변 : <%=title%>" maxlength="50"></td>
</tr>
<tr>
<td width="20%">내 용</td>
<td width="80%">
<textarea name="content" rows="12" cols="50"><%=content %>
========답변 글을 쓰세요.=======
</textarea>
</td>
</tr>
<tr>
<td width="20%">비밀 번호</td>
<td width="80%">
<input type="password" name="pass" size="15" maxlength="15"></td>
</tr>
<tr>
<td colspan="2" height="5"><hr/></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="답변등록" onClick="check()">
<input type="reset" value="다시쓰기">
<input type="button" value="뒤로" onClick="history.back()"></td>
</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
<input type="hidden" name="nowPage" value="<%=nowPage%>">
<input type="hidden" name="ref" value="<%=bean.getRef()%>">
<input type="hidden" name="pos" value="<%=bean.getPos()%>">
<input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form>
</div>
<div class="clear"></div>
</div>
<!-- FOOTER START -->
<jsp:include page = "../footer.jsp"/>
<!-- FOOTER END -->
</div>
</body>
</html>