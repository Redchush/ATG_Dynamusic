<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="/dynamusic/playlist/PlaylistFormHandler"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>(TEMPLATE)</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="New Playlist"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <dsp:form action="<%=request.getRequestURI()%>" method="post">
          <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

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
          Enter playlist name:<br>
          <dsp:input bean="PlaylistFormHandler.value.name" name="name" size="30" type="text"/><br>
          Enter playlist description:<br>
          <dsp:textarea bean="PlaylistFormHandler.value.description" name="description" rows="10" type="text"/><br>

          Publish playlist?<br>
          <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="true">yes</dsp:input>
          <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="true">no</dsp:input>


          <dsp:input bean="PlaylistFormHandler.cancelURL" type="hidden" value="playlists.jsp"/>
          <dsp:input bean="PlaylistFormHandler.cancel" type="Submit" value="Cancel"/>
          <dsp:input bean="PlaylistFormHandler.createSuccessURL" type="hidden" value="playlists.jsp"/>
          <dsp:input bean="PlaylistFormHandler.create" type="Submit" value="Add Playlist"/>
        </dsp:form>

      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>

