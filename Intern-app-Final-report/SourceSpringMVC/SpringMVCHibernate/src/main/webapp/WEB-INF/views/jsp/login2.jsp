<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login page</title>
	<link href="<c:url value='/resources/css/loginstyle.css' />" rel="stylesheet"></link>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css'>
</head>
<body>
	 <div class="main">
		<div class="login-form">
			<h1>Member Login</h1>
			<div class="head">
				<img src="<c:url value='/resources/images/user.png' />" alt=""/>
			</div>
			<c:url var="loginUrl" value="/login" />
			<form action="${loginUrl}" method="post">
				<c:if test="${param.error != null}">
                	<div class="alert alert-danger">
                     	<p>Invalid username and password.</p>
                     </div>
                </c:if>
                <c:if test="${param.logout != null}">
					 <div style="background-color:#dff0d8; color: #3c763d; border: 1px solid transparent; border-radius: 4px; padding: 5px; margin-bottom: 8px;">
                     	<p>You have been logged out successfully.</p>
                     </div>
                </c:if>
				<input type="text" class="text" value="USERNAME" id="username" name="username" 
					onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USERNAME';}" >
				<input type="password" value="Password" id="password" name="password"
				 	onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="submit">
					<input type="submit" value="Log in">
				</div>
				<a href="/SpringMVCHibernate/api-page">Try RESTful API</a>	
			</form>
			</div>
	</div>
</body>
</html>