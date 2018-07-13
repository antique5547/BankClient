<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#viewProfile").click(function() {
		$("#bankLoginPageDiv").empty();
		$("#userDetailsDiv").empty();
		var loggedInId=$("#loggedInId").val();
		console.log("loggedInId : "+loggedInId);
		$("#viewProfileDiv").load("viewProfile.bapp");
	})
	
	$("#editProfile").click(function() {
		$("#bankLoginPageDiv").empty();
		$("#userDetailsDiv").empty();
		var loggedInId=$("#loggedInId").val();
		console.log("loggedInId : "+loggedInId);
		$("#viewProfileDiv").load("editProfile.bapp");
	})
	
	$("#bankName").change(function() {
		var loggedInId=$("#loggedInId").val();
		var bankName=$(this).find(':selected').attr('value');
		
		
		if(bankName != "0" || bankName != 0){
			$("#userDetailsDiv").empty();
			$("#viewProfileDiv").empty();
			$("#bankLoginPageDiv").load("bankLoginPage.bapp?bankName="+bankName);
		}
		
	})
	$("#viewProfile1").click(function() {
		$("#viewProfileDetailDiv").load("viewBankProfile.bapp");
	})
	
	$("#accounDetails").click(function() {
		$("#viewProfileDetailDiv").load("viewbankDetails.bapp");
	})
	
	$("#accountStmtDiv").click(function() {
		$("#viewProfileDetailDiv").load("viewstmtDetails.bapp");
	})
})

</script>
<title>Insert title here</title>
</head>
<body>
<p align="center" style="color: green;">${param.message}</p>
<input type="hidden" value="${loggedInId}" id="loggedInId"/>
<h2 style="text-align: center;"><img src="http://mahagramin.in/images/ebank.jpg" alt="BankLogo" width="150" height="101" style="float: left;" caption="false" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Welcome to BankClient</h2>
<p style="text-align: right;">
<strong><a href="#" id="viewProfile">View Profile</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
<strong><a href="#" id="editProfile">Edit Profile</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
<strong>
<select name="bankName" id="bankName" style="width: 100px">
<option value="0">Bank</option>
<option value="SBI">SBI</option>
<option value="AXIS">AXIS</option>
<option value="PNB">PNB</option>
<option value="IDBI">IDBI</option>
<option value="OBC">OBC</option>
</select>

&nbsp; &nbsp;&nbsp;
<a href="logout.bapp">Logout</a>
</strong>
</p>

<hr/>
</body>
</html>