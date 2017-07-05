<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/dynamusic/servlet/form_handler/QuizFormHandler"/>
  <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
  <dsp:link rel="stylesheet" type="text/css" href="../css/main.css"/>

  <html>
  <head>
    <title>Dynamusic Quiz</title>
  </head>
  <body>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Quiz Answer"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar" ">
        <dsp:include page="common/sidebar.jsp"/>
      </td>

      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <dsp:droplet name="Switch">
          <dsp:param bean="QuizFormHandler.correctAnswer" name="value"/>
          <dsp:oparam name="outputStart">
            <p>
              Answer: <dsp:valueof bean="QuizFormHandler.userAnswer"/>
            <p>
            <p class="red">Result:</p><br>
          </dsp:oparam>
          <dsp:oparam name="true">
            Correct!
          </dsp:oparam>
          <dsp:oparam name="false">
            Incorrect!<br>
            Correct answer is : <br>
            <div class="green">
              <dsp:valueof bean="QuizFormHandler.answer"/>
            </div>
          </dsp:oparam>
          <dsp:oparam name="default">
            I'm a little confused here...
          </dsp:oparam>
        </dsp:droplet>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </body>
  </html>


</dsp:page>
