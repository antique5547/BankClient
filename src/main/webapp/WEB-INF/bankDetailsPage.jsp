<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored = "false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${isAccountDetailsPage eq 'YES' }">
<h3 style="text-align: center;">Account Details</h3>
<table style="width: 460px;" align="center">
<tbody>
<tr>
<td style="width: 175px;">Username</td>
<td style="width: 293px;">${userDetails.userName }</td>
</tr>
<tr>
<td style="width: 175px;">Bank Name</td>
<td style="width: 293px;">${userDetails.bankName }</td>
</tr>
<tr>
<td style="width: 175px;">Bank Account Number</td>
<td style="width: 293px;">${userDetails.accDetails.accNo }</td>
</tr>
<tr>
<td style="width: 175px;">Balance</td>
<td style="width: 293px;">${userDetails.accDetails.accBal }</td>
</tr>
</tbody>
</table>
</c:when>

<c:when test="${viewBankProfile eq 'YES' }">
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
</c:when>

<c:when test="${isStatementPage eq 'YES' }">
<h3 style="text-align: center;">Statements Details</h3>

<p align="center">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>Username :</strong>&nbsp; ${uDetails.userName },&nbsp; &nbsp;<strong>BankName :</strong> ${uDetails.bankName },&nbsp; <strong>Bank A/C No : </strong>${uDetails.accDetails.accNo },&nbsp; <strong>Bal </strong>:&nbsp; ${uDetails.accDetails.accBal }</p>
<table style="height: 43px; margin-left: auto; margin-right: auto;" width="100%" border="1" cellspacing="0">
<tbody>
<tr style="height: 27px;">
<td style="width: 50px; height: 27px;"><strong>Sr.No</strong></td>
<td style="width: 113px; height: 27px;"><strong>Type</strong></td>
<td style="width: 114px; height: 27px;"><strong>Time</strong></td>
<td style="width: 115px; height: 27px;"><strong>Amount</strong></td>
</tr>
<c:forEach var="acStmt" items="${accountStmtList}">
<tr style="height: 27px;">
<td style="width: 50px; height: 27px;">1</td>
<td style="width: 113px; height: 27px;">${acStmt.type }</td>
<td style="width: 114px; height: 27px;">${acStmt.time }</td>
<td style="width: 115px; height: 27px;">${acStmt.amount }</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:when>
</c:choose>


</body>
</html>