<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/board.css" type="text/css" />
</head>
<body>
<div class="header-wrapper">
	<div class ="header-login"> 
	<%
	
	String id = "";
	try {
		id = (String) session.getAttribute("id");
	%>
	<b><%=id%></b>님이 로그인 하셨습니다.
	<form method="post" action="login/sessionLogout.jsp">
		<input type="submit" value="로그아웃">
	</form>
		<a href="http://localhost:8080/Web/main.jsp?pagefile=login/modify">[수정]</ a > &nbsp;
		<a href="http://localhost:8080/Web/main.jsp?pagefile=login/delete">[탈퇴]</ a > &nbsp;
	<%
		if (id.equals("admin")) {
	%>
	<a href="login/member_list.jsp">[회원 목록 보기]</ a > <%
 	}
		%>
	</h3>
	
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</div>
	</div>
</body>
</html>