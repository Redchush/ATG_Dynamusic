<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
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

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="(TEMPLATE)"/>
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



          <!-- *** End content *** -->
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>

