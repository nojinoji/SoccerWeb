<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("���̵� �Է��� �ּ���.");
			frm.id.focus();
			return;
		}
		url = "login/confirm.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
</script>
</head>
<body>
	<center>
		<form name="regFrm" method="post" action="http://localhost:8080/Web/login/registerPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>ȸ������ ������</font></b></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" placeholder="ID�Է����ּ���" autofocus> <input
						type="button" value="ID�ߺ�Ȯ��" onClick="idCheck(this.form.id.value)"></td>
					</td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16�� ����/����" maxlength="16"></td>
				</tr>
				<tr>
					<td>��й�ȣ ���Է�</td>
					<td><input id="repass" name="repass" type="password" size="20"
						placeholder="��й�ȣ���Է�" maxlength="16"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input id="name" name="name" type="text" size="20"
						placeholder="ȫ�浿" maxlength="10"></td>
				</tr>
				<tr>
					<td>��</td>
					<td><input id="team" name="team" type="text" size="20"
						placeholder="�� �Է�" maxlength="10"></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input id="job" name="job" type="text" size="20"
						placeholder="���� �Է�" maxlength="10"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input id="tel" name="tel" type="text" size="20"
						placeholder="��ȭ��ȣ �Է�" maxlength="20"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<button id="process">�����ϱ�</button>
						<button id="cancle">���</button>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>