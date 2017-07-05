<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="atg/dynamo/droplet/Switch" var="Switch"/>
  <dsp:importbean bean="atg/dynamo/droplet/ErrorMessageForEach" var="ErrorMessageForEach"/>
  <dsp:importbean bean="/dynamusic/ArtistFormHandler" var="ArtistFormHandler"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  NEW ARTIST
  Add description of an artist and her/his list of albums.
  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
  <!-- (replace this entire table by dynamically including
        common/header.html) -->
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="New Artist"/>
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
        <dsp:form action="<%=request.getRequestURI()%>">
          <dsp:droplet name="Switch">
            <dsp:param bean="ArtistFormHandler.formError" name="value"/>
            <dsp:oparam name="true">
              <dsp:droplet name="ErrorMessageForEach">
                <dsp:param bean="ArtistFormHandler.formExceptions" name="exceptions"/>
                <dsp:oparam name="output">
                  <dsp:valueof param="message"/>
                </dsp:oparam>
              </dsp:droplet>
            </dsp:oparam>
          </dsp:droplet>

          <dsp:input bean="ArtistFormHandler.createSuccessURL" type="hidden" value="artists.jsp"/>
          <table cellpadding="10" class="form_table">
            <tr>
              <td>Artist Name:</td>
              <td>
                <!-- DATA(1) Artist name -->
                <dsp:input type="text" bean="ArtistFormHandler.value.name" required="true"/> &nbsp;
              </td>
            </tr>
            <tr>
              <td>Image Path:</td>
              <td>
                <!-- DATA(2) Image path -->
                <dsp:input bean="ArtistFormHandler.value.photoURL" type="text"/>
              </td>
            </tr>
            <tr>
              <td valign="top">Description:</td>
              <td valign="top">
                <!-- Data(3) Artist description -->
                <dsp:textarea bean="ArtistFormHandler.value.description" cols="60" rows="10" wrap="SOFT"/>
              </td>
            </tr>
            <tr>
              <td> </td>
              <td>
                <!-- ACTION(a) Save data entered, and go to the artistDetails page where we can show the info on our newly-entered artist -->
                <dsp:input bean="ArtistFormHandler.create" type="submit" value="Create artist entry"/>
              </td>
            </tr>
          </table>
        </dsp:form>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>

