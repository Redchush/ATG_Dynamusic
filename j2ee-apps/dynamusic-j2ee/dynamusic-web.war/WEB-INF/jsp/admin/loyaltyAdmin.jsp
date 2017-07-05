
<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>
<%@ taglib prefix="c" uri="/cTagLib" %>


<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/lp/handler/LoyaltyFormHandler"/>

  <!-------------------------------------------------------------
  Dynamusic Site  DAF Site Mockup
  HOME
  Central page for the site; landing point following login,
  providing starting point for site's pages.
  Version 4 - adds slot to advertise concerts for viewed
  artists.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Home"/>
  </dsp:include>

  <table width="700" cellpadding="8">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
        <div>
          <b>


          </b>
        </div>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->

        <dsp:droplet name="/atg/userdirectory/droplet/HasFunction">
          <dsp:param name="function" value="loyaltyAdministrator"/>
          <dsp:param name="userId" bean="/atg/userprofiling/Profile.id"/>

          <dsp:oparam name="true">

            <div>
              <dsp:form action="<%=request.getRequestURI()%>" method="post">
                <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

                <div class="error">
                  <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                    <dsp:oparam name="output">
                      <div><dsp:valueof param="message"/> </div>
                    </dsp:oparam>
                  </dsp:droplet>
                </div>

                <div>
                  Enter transaction amount:<br>
                  <dsp:input bean="LoyaltyFormHandler.value.amount" name="amount" size="30" type="text" /><br>
                  Enter transaction description:<br>
                  <dsp:textarea bean="LoyaltyFormHandler.value.description" name="description" rows="10" type="text"/><br>
                  Enter profile id<br>
                  <dsp:input bean="LoyaltyFormHandler.value.profileId" name="publish" type="text"/>

                  <dsp:input bean="LoyaltyFormHandler.cancelURL" type="hidden" value="<%=request.getRequestURI()%>"/>
                  <dsp:input bean="LoyaltyFormHandler.cancel" type="Submit" value="Cancel"/>
                  <dsp:input bean="LoyaltyFormHandler.createSuccessURL" type="hidden" value="<%=request.getRequestURI()%>"/>
                  <dsp:input bean="LoyaltyFormHandler.create" type="Submit" value="Add transaction"/>
                </div>
              </dsp:form>
            </div>
          </dsp:oparam>

          <dsp:oparam name="false">
            Page not found
          </dsp:oparam>
        </dsp:droplet>

        <!-- *** End real content *** -->
      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>




