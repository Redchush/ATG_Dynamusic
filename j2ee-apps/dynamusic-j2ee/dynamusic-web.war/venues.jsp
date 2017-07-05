<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  Venues
  Display local concert venues.

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Venues</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Venues"/>
  </dsp:include>
  <table width="700" cellpadding="8">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <p>Concert venues: <p>

        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
          <dsp:param name="queryRQL" value="ALL"/>
          <dsp:param name="repository" value="/dynamusic/EventsRepository"/>
          <dsp:param name="itemDescriptor" value="venue"/>
        <dsp:oparam name="outputStart"><ul></dsp:oparam>
        <dsp:oparam name="outputEnd"></ul></dsp:oparam>
        <dsp:oparam name="output">
          <li>
            <dsp:a href="venueDetails.jsp">
              <dsp:param name="itemId" param="element.id"/>
              <dsp:param name="dsource" value="venuelist"/>
              <dsp:valueof param="element.name"/>
            </dsp:a>
          </li>

        </dsp:oparam>
        <dsp:oparam name="empty">
          No venues found.
        </dsp:oparam>
        </dsp:droplet>

        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>

