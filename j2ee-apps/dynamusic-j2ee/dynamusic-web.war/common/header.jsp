<%@ taglib prefix="dsp" uri="/dspTaglib" %>
<!-------------------------------------------------------------
Dynamusic Site Mockup
Header
Page fragment displaying the site's header, common to all
pages.
------------------------------------------------------------->
<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>

  <img src="images/Dynamusic.jpg">
  <table width="700" cellpadding="8" class="header">
    <tr>
      <td width="100"></td>
      <td class="title"><dsp:valueof param="pagename">Unknown</dsp:valueof>
        <br>
        <hr size="8">
      </td>
    </tr>
  </table>
</dsp:page>
 