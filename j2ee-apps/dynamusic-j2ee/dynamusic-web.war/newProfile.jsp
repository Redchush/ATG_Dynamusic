<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  NEW PROFILE

  Allows creation of new user profile

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Edit Profile</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Register"/>
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
        <dsp:setvalue bean="ProfileFormHandler.confirmPassword" value="true"/>

        <dsp:form action="<%=request.getRequestURI()%>">

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


          <dsp:input type="hidden" bean="ProfileFormHandler.userId"
                     beanvalue="Profile.id"/>



          <dsp:input type="hidden" bean="ProfileFormHandler.confirmPassword" value="true"/>

          <h3>Login information (required)</h3>
          Login:<br>
          <dsp:input bean="ProfileFormHandler.value.login" size="24" type="text" required="true"/><br>
          Password:<br>
          <dsp:input bean="ProfileFormHandler.value.password" size="24" type="password" required="true"/><br>

          Retype password to confirm:<br>
          <dsp:input bean="ProfileFormHandler.value.confirmPassword" size="24" type="password"/><br>
          <hr>
          <h3>Personal information (optional)</h3>
          First name:<br>
          <dsp:input bean="ProfileFormHandler.value.firstName" size="24" type="text"/><br>
          Last name:<br>
          <dsp:input bean="ProfileFormHandler.value.lastName" size="24" type="text"/><br>
          <br>
          State:<br>
          <dsp:input bean="ProfileFormHandler.value.homeAddress.state" size="2" type="text"/><br>
          <br>
          Your favorite genres:<br>
          <dsp:input bean="ProfileFormHandler.value.prefGenres" value="pop"/>Pop<br>
          <dsp:input bean="ProfileFormHandler.value.prefGenres"  type="checkbox" value="jazz"/>Jazz<br>
          <dsp:input bean="ProfileFormHandler.value.prefGenres"  type="checkbox" value="classical"/>Classical<br>
          <dsp:input bean="ProfileFormHandler.value.prefGenres"  type="checkbox" value="blues"/>Blues<br>
          <dsp:input bean="ProfileFormHandler.value.prefGenres"  type="checkbox" value="country"/>Country<br>
          <br>
          Make your profile viewable by others?<br>
          <dsp:input bean="ProfileFormHandler.value.shareProfile"  type="radio" value="true"/>yes<br>
          <dsp:input bean="ProfileFormHandler.value.shareProfile"  type="radio" value="false"/>no<br>
          <br>
          Personal info:<br>
          <dsp:textarea bean="ProfileFormHandler.value.info" name="info" rows="5" cols="40"/><br>
          <br>

          <!-- defines the URL to go to on success (relative to 'action')-->
          <!-- defines the URL to go to on success (relative to 'action')-->
          <dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden" value="home.jsp"/>
          <dsp:input bean="ProfileFormHandler.create" type="Submit" value="Register"/>
          <dsp:input bean="ProfileFormHandler.cancelURL" type="hidden" value="home.jsp"/>
          <dsp:input bean="ProfileFormHandler.cancel" type="Submit" value="Cancel"/>

        </dsp:form>

        <!-- *** End real content *** -->

      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
