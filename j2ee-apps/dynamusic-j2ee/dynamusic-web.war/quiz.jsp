<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/dynamusic/servlet/form_handler/QuizFormHandler"/>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>

  <html>
  <head>
    <title>Dynamusic Quiz</title>
  </head>
  <body>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Quiz"/>
  </dsp:include>
  <table width="700" cellpadding="8">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <!-- Default form Error Handling support -->
        <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
          <dsp:oparam name="outputStart">
            <div class="red">I encountered problems processing this form: </div>
            <ul>
          </dsp:oparam>
          <dsp:oparam name="output">
            <li><dsp:valueof param="message"/></li>
          </dsp:oparam>
          <dsp:oparam name="outputEnd">
            </ul>
          </dsp:oparam>
        </dsp:droplet>

        <!-- The Form itself, in all its glory -->
        <dsp:form action="quiz.jsp" method="post">
        <div class="green ff_1">
          <dsp:valueof bean="QuizFormHandler.question"/>
        </div>
        <p>
          Answer: <dsp:input type="text" bean="QuizFormHandler.userAnswer" required="<%=true%>"/>
        <p>

            <%-- Submission --%>
            <dsp:input type="submit" value="Am I right?" bean="QuizFormHandler.validate"/>
          &nbsp;
            <dsp:input bean="QuizFormHandler.cancel" type="Submit" value="Cancel"/>
            <%-- Redirection --%>
            <dsp:input type="hidden" bean="QuizFormHandler.validateSuccessURL"
                       value="quizAnswer.jsp"/>
          </dsp:form>

          <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </body>
  </html>


</dsp:page>
