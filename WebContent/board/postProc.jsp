<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bMgr" class="design_home.BoardMgr" />
<%
bMgr.insertBoard(request);
response.sendRedirect("http://localhost:8080/Web/main.jsp?pagefile=board/list");
%>