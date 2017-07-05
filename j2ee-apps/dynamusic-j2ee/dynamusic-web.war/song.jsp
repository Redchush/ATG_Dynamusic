<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/playlist/PlaylistFormHandler"/>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>

  <%-- Required input param: itemId (id of the song to display --%>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  SONG
  Description of an individual song.
  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Song</TITLE>
  </HEAD>
  <BODY>
  <dsp:droplet name="/dynamusic/SongLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">
      <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.title"/>
      </dsp:include>

      <table width="700" cellpadding="8" class="ff">
        <tr>
          <!-- Sidebar -->
          <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="common/sidebar.jsp"/>
          </td>
          <!-- Page Body -->
          <td valign="top">
            <!-- *** Start page content *** -->
            <table cellpadding="10" class="ff">
              <tr>
                <td valign="top" align="right"> Song: </td>
                <td valign="top" class="ff">
                  <i> <dsp:valueof param="element.title"/> </i>
                  &nbsp
                  <a class="ff-2" href="<dsp:valueof param="element.downloadURL"/>">Download</a>
                </td>
              </tr>
              <tr>
                <td valign="top" align="right"> Artist: </td>
                <td valign="top" class="ff-1">
                  <b>
                    <dsp:a href="artistDetails.jsp">
                      <dsp:param name="itemId" param="element.artist.id"/>
                      <dsp:valueof param="element.artist.name"/>
                    </dsp:a> </b>
                </td>
              </tr>
              <tr>
                <td valign="top" align="right"> Album(s): </td>
                <td valign="top" class="ff-1">
                  <b>
                    <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                      <dsp:param name="queryRQL" value="songList INCLUDES :element"/>
                      <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                      <dsp:param name="itemDescriptor" value="album"/>
                      <dsp:oparam name="output">
                        <dsp:a href="albumDetails.jsp">
                          <dsp:param name="itemId" param="element.id"/>
                          <dsp:valueof param="element.title"/>
                        </dsp:a>
                      </dsp:oparam>
                      <dsp:oparam name="empty">
                        No albums found for this song.
                      </dsp:oparam>
                    </dsp:droplet>
                  </b>
                </td>
              </tr>

            </table>

            &nbsp;<p>
            <i class="ff ff-2">
              <dsp:valueof param="element.description"/>
            </i> </p>

            <dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="Profile.transient" name="value"/>

            <dsp:oparam name="false">
            <b>
              <dsp:form action="<%=request.getRequestURI()%>">
                <dsp:input type="hidden" bean="PlaylistFormHandler.songId" paramvalue="element.id"/>

                <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                  <dsp:oparam name="outputStart">
                    <LI>
                  </dsp:oparam>
                  <dsp:oparam name="output">
                    <b><dsp:valueof param="message"/> </b><br>
                  </dsp:oparam>
                  <dsp:oparam name="outputEnd">
                    </LI>
                  </dsp:oparam>
                </dsp:droplet>

                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                  <dsp:param bean="Profile.playlists" name="array"/>
                  <dsp:oparam name="outputStart">
                    Select playlist name:<br>
                    <dsp:select bean="PlaylistFormHandler.repositoryId" priority="10">
                      <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                        <dsp:param bean="Profile.playlists" name="array"/>
                        <dsp:oparam name="output">
                          <option value="<dsp:valueof param='element.repositoryId'/>">
                            <dsp:valueof param="element.name"/>
                          </option>
                        </dsp:oparam>
                        <dsp:oparam name="empty">
                          You hadn't create any playlist. Create one? <dsp:a href="newPlaylist.jsp"> YES</dsp:a>
                        </dsp:oparam>
                      </dsp:droplet>
                    </dsp:select>
                  </dsp:oparam>
                  <dsp:oparam name="empty">
                    You hadn't create any playlist. Create one? <dsp:a href="newPlaylist.jsp"> YES</dsp:a> <br>
                  </dsp:oparam>
                </dsp:droplet>

                <%-- this is here so that if the page is redisplayed, it will know which song item to display --%>
                <input type="hidden" name="itemId" value="<dsp:valueof param='itemId'/>"/>

                <dsp:input type="hidden" bean="PlaylistFormHandler.addSongSuccessURL" value="playlists.jsp"/>
                <dsp:input type="hidden" bean="PlaylistFormHandler.addSongErrorURL" value="song.jsp"/>

                <br><dsp:input bean="PlaylistFormHandler.addSong" type="Submit" value="Add to Playlist"/>
              </dsp:form>
            </b>

            </dsp:oparam>
            <dsp:oparam name="true">
            Register to create and add songs to playlist
            </dsp:oparam>
            </dsp:droplet>
            <br>
              <dsp:setvalue param="song_id" paramvalue="itemId"/>
              <dsp:setvalue param="user_id" beanvalue="Profile.id"/>

            <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
              <dsp:param name="queryRQL"
                         value="shareProfile = true AND id != :user_id AND
                         playlists INCLUDES ITEM (publish = true AND
                            songs INCLUDES ITEM (id = :song_id))"/>
              <dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
              <dsp:param name="itemDescriptor" value="user"/>
              <dsp:param name="howMany" value="10"/>

            <dsp:oparam name="outputStart">Same song have this users:<ul></dsp:oparam>
            <dsp:oparam name="outputEnd"></ul></dsp:oparam>

            <dsp:oparam name="output">
            <li>
              <dsp:a href="userDetails.jsp">
                <dsp:param name="itemId" param="element.id"/>
                <dsp:valueof param="element.firstName"/> - <dsp:valueof param="element.lastName"/>
              </dsp:a>
            </li>
            </dsp:oparam>
            <dsp:oparam name="empty">

            </dsp:oparam>
            </dsp:droplet>
            <!-- *** End real content *** -->

      </table>
    </dsp:oparam>
  </dsp:droplet>
  </BODY>
  </HTML>
</dsp:page>
