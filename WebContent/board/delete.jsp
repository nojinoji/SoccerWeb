<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="design_home.BoardBean"%>
<jsp:useBean id="bMgr" class="design_home.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int idx = Integer.parseInt(request.getParameter("idx"));
	if (request.getParameter("pass") != null) {
		//비번을 입력을 해서 세션에 있는 pass 비교요청
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(idx);
			String url = "http://localhost:8080/Web/board/list.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%
	}
	} else {
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제하기</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
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
	
	<div class="pagewidth">
		<div class="page-wrap">
			<div class="content">
				<!-- CONTENT -->
				<h3>게시글 삭제</h3>
				<h5>사용자의 비밀번호를 입력해주세요.</h5>
				<form name="delFrm" method="post" action="delete.jsp">
					<center>
						<table align="center" border="0" width=91%>
							<tr>
								<td align="center"><input type="password" name="pass"
									size="17" maxlength="15"></td>
							</tr>
							<tr>
								<td align="center"><input type="button" value="삭제완료"
									onClick="check()"> <input type="reset" value="다시쓰기">
									<input type="button" value="뒤로" onClick="history.go(-1)">
								</td>
							</tr>
						</table>
					</center>
					<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
						type="hidden" name="idx" value="<%=idx%>">
				</form>
			</div>
			<div class="clear"></div>
		</div>
		<%}%>
		<!-- FOOTER START -->
		<jsp:include page="../footer.jsp" />
		<!-- FOOTER END -->
	</div>
</body>
</html>