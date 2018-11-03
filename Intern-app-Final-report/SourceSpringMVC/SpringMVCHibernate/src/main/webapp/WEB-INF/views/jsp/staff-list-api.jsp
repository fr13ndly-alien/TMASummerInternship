<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Hello Spring MVC + Hibernate</title>
<style>
table, th, td {
  border: 1px solid black;
}
td {
  padding-right: 30px;
}
</style>
</head>
<%-- ${requestScope['javax.servlet.forward.request_uri']} current URL--%>
<body>
  <c:url value="/rest/staff-save/" var="urlSave"/>
  <c:url value="/staff-view/" var="urlView"/>
  <c:url value="/rest/staff-update/" var="urlUpdate"/>
  <c:url value="/rest/staff-delete/" var="urlDelete"/>
  <h1>List Staff:</h1>
  <a href="${urlSave}">Add Staff</a>
  <br />
  <br />


  <table>
    <tr>
      <th>id</th>
      <th>username</th>
      <th>name</th>
      <th>birthday</th>
      <th>gender</th>
      <th>address</th>
      <th>email</th>
      <th>phone</th>
      
      <th>View</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>
    <c:if test="${not empty staffs}">
      <c:forEach var="staff" items="${staffs}">
        <tr style="border: 1px black solid">
          <td>${staff.id}</td>
          <td>${staff.username}</td>
          <td>${staff.name}</td>
          <td>${staff.date_of_birth}</td>
          <td>${staff.gender}</td>
          <td>${staff.address}</td>
          <td>${staff.email}</td>
          <td>${staff.phone_number}</td>
          <td> <a href="${urlView}${staff.id}">View</a></td>
          <td> <a href="${urlUpdate}${staff.id}">Edit</a></td>
          <td> <a href="${urlDelete}${staff.id}">Delete</a></td>
        </tr>
      </c:forEach>
    </c:if>
  </table>

</body>
</html>