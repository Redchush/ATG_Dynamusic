<%@ taglib prefix="dsp" uri="/dspTaglib" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<dsp:page>
  <dsp:include page="header.jsp">
    <dsp:param name="pagename" value="Not Found"/>
  </dsp:include>
  <table width="700" cellpadding="8" class="ff">
    <tr>
      <!-- Sidebar -->
      <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="sidebar.jsp"/><br>
        <b class="sidebar">Edit Artist Info</b>
      </td>
      <!-- Page Body -->
      <td VALIGN=TOP>
        <dsp:valueof param="notFoundType"/> with ID
        <dsp:valueof param="itemId">NONE</dsp:valueof> not found.
      </td>
    </tr>
  </table>

</dsp:page>