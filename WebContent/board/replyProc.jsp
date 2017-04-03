<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bMgr" class="design_home.BoardMgr" />
<jsp:useBean id="reBean" class="design_home.BoardBean"/>
<jsp:setProperty property="*" name="reBean"/>
<%
bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
bMgr.replyBoard(reBean);
String nowPage = request.getParameter("nowPage");
response.sendRedirect("list.jsp?nowPage="+nowPage);
%>