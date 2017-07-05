<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="/atg/targeting/RepositoryLookup"/>
  <dsp:importbean bean="/atg/userprofiling/ProfileAdapterRepository"/>
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

  <dsp:droplet name="/atg/targeting/RepositoryLookup">

    <dsp:param name="repository" bean="ProfileAdapterRepository"/>
    <dsp:param name="itemDescriptor" value="playlist"/>
    <dsp:param name="id" param="itemId"/>

    <dsp:oparam name="output">

      <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.name"/>
      </dsp:include>
      <table width="700" cellpadding="8">
        <tr>
          <!-- Sidebar -->
          <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="common/sidebar.jsp"/>
          </td>
          <!-- Page Body -->

          <td valign="top" class="ff">


            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="element.songs"/>

              <dsp:oparam name="outputStart">
                Playlist's songs
                <ul>
              </dsp:oparam>
              <dsp:oparam name="output">
                <li class="ff-1">
                  <dsp:a href="song.jsp">
                    <dsp:param name="itemId" param="element.id"/>
                    <dsp:valueof param="element.title"/> - <dsp:valueof param="element.artist.name"/>
                  </dsp:a>
                </li>
              </dsp:oparam>
              <dsp:oparam name="outputEnd"></ul></dsp:oparam>
              <dsp:oparam name="empty">
                <span class="ff-1">No one song in this playlist.</span>
              </dsp:oparam>
            </dsp:droplet>
          </td>

      </table>
    </dsp:oparam>
    <dsp:oparam name="empty">
      <dsp:include page="common/not_found.jsp">
        <dsp:param name="notFoundType" value="Playlist"/>
        <dsp:param name="itemId" param="itemId"/>
      </dsp:include>

    </dsp:oparam>
  </dsp:droplet>

  </BODY>
  </HTML>
</dsp:page>
