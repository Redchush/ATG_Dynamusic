<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/dynamusic/servlet/form_handler/SongSearchFormHandler"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  SEARCH RESULTS
  Display results of a user search, as links to song, artist,
  and album pages.
  ------------------------------------------------------------->
  <HTML>
  <HEAD>
    <TITLE>Dynamusic Search Results</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Search"/>
  </dsp:include>
  <table width="700" cellpadding="8">
    <tr>
      <!-- Sidebar -->
      <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td valign="top" class="ff-1">
        <p>The following songs match your criteria, <span class="red"><dsp:valueof bean="SongSearchFormHandler.keywordInput"/></span>:<p>
        <!-- *** Start page content *** -->
        <dsp:droplet name="ForEach">
          <dsp:param name="array" bean="SongSearchFormHandler.searchResults"/>
          <dsp:oparam name="outputStart">

            <ul>
          </dsp:oparam>
          <dsp:oparam name="outputEnd"></ul></dsp:oparam>
          <dsp:oparam name="output">
            <li>
              <dsp:a href="song.jsp">
                <dsp:param name="itemId" param="element.id"/>
                <dsp:valueof param="element.title"/>
              </dsp:a> by
              <dsp:a href="artistDetails.jsp">
                <dsp:param name="itemId" param="element.artist.id"/>
                <dsp:valueof param="element.artist.name"/>
              </dsp:a>
            </li>
          </dsp:oparam>
          <dsp:oparam name="empty">
            <p>No results found</p>
          </dsp:oparam>

        </dsp:droplet>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
