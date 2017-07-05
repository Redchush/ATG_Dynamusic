<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="atg/dynamo/droplet/Switch" var="Switch"/>
  <dsp:importbean bean="atg/dynamo/droplet/ErrorMessageForEach" var="ErrorMessageForEach"/>
  <dsp:importbean bean="/dynamusic/ArtistFormHandler" var="ArtistFormHandler"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  ALBUM DETAILS
  Description of an album and list of songs.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Album</TITLE>
  </HEAD>
  <BODY>
  <dsp:droplet name="/dynamusic/AlbumLookupDroplet">
    <dsp:param name="id" param="itemId"/>

    <dsp:oparam name="empty">
      <dsp:include page="common/not_found.jsp">
        <dsp:param name="itemId" param="itemId"/>
        <dsp:param name="notFoundType" value="Album"/>
      </dsp:include>
    </dsp:oparam>
    <dsp:oparam name="output">
      <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.title"/>
      </dsp:include>
      <table width="700" cellpadding="8" class="ff">
        <tr>
          <td class="sidebar">
            <dsp:include page="common/sidebar.jsp"/>
            <br>
            <b class="sidebar">Edit Artist Info</b>
          </td>
          <!-- Page Body -->
          <td VALIGN=TOP>
            <table CELLPADDING=10 >
              <tr>
                <td VALIGN=TOP><img SRC="<dsp:valueof param="element.coverURL"/>"></td>
                <td class="ff ff-2">
                  <div>
                    <dsp:valueof param="element.description"/><br>
                    <b><p>Published: <dsp:valueof param="element.date" date="MMM dd,yyyy"/></p></b>
                  </div>
                </td>
              </tr>
            </table>
            <div>Songs:</div>

            <dsp:setvalue param="albumSongs" paramvalue="element.songList"/>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="albumSongs"/>

              <dsp:oparam name="outputStart"><ul></dsp:oparam>
              <dsp:oparam name="outputEnd"></ul></dsp:oparam>

              <dsp:oparam name="output">
              <li>
                <dsp:a href="song.jsp">
                  <dsp:param name="itemId" param="element.id"/>
                  <dsp:valueof param="element.title"/>
                </dsp:a>
              </li>
              </dsp:oparam>
              <dsp:oparam name="empty">
                No songs found for this artist.
              </dsp:oparam>
            </dsp:droplet>
              <!-- *** End real content *** --></td>
        </tr>
      </table>
    </dsp:oparam>
  </dsp:droplet>


  </BODY>
  </HTML>
</dsp:page>