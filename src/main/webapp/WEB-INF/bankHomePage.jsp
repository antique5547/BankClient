<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body onload="$('#viewProfile').click();">
<jsp:include page="/WEB-INF/header.jsp">
<jsp:param value="${message}" name="message"/>
</jsp:include>

<div id="viewProfileDiv"></div>
<div id="bankLoginPageDiv"></div>


</body>
</html>