<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
String id = (String)session.getAttribute("id");
String passwd = request.getParameter("passwd");
LogonDBBean manager = LogonDBBean.getInstance();
//회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환
int check = manager.deleteMember(id,passwd);
if(check == 1)//탈퇴성공시
session.invalidate();//세션을 무효화
if(check==1){
%>
<script type="text/javascript">
alert("정보를 수정 하였습니다.");
location.href="http://localhost:8080/Web/main.jsp?pagefile=login/loginForm";
</script>
<% }else{%>
<script type="text/javascript">
alert("정보수정에 실패 하였습니다.");
history.back();
</script>
<%} %>