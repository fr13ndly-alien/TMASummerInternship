<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Update staff info</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/js/bootstrap.min.js' />" rel="stylesheet"></link>
</head>
<body>
	<div class="row">
    <div class="col-md-4 col-md-offset-4">
    <form:form class="form-horizontal" action="${pageContext.request.contextPath}/rest/staff-save" method="POST" modelAttribute="staff">
      <%-- <form:form class="form-horizontal" action="${pageContext.request.contextPath}/rest/staff-save" method="POST" modelAttribute="staff"> --%>
        <fieldset>
          <!-- Form Name -->
          <legend>Persional Details</legend>
			
		 <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">ID</label>
            <div class="col-sm-10">
              <form:input type="text" path="id" value="${staff.id}" class="form-control" />
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">User</label>
            <div class="col-sm-10">
              <form:input type="text" path="username" value="${staff.username}" class="form-control"/>
            </div>
          </div>		
			
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Name</label>
            <div class="col-sm-10">
              <form:input type="text" path="name" placeholder="${staff.name}" class="form-control"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">D.O.B</label>
            <div class="col-sm-10">
              <form:input type="text" path="date_of_birth" placeholder="${staff.date_of_birth}" class="form-control"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Gender</label>
            <div class="col-sm-10">
			  <form:select path="gender" class="form-control" id="sel1">
			  	<c:set var = "gender" scope = "session" value = "${staff.gender}"/>
			  	<c:if test = "${gender == 'Male'}">
			  		<option selected="selected">Male</option>
				    <option>Female</option>
				    <option>Unidentified</option>
			  	</c:if> 
			    <c:if test = "${gender == 'Female'}">
			  		<option>Male</option>
				    <option selected="selected">Female</option>
				    <option>Unidentified</option>
			  	</c:if> 
			  </form:select>
            </div>
          </div>
		
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Address</label>
            <div class="col-sm-10">
              <form:input type="text" path="address" placeholder="${staff.address}" class="form-control"/>
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Email</label>
            <div class="col-sm-10">
              <form:input type="text" path="email" placeholder="${staff.email}" class="form-control"/>
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Phone</label>
            <div class="col-sm-10">
              <form:input type="text" path="phone_number" placeholder="${staff.phone_number}" class="form-control"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="submit" class="btn btn-primary">Save</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form:form>
    </div>
</div>
	
</body>
</html>