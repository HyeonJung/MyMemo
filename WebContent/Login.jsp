<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%
  request.setCharacterEncoding("euc-kr");
  String email = (String) session.getAttribute("idKey");
  if (email != null) {
  %>
  <script>
  location.href="MemoList.jsp"
  </script>
  <%
  }
  %>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>MyMemo</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    function Signup() {
    	location.href="signup.jsp"
    }
    </script>
  </head>

  <body>
     
    <div class="container">

      <form class="form-signin" method="post" action="loginProc.jsp">
        <h2 class="form-signin-heading"style='text-align:center'>로그인</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
        <div class="checkbox" style="text-align:center">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
		<br/>
        <button class="btn btn-lg btn-warning btn-block" type="submit">Sign in  <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></button>
		<button class="btn btn-lg btn-primary btn-block" type="button" onclick="Signup()">Sign up  <span class="glyphicon glyphicon-user" aria-hidden="true"></span></button>
        </form>
		</div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
