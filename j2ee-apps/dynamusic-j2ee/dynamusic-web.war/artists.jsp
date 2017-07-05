<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  ARTISTS
  List of artists whose songs appear on this site.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Artists</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Artists"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar" >
        <dsp:include page="common/sidebar.jsp"/>
        <br>
        <b class="sidebar"><dsp:a href="newArtist.jsp">Add Artist</dsp:a></b>
      </td>
      <!-- Page Body -->
      <td class="body"><!-- *** Start page content *** -->
        <div>Current artists:</div>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
          <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
          <dsp:param name="itemDescriptor" value="artist"/>
          <dsp:param name="queryRQL" value="ALL ORDER BY name"/>

          <dsp:oparam name="outputStart"><ol></dsp:oparam>
          <dsp:oparam name="outputEnd"></ol></dsp:oparam>
          <dsp:oparam name="output">
            <li> <dsp:a href="artistDetails.jsp">
              <dsp:param name="itemId" param="element.id"/>
              <dsp:valueof param="element.name"/>
            </dsp:a></li>
          </dsp:oparam>
          <dsp:oparam name="empty">
            <li>No songs for this artist</li>
          </dsp:oparam>
        </dsp:droplet>

      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>

