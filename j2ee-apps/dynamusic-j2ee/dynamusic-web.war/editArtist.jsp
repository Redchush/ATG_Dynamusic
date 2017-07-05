<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="atg/dynamo/droplet/Switch" var="Switch"/>
  <dsp:importbean bean="atg/dynamo/droplet/ErrorMessageForEach" var="ErrorMessageForEach"/>
  <dsp:importbean bean="/dynamusic/ArtistFormHandler"/>
  <%--<dsp:importbean bean="/dynamusic/servlet/form_handler/ArtistFormHandler"/>--%>
<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  EDIT ARTIST
  Modify description of an artist and her/his list of albums.
  ------------------------------------------------------------->
<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Edit Artist"/>
  </dsp:include>
    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="common/sidebar.jsp"/>
        </td>
        <!-- Page Body -->
        <td valign="top" class="ff ff-1">
          <dsp:setvalue bean="ArtistFormHandler.repositoryId"
                        paramvalue="artistId"/>

          <dsp:valueof bean="ArtistFormHandler.repositoryId"/>
          <!-- *** Start page content *** -->
            <dsp:form action="<%=request.getRequestURI()%>">
              <dsp:input bean="ArtistFormHandler.repositoryId"
                         type="hidden" paramvalue="artistId"/>
              <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                <dsp:oparam name="output">
                  <b><dsp:valueof param="message"/></b><br>
                </dsp:oparam>
                <dsp:oparam name="outputStart"><li></dsp:oparam>
                <dsp:oparam name="outputEnd"></li></dsp:oparam>
              </dsp:droplet>

              <table cellpadding="10" class="form_table">
                <tr>
                  <td>Artist Name</td>
                  <td class="cursor-1">
                    <dsp:input bean="ArtistFormHandler.value.name" type="text"
                                size="30" required="true"/>
                  </td>
                </tr>
                <tr>
                  <td>Photo URL</td>
                  <td class="cursor-1">
                    <dsp:input bean="ArtistFormHandler.value.photoURL"
                         type="text" size="30"/>
                  </td>
                </tr>
                <tr>
                  <td valign="top" align="right">Description</td>
                  <td valign="top">
                      <dsp:textarea bean="ArtistFormHandler.value.description" cols="60"                                    rows="10" wrap="SOFT"/>
                  </td>
                </tr>
                <tr>
                   <td> </td>
                   <td>
                     <dsp:input type="hidden" value="success.jsp"
                                bean="ArtistFormHandler.updateSuccessURL" />
                     <dsp:input type="hidden" value="success.jsp"
                                bean="ArtistFormHandler.deleteSuccessURL"/>
                     <dsp:input type="submit" value="Save Changes"
                                bean="ArtistFormHandler.update" /> &nbsp;
                     <dsp:input type="submit" bean="ArtistFormHandler.delete"
                                value="Delete This Artist"/>
                   </td>
              </table>

            </dsp:form>
            
          <!-- *** End real content *** -->
          

        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>


