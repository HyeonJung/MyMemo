<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="memoMgr" class="db.MemoMgr"/>
<jsp:useBean id="bean" class="db.MemoBean"/>
<jsp:setProperty name="bean" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
boolean flag = memoMgr.WriteMemo(bean);
if(flag) {
%>
<script>
alert("��� �Ǿ����ϴ�.");
location.href="MemoList.jsp";
</script>
<%	
} else {
%>
<script>
alert("��� ����.");
location.href=history.back();
</script>
<%} %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MemoAddProc</title>
</head>
<body>

</body>
</html>