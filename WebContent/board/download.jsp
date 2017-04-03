<%@ page contentType="application;charset=euc-kr"%>
<jsp:useBean id="bMgr" class="design_home.BoardMgr" />
<%
bMgr.downLoad(request, response,out,pageContext);
%>