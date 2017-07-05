<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/dynamusic/servlet/form_handler/SongSearchFormHandler"/>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  SEARCH
  User can search for a song, using a fragment of its title.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
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
        <!-- *** Start page content *** -->
        <i> Please enter the name (or first few characters) of the song you're looking for: </i>
        <p>&nbsp;</p><br>

        <dsp:form action="<%=request.getRequestURI()%>" method="get">
        <div>
          <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
            <dsp:oparam name="output">
              <b><dsp:valueof param="message"/></b><br>
            </dsp:oparam>
            <dsp:oparam name="outputStart"><li></dsp:oparam>
            <dsp:oparam name="outputEnd"></li></dsp:oparam>
          </dsp:droplet>

          <p> <dsp:input type="text" size="40"
                         bean="SongSearchFormHandler.keywordInput"/> </p>
          <p> <dsp:input type="submit" value="search"
                         bean="SongSearchFormHandler.search"/> </p>
          <dsp:input bean="SongSearchFormHandler.successURL" type="hidden"
                     value="searchResults.jsp"/>
        </div>
        </dsp:form>

      </td>
    </tr>
  </table>


  <!-- *** End real content *** -->

  </BODY>
  </HTML>
</dsp:page>
