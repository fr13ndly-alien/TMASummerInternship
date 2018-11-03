<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Products</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/css/viewproducts.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/js/bootstrap.min.js' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/js/jquery-3.3.1.min.js' />" rel="stylesheet"></link>
</head>
<body>
	<div id="wrapper">
		<div id="info">
			<h1>Products</h1>
		</div>		
		<div id="grid">  
			<c:if test="${not empty listProduct}">
				<c:forEach var="product" items="${listProduct}">
				    <div class="product">
				        <div class="make3D">
				            <div class="product-front">
				                <div class="shadow"></div>
				                <img src="<c:url value='${product.img_source}' />" alt="img" />
				                <div class="image_overlay"></div>
				                <div class="stats">        	
				                    <div class="stats-container">
				                        <span class="product_price">$${product.price}</span>
				                        <span class="product_name">${product.name}</span>    
				                        <p style="color:#2ecc71">${product.status}</p>                                                                                      
				                    </div>                         
				                </div>
				            </div>         
				        </div>	
				    </div>  
				</c:forEach>
		    </c:if>	    
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/viewproducts.js' />"></script>
</body>
</html>