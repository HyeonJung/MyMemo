<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mMgr" class="db.MemberMgr"/>
<jsp:useBean id="bean" class="db.MemberBean"/>
<jsp:setProperty name="bean" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
boolean flag = mMgr.MemberSignUp(bean);
if (flag) {
%>
<script type="text/javascript">
alert('가입되었습니다.');
location.href="Login.jsp";
</script>
<%} else {%>
<script>
alert('가입 실패');
history.back();
</script>
<%} %>

</head>
<body>


</body>
</html>