<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>
<%@ taglib prefix="c" uri="/cTagLib" %>


<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/FeaturedSongs"/>
  <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

  <dsp:importbean bean="/atg/targeting/TargetingForEach"/>
  <dsp:importbean bean="/atg/targeting/TargetingRandom"/>

  <dsp:importbean bean="/atg/registry/Slots/AlbumPromo"/>

  <dsp:importbean bean="/atg/registry/RepositoryTargeters/EventsRepository/VenueTargeter"/>
  <dsp:importbean bean="/atg/registry/RepositoryTargeters/UserProfiles/UserInterestTargeter"/>
  <!-------------------------------------------------------------
  Dynamusic Site  DAF Site Mockup
  HOME
  Central page for the site; landing point following login,
  providing starting point for site's pages.
  Version 4 - adds slot to advertise concerts for viewed
  artists.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Home"/>
  </dsp:include>

  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <table class="t_body">
          <tr>
            <td>
                <%--<p>You is <dsp:valueof bean="Profile"/> </p>--%>
              <dsp:droplet name="/atg/dynamo/droplet/Switch">
                <dsp:param bean="Profile.transient" name="value"/>
                <dsp:oparam name="true">
                  Welcome to Dynamusic, unauth
                  <dsp:a href="newProfile.jsp">Click here</dsp:a> to register.
                </dsp:oparam>
                <dsp:oparam name="false">
                  <p>Welcome, <dsp:valueof bean="Profile.firstName"/></p>
                </dsp:oparam>
              </dsp:droplet>

              This week's featured songs are:
              <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param name="array" bean="FeaturedSongs.songs"/>
                <dsp:oparam name="outputStart"><ul></dsp:oparam>
                <dsp:oparam name="outputEnd"></ul></dsp:oparam>
                <dsp:oparam name="output">
                  <li><dsp:valueof param="element"/></li>
                </dsp:oparam>
                <dsp:oparam name="empty">
                  No featured songs this week.
                </dsp:oparam>
              </dsp:droplet>

            </td>
            <td width="160" align="center">
              <dsp:droplet name="TargetingForEach">
                <dsp:param name="targeter" bean="AlbumPromo"/>
                <dsp:oparam name="outputStart">
                  Featured Album:<br>
                </dsp:oparam>
                <dsp:oparam name="output">
                  <dsp:a href="albumDetails.jsp">
                    <dsp:param name="itemId" param="element.id"/>
                    <dsp:param name="dsource" value="albumpromo"/>
                    <img src="<dsp:valueof param="element.coverURL"/>"><br>
                    <b><dsp:valueof param="element.title"/> </b>
                    -  <dsp:valueof param="element.artist.name"/>
                  </dsp:a>
                </dsp:oparam>
              </dsp:droplet>

            </td>
          </tr>
        </table>
        <div>
          <dsp:droplet name="TargetingForEach">
            <dsp:param name="targeter" bean="VenueTargeter"/>
            <dsp:oparam name="outputStart">
              Playing at a venue near you... <br>
              <ul>
            </dsp:oparam>
            <dsp:oparam name="output">
              <li>
                <dsp:a href="venueDetails.jsp">
                  <dsp:param name="itemId" param="element.id"/>
                  <dsp:valueof param="element.name"/>
                </dsp:a>
              </li>
            </dsp:oparam>
            <dsp:oparam name="outputEnd"></ul></dsp:oparam>
          </dsp:droplet>
        </div>
        <div>
          <dsp:droplet name="TargetingRandom">
            <dsp:param name="targeter" bean="UserInterestTargeter"/>
            <dsp:param name="howMany" value="3"/>

            <dsp:oparam name="outputStart">
              User's with same interests: <br>
              <ul>
            </dsp:oparam>
            <dsp:oparam name="output">
              <li>
                <dsp:a href="userDetails.jsp">
                  <dsp:param name="itemId" param="element.id"/>
                  <dsp:valueof param="element.firstName"/>
                  <span> </span>
                  <dsp:valueof param="element.lastName"/>
                </dsp:a>
              </li>
            </dsp:oparam>
            <dsp:oparam name="outputEnd"></ul></dsp:oparam>
          </dsp:droplet>
        </div>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
