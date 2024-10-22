<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>thrill.io</title>
</head>
<body style="font-family:Arial;font-size:20px;">
	<div style="height:65px;align: center;background: #DB5227;font-family: Arial;color: white;">
		<br><b style="font-family:garamond;font-size:34px;margin:0px 0px 0px 10px;color:white;text-decoration: none;">
		thrill.io</b>
	</div>
	<br><br>
	<b>Invalid Email or Password!</b></br>
	<b><a href="<%=request.getContextPath() %>/" style="font-family:garamond;font-size:34px;margin:0px 0px 0px 10px;color:green;text-decoration: none;">Retry</a></b>
	

</body>
</html>