<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body onload="<c:if test='${isBankLoginPage ne null }'>var encoded = encodeURIComponent('${message }');$('#bankLoginPageDiv').load('bankLoginPage.bapp?bankName=${bankName }&message='+encoded);</c:if>">

<jsp:include page="/WEB-INF/header.jsp">
<jsp:param value="{message}" name="message"/>
</jsp:include>
<div id="viewProfileDiv"></div>
<div id="bankLoginPageDiv"></div>
<div id="userDetailsDiv">
<c:if test="${viewUsers eq 'YES'}">
<p align="center"> Logged In</p>
<p style="text-align: right;">
<strong><a href="#" id="viewProfile1">Profile Details</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
<strong><a href="#" id="accounDetails">Account Details</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
<strong><a href="#" id="accountStmtDiv">Account Statements</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
<strong><a href="#" id="accountLogoutDiv">Logout</a>&nbsp;</strong> &nbsp; &nbsp;&nbsp;
</p>

<div id="viewProfileDetailDiv">
<h3 style="text-align: center;">Profile Details</h3>
<table style="width: 460px;" align="center">
<tbody>
<tr>
<td style="width: 175px;">Fullname</td>
<td style="width: 293px;">${userDetails.fullName }</td>
</tr>
<tr>
<td style="width: 175px;">Username</td>
<td style="width: 293px;">${userDetails.userName }</td>
</tr>
<tr>
<td style="width: 175px;">Bank</td>
<td style="width: 293px;">${userDetails.bankName }</td>
</tr>
<tr>
<td style="width: 175px;">Email ID</td>
<td style="width: 293px;">${userDetails.emailId }</td>
</tr>
<tr>
<td style="width: 175px;">Country</td>
<td style="width: 293px;">${userDetails.address.country }</td>
</tr>
<tr>
<td style="width: 175px;">Locality</td>
<td style="width: 293px;">${userDetails.address.locality }</td>
</tr>
<tr>
<td style="width: 175px;">District</td>
<td style="width: 293px;">${userDetails.address.district }</td>
</tr>
<tr>
<td style="width: 175px;">State</td>
<td style="width: 293px;">${userDetails.address.state}</td>
</tr>
<tr>
<td style="width: 175px;">Pin Code</td>
<td style="width: 293px;">${userDetails.address.pinCode }</td>
</tr>
</tbody>
</table>
</div>

</c:if>
</div>
</body>
</html>