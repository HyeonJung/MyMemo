<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Vector" %>
<%@ page import="db.MemoBean" %>
<jsp:useBean id="mMgr" class="db.MemberMgr"></jsp:useBean>
<jsp:useBean id="memoMgr" class="db.MemoMgr"/>
<jsp:useBean id="bean" class="db.MemoBean"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
     <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>메모 목록</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    
    <%
    request.setCharacterEncoding("EUC-KR");
    
    String email = (String) session.getAttribute("idKey");
    if (email == null) {
    %>
    <script>
    location.href = "Login.jsp";
    </script>
    <%
    }
    int count = mMgr.totalMemo(email);
    int icount = memoMgr.ImportanceMemo(email);
    Vector<MemoBean> vlist = memoMgr.getMemoContent(email);
   
    int totalPage = 0;
    int totalBlock = 0;
    
    int nowPage = 1;
    int nowBlock = 1;
    
    int start = 0;
    int end = 6;
    
    int listSize = 0;
    int numPerPage = 6;
    int pagePerBlock = 5;
    
    String keyWord="", keyField="";
    
    if (request.getParameter("nowPage") != null) {
    	nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    
    start = count - ((nowPage * numPerPage) - numPerPage);
    end = numPerPage;
    
    totalPage = (int)Math.ceil((double)count/numPerPage);
    %>
    <script>
    function memoWrite() {
    	location.href="Memo.jsp";
    }
    
    function block(num) {
    	if (num > 0) {
    	document.frm.nowPage.value = num;
    	document.frm.action = "MemoList.jsp";
    	document.frm.submit();
    	}
    }
    
    </script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="MemoList.jsp">My Memo</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="Logout.jsp">로그아웃</a></li>
          </ul>
        <div class="form-group">
        </div>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
		  <button class="btn btn-lg btn-default btn-block" type="button" onclick="memoWrite();"><span class="glyphicon glyphicon-pencil" aria-hidden="true">메모쓰기</span></button>
		  <hr>
          <ul class="nav nav-sidebar">
            <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>  전체 메모  <span class="badge"><%=count%></span></a></li>
            <li><a href="#"><span class="glyphicon glyphicon-star"></span>  중요 메모 <span class="badge"><%=icount%></span></a></li>
			<li><a href="#"><span class="glyphicon glyphicon-folder-close"></span>  메모 폴더</a></li>
          </ul>
		  <hr>
		  <ul class="nav nav-sidebar">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>  마이 페이지</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-cog"></span>  설정</a></li>
          </ul>
		  <hr>
          
		 </div>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h2>메모 목록</h2>
			<hr>
                <div class="row">
                   <br>
                </div>
                <%
                int cnt = 0;
                for (int i = start-1; i >= start-6; i--) {
                	if(i > -1){
                if (cnt % 2 == 0) {
                %>
                  <div class="row">
				    <div class="col-md-12">
				    <div class="col-md-1">&nbsp;</div>
				    <%} %>
                    <textarea class="col-md-4" rows="15" maxlength="10000" required style="border:inset 1px skyblue;" readonly><%=vlist.get(i).getContent() %>
					</textarea>
					<div class="col-md-1">&nbsp;</div>
					<%if (cnt % 2 == 1) { %>
				  </div>
			</div>
			<br><br>
			<%} cnt++; }}if (cnt % 2 == 1){%>
			   </div>
            </div>
            <%} %>
			<br><br>
			<br><br>
			<div class="row">
				<div class="col-md-4">&nbsp;</div>
                    <div class="col-md-5">
                    <nav>
                     
                    </nav>
                    </div>
				<div class="col-md-3">
                            <div class="input-group">
                                  <input type="text" class="form-control" id="search" placeholder="Search">
                                  <span class="input-group-btn">
                                       <button class="btn btn-info" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                  </span>
                            </div>
                      </div>
			</div>
			
			<form method="get" name="frm">
			 <input type="hidden" name="nowPage" value=<%=nowPage%>>
			 <input type="hidden" name="nowBlock" value=<%=nowBlock%>> 
			</form>
 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
