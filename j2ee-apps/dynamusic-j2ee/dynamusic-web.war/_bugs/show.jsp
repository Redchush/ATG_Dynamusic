<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 13.05.2017
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Title</title>
</head>
<body>

<c:url value="/home.jsp" var="home"/>


<%--broken LInk--%>
<a href="<c:out value="${home}"/>" >Broken link to home</a><br>

<%--<c:set var="army" value="army"/>--%>
C:out $ {url} not show link (but show the same in sidebar.jsp): <br>
<c:out value="${home}"/>

<br>
Compare:
<a href="internalTaglib.jsp">Taglib which in web.xml</a>



</body>
</html>
