<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="design_home.BoardBean"%>
<jsp:useBean id="bMgr" class="design_home.BoardMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(idx);//��ȸ�� ����
	BoardBean bean = bMgr.getBoard(idx);//�Խù� ��������
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۺ���</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
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
					<li><a href="Impomation.html">������ ����</a></li>
					<li><a href="Impomation1.html">������ ��ǰ</a></li>
					<li><a href="Impomation2.html">������Ģ</a></li>
				</ul></li>
			<li><a href="http://localhost:8080/Web/main.jsp?pagefile=board/list">Board</a></a></li>
		</ul>
	</div>
	<div class="pagewidth">
		<div class="page-wrap">
			<div class="content">
				<!-- CONTENT -->
				<h3>�Խ��� �ۺ���</h3>
				<table border="0" cellpadding="3" cellspacing="0" width=100%>
					<tr>
						<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
						<td bgcolor="#FFFFE8"><%=name%></td>
						<td align="center" bgcolor="#DDDDDD" width=10%>��ϳ�¥</td>
						<td bgcolor="#FFFFE8"><%=reg_date%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">�� ��</td>
						<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#DDDDDD">÷������</td>
						<td bgcolor="#FFFFE8" colspan="3">
							<%
								if (filename != null && !filename.equals("")) {
							%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
							&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
						</font> <%
 	} else {
 %> ��ϵ� ������ �����ϴ�.<%
 	}
 %>
						</td>
					</tr>
					<tr>
						<td colspan="4"><br /> <pre><%=content%> </pre><br /></td>
					</tr>
					<tr>
						<td colspan="4" align="right"><%=ip%>�� ���� ���� ����̽��ϴ�./ ��ȸ�� <%=count%>
						</td>
					</tr>
				</table>
				<hr />
				[<a href="update.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>" >�� ��</a> |
					<a href="reply.jsp?nowPage=<%=nowPage%>" >�� ��</a> |
					<a href="delete.jsp?nowPage=<%=nowPage%>&idx=<%=idx%>">�� ��
					</a> ]<br>
			</div>
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="filename">
			</form>
			<form name="listFrm" method="post">
				<input type="hidden" name="idx" value="<%=idx%>
"> <input
					type="hidden" name="nowPage" value="<%=nowPage%>
">
				<%
					if (!(keyWord == null || keyWord.equals("null"))) {
				%>
				<input type="hidden" name="keyField" value="<%=keyField%>
">
				<input type="hidden" name="keyWord" value="<%=keyWord%>
">
				<%
					}
				%>
			</form>
			<div class="clear"></div>
		</div>	
<jsp:include page = "../footer.jsp"/>
</div>
</body>
</html>