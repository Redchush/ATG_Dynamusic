<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ taglib prefix="dps" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  <TEMPLATE>

  Starter page for any JSP required.

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>(TEMPLATE)</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="My Playlists"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <dsp:droplet name="ForEach">

          <dsp:param name="array" bean="Profile.playlists"/>
          <dsp:oparam name="outputStart">
            You playlists are:
            <ul>
          </dsp:oparam>
          <dsp:oparam name="output">
            <li>
              <dsp:a href="playlistDetails.jsp" iclass="green">
                <dsp:param name="itemId" param="element.repositoryId"/>
                <dsp:valueof param="element.name"/>
              </dsp:a><br>
              <span class="ff-1">
                <dsp:valueof param="element.description"/>
              </span><br>
            </li>
          </dsp:oparam>
          <dsp:oparam name="outputEnd"></ul></dsp:oparam>
          <dsp:oparam name="empty">
            You didn't create any playlist.<br>
          </dsp:oparam>
        </dsp:droplet>
        <br>
        <dsp:a href="newPlaylist.jsp">
          Create new playlist
        </dsp:a>
        <!-- *** Start page content *** -->
        <!-- *** End content *** -->

      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>


