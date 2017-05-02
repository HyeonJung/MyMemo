<%@page import="db.MemberMgr"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mMgr" class="db.MemberMgr"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
request.setCharacterEncoding("euc-kr");
String email = request.getParameter("email");
String pass = request.getParameter("pass");

boolean flag = mMgr.MemberLogin(email, pass);
if(flag) {
    session.setAttribute("idKey",email);
%>
<script type="text/javascript">
location.href="MemoList.jsp";
</script>
<%
}
else {
%>
<script>
location.href=history.back();
</script>
<%  
}
%>
</head>
<body>

</body>
</html>