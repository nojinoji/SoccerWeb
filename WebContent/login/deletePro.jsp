<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
String id = (String)session.getAttribute("id");
String passwd = request.getParameter("passwd");
LogonDBBean manager = LogonDBBean.getInstance();
//ȸ��Ż��ó�� �޼ҵ� ���� �� Ż�� ��Ȳ �� ��ȯ
int check = manager.deleteMember(id,passwd);
if(check == 1)//Ż�𼺰���
session.invalidate();//������ ��ȿȭ
if(check==1){
%>
<script type="text/javascript">
alert("������ ���� �Ͽ����ϴ�.");
location.href="http://localhost:8080/Web/main.jsp?pagefile=login/loginForm";
</script>
<% }else{%>
<script type="text/javascript">
alert("���������� ���� �Ͽ����ϴ�.");
history.back();
</script>
<%} %>