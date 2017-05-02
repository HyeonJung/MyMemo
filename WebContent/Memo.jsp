<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mMgr" class="db.MemberMgr"></jsp:useBean>
    <jsp:useBean id="memoMgr" class="db.MemoMgr"/>
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

    <title>메모 등록</title>
    <%
    String email = (String) session.getAttribute("idKey");
    if (email == null) {
    %>
    <script>location.href="Logout.jsp"</script>
    <%
    }
    int count = mMgr.totalMemo(email);
    int icount = memoMgr.ImportanceMemo(email);
    %>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    function back() {
    	history.back();
    }
    function add() {
    	
    	document.MemoFrm.submit();
    }
    function memoWrite() {
        location.href="Memo.jsp";
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
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
		  <button class="btn btn-lg btn-default btn-block"  type="button" onclick="memoWrite();"><span class="glyphicon glyphicon-pencil" aria-hidden="true">메모쓰기</span></button>
		  <hr style="border:5">
          <ul class="nav nav-sidebar">
            <li><a href="MemoList.jsp"><span class="glyphicon glyphicon-list-alt"></span>  전체 메모 <span class="badge"><%=count%></span></a></li>
            <li><a href="#"><span class="glyphicon glyphicon-star"></span>  중요 메모 <span class="badge"><%=icount %></span></a></li>
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
			<h2> 새 메모 작성 </h2>
			<hr>
			<form name="MemoFrm" method="post" action="MemoProc.jsp">
                <div class="row">
                   <br>
                   <div class="col-md-2">
                   [메모 색상]
                   <input type="color" name="memocolor" value="#FFFFFF">
                    </div>
                    <div class="col-md-2">
                    [중요메모]  
                    <input type="checkbox" name="importance">
                    </div>
                   <br><br/>
                </div>
			<div class="row">
				<div class="col-md-12">
					<textarea class="col-md-12" rows="12" name="content" maxlength="1000" required style="resize:none;border:inset 3px skyblue;"></textarea>				
				</div>
			</div>
			<br>
            <input type="hidden" name="email" value="<%=email%>">
			<div class="row">
				<div class="col-md-8">&nbsp;</div>
				<div class="col-md-2"> <button class="btn btn-success btn-block" type="button" onclick="add();"><span class="glyphicon glyphicon-ok" aria-hidden="true">완료</span></button> </div>
				<div class="col-md-2"> <button class="btn btn-danger btn-block" type="button" onclick="back();"><span class="glyphicon glyphicon-remove" aria-hidden="true">취소</span></button> </div>
		    </div>
		    </form>

	</div>
	</div>
      

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
