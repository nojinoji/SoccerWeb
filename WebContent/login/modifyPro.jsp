<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("euc-kr");%>
<%-- 7~9����: ������ ������ ������ �����������ü�� ����--%>
<jsp:useBean id="member" class="login.LogonDataBean">
<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
LogonDBBean manager = LogonDBBean.getInstance();
//ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ
int check = manager.updateMember(member);
if(check==1){
%>
<script type="text/javascript">
alert("������ ���� �Ͽ����ϴ�.");
location.href="loginForm.jsp";
</script>
<% }else{%>
<script type="text/javascript">
alert("���������� ���� �Ͽ����ϴ�.");
history.back();
</script>
<%} %>