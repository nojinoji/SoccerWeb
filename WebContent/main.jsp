<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pagefile=request.getParameter("pagefile");
	if(pagefile==null){
		pagefile="home";
}
%>
<jsp:forward page="index.jsp">
	<jsp:param name="pagefile" value="<%=pagefile%>"/> 
</jsp:forward>