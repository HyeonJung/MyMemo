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
alert("등록 되었습니다.");
location.href="MemoList.jsp";
</script>
<%	
} else {
%>
<script>
alert("등록 실패.");
location.href=history.back();
</script>
<%} %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MemoAddProc</title>
</head>
<body>

</body>
</html>