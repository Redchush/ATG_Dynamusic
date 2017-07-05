<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<%@ taglib prefix="c" uri="/cTagLib" %>

<dsp:page>
  <dsp:importbean bean="/dynamusic/ViewItemEventSender"/>
  <dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  ARTIST DETAILS
  Description of an artist and list of albums.

  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>

  <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="empty">
      <dsp:include page="common/not_found.jsp">
        <dsp:param name="itemId" param="itemId"/>
        <dsp:param name="notFoundType" value="Artist"/>
      </dsp:include>
    </dsp:oparam>
    <dsp:oparam name="output">

      <dsp:droplet name="ViewItemEventSender">
        <dsp:param name="eventobject" param="element"/>
      </dsp:droplet>

      <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.name"/>
      </dsp:include>

      <table width="700" cellpadding="8" class="ff">
        <tr>
          <!-- Sidebar -->
          <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="common/sidebar.jsp"/>
            <br>
            <b class="sidebar"><dsp:a href="editArtist.jsp">
              <dsp:param name="artistId" param="element.id"/>
              Edit Artist
            </dsp:a></b>
          </td>
          <!-- Page Body -->
          <td VALIGN=TOP>
            <table CELLPADDING=10 >
              <tr>
                <td VALIGN=TOP><img SRC="<dsp:valueof param="element.photoURL"/>"></td>
                <td class="ff ff-2">
                  <div>
                    <dsp:valueof param="element.description"/>
                  </div>
                </td>
              </tr>
            </table>
            <div>Albums</div>
            <dsp:setvalue param="artistId" paramvalue="element.id"/>
            <dsp:droplet name="RQLQueryForEach">
              <dsp:param name="queryRQL" value="artist.id = :artistId"/>
              <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
              <dsp:param name="itemDescriptor" value="album"/>
              <dsp:setvalue param="album" paramvalue="element"/>

              <dsp:oparam name="outputStart"><ul></dsp:oparam>
              <dsp:oparam name="outputEnd"></ul></dsp:oparam>

              <dsp:oparam name="output">
                <li>
                  <dsp:a href="albumDetails.jsp">
                    <dsp:param name="itemId" param="album.id"/>
                    <dsp:param name="dsource" value="artist-details"/>
                    <dsp:valueof param="album.title"/>
                  </dsp:a>
                </li>
              </dsp:oparam>
              <dsp:oparam name="empty">
                No albums found for this artist.
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