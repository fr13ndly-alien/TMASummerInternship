<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>User Page</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/resources/css/user.css' />" rel="stylesheet"></link>
</head>
<body style="background:#95a5a6">
  	<%-- Dear <strong>${user}</strong>, Welcome to User Page.
    <a href="<c:url value="/logout" />">Logout</a> --%>
	<div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Staff profile</h3>
            </div>
            <div class="panel-body">
              <div class="row">
              	 <c:if test="${not empty staff}">
              	 	<c:set var = "gender" scope = "session" value = "${staff.gender}"/>
				    <c:if test = "${gender == 'Male'}">
						<div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="<c:url value='/resources/images/staff_male.png' />" class="img-circle img-responsive"> </div>
				    </c:if> 
				    <c:if test = "${gender == 'Female'}">
						<div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="<c:url value='/resources/images/staff_female.png' />" class="img-circle img-responsive"> </div>
				    </c:if>                   	
                 </c:if>
                 <c:if test="${empty staff}">
                  	<div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="<c:url value='/resources/images/question.png' />" class="img-circle img-responsive"> </div>
                 </c:if>             
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Identification</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.id}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>
                      <tr>
                        <td>Name</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.name}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>
                      <tr>
                        <td>Date of Birth</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.date_of_birth}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>                  
                       <tr>
                        <td>Gender</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.gender}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>
                        <tr>
                        <td>Address</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.address}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>
                      <tr>
                        <td>Email</td>                       
                        <c:if test="${not empty staff}">
                        	<td><a href="mailto:info@support.com">${staff.email}</a></td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>
                      </tr>
                      <tr>
                        <td>Phone Number</td>
                        <c:if test="${not empty staff}">
                        	<td>${staff.phone_number}</td>
                        </c:if>
                        <c:if test="${empty staff}">
                        	<td>N.A</td>
                        </c:if>                                               
                      </tr>                     
                    </tbody>
                  </table>
                  <c:if test="${not empty staff}">
	                  <div class="input-group" style = "display:inline-block">
		                  <a href="staff-update/${staff.id}" class="btn btn-primary">Edit profile</a>
		                  <a href="viewproducts" class="btn btn-primary">View products</a>
		                  <a href="logout" class="btn btn-primary">Log out</a>
	                  </div>
                  </c:if> 
                  <c:if test="${empty staff}">
	                  <div class="input-group" style = "display:inline-block">
			             <a href="logout" class="btn btn-primary">Log out</a>
		             </div>
	             </c:if> 
                </div>
              </div>
            </div>       
          </div>
        </div>
      </div>
    </div>
</body>
</html>