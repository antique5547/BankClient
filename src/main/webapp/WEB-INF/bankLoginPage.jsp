<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored = "false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$("#loginButton").on('click',function(){
	var uname=$("#uname").val();
	var pwd=$("#password").val();
	if(uname === ""){
		alert("Enter Username");
		$("#uname").focus();
		return false;
	}
	if(pwd === ""){
		alert("Enter Password");
		$("#password").focus();
		return false;
	}
	return true;
	
})

</script>
<title>bankLoginPage</title>
</head>
<body>
<h4 style="text-align: center;">Welcome to ${bankName } Bank</h4>
<p style="color: red" align="center">${message }</p>
<form action="loginToBank.bapp" id="loginForm" method="post">
<input type="hidden" value="${bankName }" name="bankName">
<table style="width: 389px;" align="center">
<tbody>
<tr>
<td style="width: 189px;">Username</td>
<td style="width: 208px;"><input type="text" name="uname" id="uname"> </td>
</tr>
<tr>
<td style="width: 189px;">Password</td>
<td style="width: 208px;"><input type="password" name="password" id="password"> </td>
</tr>
<tr>
<td style="width: 208px;" colspan="2" align="center"><input type="submit" value="Login" id="loginButton"> </td>
</tr>
</tbody>
</table>
</form>
</body>
</html>