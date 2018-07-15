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
<td style="width: 175px;"><strong>Username</strong></td>
<td style="width: 293px;">${userDetails.userName }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Bank Name</strong></td>
<td style="width: 293px;">${userDetails.bankName }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Bank A/C Number</strong></td>
<td style="width: 293px;">${userDetails.accDetails.accNo }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Balance</strong></td>
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
<td style="width: 175px;"><strong>Fullname</strong></td>
<td style="width: 293px;">${userDetails.fullName }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Username</strong></td>
<td style="width: 293px;">${userDetails.userName }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Email ID</strong></td>
<td style="width: 293px;">${userDetails.emailId }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Country</strong></td>
<td style="width: 293px;">${userDetails.address.country }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Locality</strong></td>
<td style="width: 293px;">${userDetails.address.locality }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>District</strong></td>
<td style="width: 293px;">${userDetails.address.district }</td>
</tr>
<tr>
<td style="width: 175px;"><strong>State</strong></td>
<td style="width: 293px;">${userDetails.address.state}</td>
</tr>
<tr>
<td style="width: 175px;"><strong>Pin Code</strong></td>
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
<tr style="height: 15px;">
<td style="width: 50px; "><strong>Sr.No</strong></td>
<td style="width: 113px; "><strong>Type</strong></td>
<td style="width: 114px; "><strong>Time</strong></td>
<td style="width: 115px; "><strong>Amount</strong></td>
</tr>
<c:set var="count" value="0" scope="page"></c:set>
<c:forEach var="acStmt" items="${accountStmtList}">
<c:set var="count" value="${count + 1}" scope="page"/>
<tr style="height: 15px;">
<td style="width: 50px; ">${count }</td>
<td style="width: 113px; "><c:if test="${acStmt.type eq 'CREDIT'}"><font color="green"></c:if><c:if test="${acStmt.type eq 'DEBIT'}"><font color="red"></c:if> ${acStmt.type }</font></td>
<td style="width: 114px; ">${acStmt.time }</td>
<td style="width: 115px; ">${acStmt.amount }</td>
</tr>
</c:forEach>
</tbody>
</table>
</c:when>
</c:choose>


</body>
</html>