<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <%-- Required input param: itemId (id of the user to display --%>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  USER
  Shows a user's profile.
  ------------------------------------------------------------->
  <HTML>
  <HEAD>
    <TITLE>Dynamusic User Page</TITLE>
  </HEAD>
  <BODY>
  <!-- (replace this entire table by dynamically including
        common/header.jsp) -->
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Profile transactions"/>
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
        <div>
          <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" param="Profile.loyaltyTransactions"/>
            <dsp:oparam name="outputStart"><table class="t_inner">
              <thead>
              <tr>
                <th>Date</th>
                <th>Amount</th>
                <th>Description</th>
              </tr>
              </thead>
            </dsp:oparam>
            <dsp:oparam name="output">
              <tr>
                <th><dsp:valueof param="element.date"/> </th>
                <th><dsp:valueof param="element.amount" converter="currency" symbol="PL"/> </th>
                <th><dsp:valueof param="element.description"/> </th>
              </tr>
            </dsp:oparam>
            <dsp:oparam name="outputEnd"></table></dsp:oparam>
            <dsp:oparam name="empty"> You have no one PL transaction</dsp:oparam>
          </dsp:droplet>
        </div>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
