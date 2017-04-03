<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 	String pagefile=request.getParameter("pagefile");
	if(pagefile==null){
		pagefile="home";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./css/board.css" type="text/css" />
<title>web</title>
<meta charset="utf-8">

</head>
<body>
<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			%>
			<jsp:include page = "top.jsp"/>
	<%
		} else {
	%>
		<jsp:include page = "login/login.jsp"/>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
		<div id="logo">
	<img src="./img/soccer.PNG" width="250" heigth="150">
		<br>
		<br>
	</div>
	<div class="menubar">
		<ul>
			<li><a href="index.jsp" id="current">Home</a></li>
			<li><a href="#" id="current">Imfomation</a>
				<ul>
					<li><a href="http://localhost:8080/Web/main.jsp?pagefile=info/manchesterunited">맨유</a></li>
					<li><a href="http://localhost:8080/Web/main.jsp?pagefile=info/manchestercity">맨시티</a></li>
					<li><a href="http://localhost:8080/Web/main.jsp?pagefile=info/arsenal">아스날</a></li>
					<li><a href="http://localhost:8080/Web/main.jsp?pagefile=info/serch">검색</a></li>
				</ul></li>
			<li><a href="http://localhost:8080/Web/main.jsp?pagefile=board/list">Board</a></a></li>
		</ul>
	</div>

	<div class="pagewidth">
	<div class="page-wrap">
		<div class="content">
		<jsp:include page='<%=pagefile+".jsp"%>'/>
			<!-- CONTENT -->
			
		</div>
	<div class="sidebar">	
			<!-- SIDEBAR -->	
			<!-- SIDEBAR -->
		</div>
	
		<div class="clear"></div>		
	</div>

	<!--  FOOTER START -->
	<jsp:include page = "footer.jsp"/>

	<!-- FOOTER END -->
</div>	
	
		

		
</body>
</html>