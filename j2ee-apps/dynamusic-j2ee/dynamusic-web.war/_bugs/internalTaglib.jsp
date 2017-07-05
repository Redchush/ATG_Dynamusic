<%@ taglib prefix="c" uri="/cTagLib" %>
<%@ taglib prefix="dsp" uri="/dspTaglib" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

<html>
<head>
  <title>Title</title>
</head>
<body>

<c:url value="/home.jsp" var="home"/>
<%--not broken LInk--%>
<a href="<c:out value="${home}"/>" >HOME</a><br><br>

<%--<c:set var="army" value="army"/>--%>
C:out show value: <br>
<c:out value="${home}"/>
<br>
Simple $ {} not work: <br>
${home}
<br><br>

<dsp:getvalueof id="fN" bean="Profile.firstName" />
<dsp:getvalueof id="profile" bean="Profile" />

${fN}
<c:out value="${fN}">NOT</c:out>
<c:out value="${fN}">NOT</c:out>

<br>
<dsp:valueof   bean="Profile"/>
<%--<dsp:valueof   bean="profile.transient"/>--%>
<c:out value="${fN}">NOT</c:out>
<%--<c:set var="example" value="example"/>--%>

</body>
</html>
</dsp:page>