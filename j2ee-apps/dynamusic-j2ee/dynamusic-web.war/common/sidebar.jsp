<%@ taglib prefix="c" uri="/cTagLib" %>
<%@ taglib prefix="dsp" uri="/dspTaglib" %>


<%--<%@ taglib prefix="c" uri="/cTagLib" %>--%>
<!-------------------------------------------------------------
Dynamusic Site Mockup
Sidebar
Page fragment displaying the sidebar, common to all pages.
------------------------------------------------------------>
<c:url var="home" value="/home.jsp"/>
<c:url var="artists" value="/artists.jsp"/>
<c:url var="venues" value="/venues.jsp"/>
<c:url var="search" value="/search.jsp"/>
<c:url var="updateProfile" value="/updateProfile.jsp"/>
<c:url var="logout" value="/logout.jsp"/>

<%--<c:url value="../css/main.css"/>--%>
<dsp:page>
  <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>

  <div>
    <b>
      <dsp:a href="../home.jsp">HOME</dsp:a><br>
      <a href="<c:out value="${artists}"/>">Artists</a>    &nbsp;<br>
      <dsp:a href="../venues.jsp">Venues</dsp:a><br>
      <dsp:a href="../search.jsp">Search</dsp:a><br><br>

      <dsp:droplet name="Switch">
        <dsp:param name="value" bean="Profile.transient"/>

        <dsp:oparam name="false">
          <dsp:a href="../logout.jsp">Log Out</dsp:a>&nbsp;<br>
          <dsp:a href="../updateProfile.jsp">Profile</dsp:a><br>
          <dsp:a href="../playlists.jsp">My playlists</dsp:a>&nbsp;<br><br>
        </dsp:oparam>
        <dsp:oparam name="true">
          <dsp:a href="../login.jsp">Log In</dsp:a>&nbsp;<br><br>
        </dsp:oparam>

      </dsp:droplet>
    </b>
  </div>

</dsp:page>