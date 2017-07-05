
<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>
<%@ taglib prefix="c" uri="/cTagLib" %>


<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="/css/main.css"/>

  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/lp/handler/LoyaltyFormHandler"/>

  <!-------------------------------------------------------------
  page for loyalty point administrator
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>

  <script src="jquery-2.2.3.js"></script>
  <script src="dropdown.js"></script>



  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Loyalty administration"/>
  </dsp:include>

  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="/common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
        <dsp:param name="type" value="role"/>
        <dsp:param name="id" value="loyaltyAdministrator"/>
        <dsp:oparam name="output">
          <div>
            <dsp:form action="<%=request.getRequestURI()%>" method="get">

              <div class="error">
                <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                  <dsp:oparam name="output">
                    <div><dsp:valueof param="message"/> </div>
                  </dsp:oparam>
                </dsp:droplet>
              </div>

              <div>
                Enter transaction amount:<br>
                <dsp:input bean="LoyaltyFormHandler.value.amount" name="amount" size="30" type="text" /><br><br>
                Enter transaction description:<br>
                <dsp:textarea bean="LoyaltyFormHandler.value.description" name="description" rows="10" type="text"
                              maxlength="1000"/><br><br>
                Enter profile id<br>
                <dsp:input bean="LoyaltyFormHandler.value.profileId" name="profileId" type="text" maxsize="100"/><br><br>

                <%--<dsp:input bean="LoyaltyFormHandler.value.date" type="hidden" value="<%=new Long(System.currentTimeMillis())%>"/>--%>

                <dsp:input bean="LoyaltyFormHandler.cancelURL" type="hidden" value="<%=request.getRequestURI()%>"/>
                <dsp:input bean="LoyaltyFormHandler.cancel" type="Submit" value="Cancel"/><br><br>
                <dsp:input bean="LoyaltyFormHandler.createSuccessURL" type="hidden" value="/loyalty/success_transaction"/>
                <dsp:input bean="LoyaltyFormHandler.create" type="Submit" value="Add transaction"/>
              </div>
            </dsp:form>
            <div>
              <div class="dropdown">
                <button id="dropper" class="dropbtn">Show users</button>
                <div id="dropdown_users" class="dropdown-content">

                  <h4>All user's:</h4>
                  <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                    <dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
                    <dsp:param name="itemDescriptor" value="user"/>
                    <dsp:param name="queryRQL" value="ALL ORDER BY login"/>

                    <dsp:oparam name="outputStart"><table class="t_inner strong">
                      <tr>
                        <th>Login</th>
                        <th>id</th>
                        <th>First name</th>
                        <th>Last name</th>
                      </tr>
                    </dsp:oparam>
                    <dsp:oparam name="output">
                      <tr>
                        <td>
                          <dsp:a page="userDetails.jsp">
                            <dsp:param name="itemId" param="element.repositoryId"/>
                            <dsp:valueof param="element.login"/>
                          </dsp:a>
                        </td>
                        <td><dsp:valueof param="element.repositoryId"/> </td>
                        <td><dsp:valueof param="element.firstName"/> </td>
                        <td><dsp:valueof param="element.lastName"/> </td>
                      </tr>
                    </dsp:oparam>
                    <dsp:oparam name="outputEnd"></table></dsp:oparam>
                    <dsp:oparam name="empty"><div>No users found</div></dsp:oparam>
                  </dsp:droplet>
                </div>
              </div>

            </div> <%--end dropdown--%>
          </div>
        </dsp:oparam>
        <dsp:oparam name="default"> You are not an administrator<p>
        </dsp:oparam>
        <dsp:oparam name="unknown"> You are not logged in<p>

        </dsp:oparam>
        </dsp:droplet>
        <!-- *** End real content *** -->
      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>




