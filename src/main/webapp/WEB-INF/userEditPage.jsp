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
<body>

<c:choose>
<c:when test="${isEdit eq 'YES'}">
<h3 style="text-align: center;">Add/Edit Details</h3>
<form action="updateProfile.bapp">
<table style="width: 460px;" align="center">
<tbody>
<tr>
<td style="width: 175px;">Fullname</td>
<td style="width: 293px;"><input type="text" value="${userDetails.fullName }" name="fullName"></td>
</tr>
<tr>
<td style="width: 175px;">Username</td>
<td style="width: 293px;"><input type="text" value="${userDetails.userName }" name="userName"></td>
</tr>
<tr>
<td style="width: 175px;">Password</td>
<td style="width: 293px;"><input type="password" value="${userDetails.password }" name="password"></td>
</tr>
<tr>
<td style="width: 175px;">Email ID</td>
<td style="width: 293px;"><input type="text" value="${userDetails.emailId }" name="emailId"></td>
</tr>

<tr>
<td style="width: 175px;">Country</td>
<td style="width: 293px;"><input type="text" value="${userDetails.address.country }" name="country"></td>
</tr>
<tr>
<td style="width: 175px;">Locality</td>
<td style="width: 293px;"><input type="text" value="${userDetails.address.locality }" name="locality"></td>
</tr>
<tr>
<td style="width: 175px;">District</td>
<td style="width: 293px;"><input type="text" value="${userDetails.address.district }" name="district"></td>
</tr>
<tr>
<td style="width: 175px;">State</td>
<td style="width: 293px;"><input type="text" value="${userDetails.address.state}" name="state"></td>
</tr>
<tr>
<td style="width: 175px;">Pin Code</td>
<td style="width: 293px;"><input type="text" value="${userDetails.address.pinCode }" name="pinCode"></td>
</tr>
<tr>
<td style="width: 293px;" colspan="2"><input type="submit" value="Update"></td>
</tr>
</tbody>
</table>
</form>
</c:when>

<c:when test="${viewUsers eq 'YES'}">
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
<td style="width: 175px;">Password</td>
<td style="width: 293px;">${userDetails.password }</td>
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
<c:otherwise></c:otherwise>
</c:choose>



</body>
</html>