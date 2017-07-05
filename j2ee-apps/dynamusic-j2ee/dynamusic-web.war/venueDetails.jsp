<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <html>
  <head>
    <title>Dynamusic Venues</title>
    <!-------------------------------------------------------------
      Dynamusic Site Mockup

      CONCERTS

      Display concerts at a given venue.

      ------------------------------------------------------------->
  </head>
  <body>
  <dsp:droplet name="/dynamusic/VenueLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">

      <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.name"/>
      </dsp:include>

      <table CELLPADDING=8 WIDTH="700" class="ff-1">
        <tr>
          <!-- Sidebar -->
          <td width="100" bgcolor="ghostwhite" valign="top">
            <dsp:include page="common/sidebar.jsp"/>
          </td>

          <!-- Page Body -->
          <td VALIGN=TOP>
            <!-- *** Start page content *** -->
            <table CELLPADDING=10 WIDTH="100%" >
              <tr>
                <td><img SRC="<dsp:valueof param='element.imageURL'/>" BORDER=0></td>
                <td CLASS="ff-1">
                  <dsp:valueof param='element.description'/>
                </td>
              </tr>
              <tr>
                <td COLSPAN="2">
                  <div class="ff-1"><b>
                    <a href="<dsp:valueof param='element.url'/>">
                      <dsp:valueof param="element.name"/>
                    </a></b>
                    <br><dsp:valueof param="element.street1"/>
                    <br><dsp:valueof param="element.street2"/>
                    <br><dsp:valueof param="element.city"/>, <dsp:valueof param="element.state"/> <dsp:valueof param="element.zip"/>
                  </div>
                </td>
              </tr>
            </table>
            <div class="ff-1">
              <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                <dsp:param name="queryRQL" value="venue.id = :itemId"/>
                <dsp:param name="repository" value="/dynamusic/EventsRepository"/>
                <dsp:param name="itemDescriptor" value="concert"/>
                <dsp:oparam name="outputStart">
                  <ul>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </ul>
                </dsp:oparam>
                <dsp:oparam name="output">
                  <li>
                    <dsp:valueof param="element.date" date="M/dd/yyyy"/>
                    <dsp:a href="concertDetails.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.name"/>
                    </dsp:a>
                  </li>
                </dsp:oparam>
                <dsp:oparam name="empty">
                  No concerts found for this venue.
                </dsp:oparam>
              </dsp:droplet>
            </div>
            <!-- *** End real content *** --></td>
        </tr>
      </table>
    </dsp:oparam>
    <dsp:oparam name="empty">
      Bad venue ID, please try again.
    </dsp:oparam>

  </dsp:droplet>

  </body>
  </html>
</dsp:page>