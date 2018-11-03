<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add new product</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/js/bootstrap.min.js' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form:form class="form-horizontal" action="${pageContext.request.contextPath}/editProduct" method="POST" modelAttribute="product">
        <fieldset>
          <!-- Form Name -->
          <legend>Add product</legend>
							
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">ID</label>
            <div class="col-sm-10">
              <form:input type="text" path="id" placeholder="product's id" class="form-control" readonly="true"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Name</label>
            <div class="col-sm-10">
              <form:input type="text" path="name" placeholder="product's name" class="form-control"/>
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Price</label>
            <div class="col-sm-10">
              <form:input type="text" path="price" placeholder="product's price" class="form-control"/>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Image</label>
            <div class="col-sm-10">             
              <input type="file" class="form-control-file" id="imgUpload" onchange="myFunction()"> 
              <form:input type="hidden" path="img_source" placeholder="product's img" class="form-control" id="imgUrl"/> 
              <%-- <form:input type="text" path="img_source" placeholder="product's img" class="form-control" id="imgUrl"/> --%>        
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Status</label>
            <div class="col-sm-10">
              <form:input type="text" path="status" placeholder="product's status" class="form-control"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-left">
                <button type="submit" class="btn btn-primary">Add</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form:form>
    </div>
</div>
<script>
	function myFunction() {
	    var url = document.getElementById("imgUpload").value;	    
	    document.getElementById("imgUrl").value = "/resources/images/food/" + url.substring(url.lastIndexOf("\\")+1);	    
	}
</script>
</body>
</html>