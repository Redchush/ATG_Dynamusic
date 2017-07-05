package dynamusic;


import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import java.io.IOException;

public class QuizFormHandler extends GenericFormHandler {

    private String answer;
    private String question;
    private String userAnswer;
    private boolean correctAnswer;
    private String validateSuccessURL;
    private String validateErrorURL;


    public boolean handleValidate(DynamoHttpServletRequest request, DynamoHttpServletResponse response)
            throws IOException {

        if (getFormError()) {
            if (getValidateErrorURL() != null) {
                response.sendLocalRedirect(getValidateErrorURL(),request);
                if (isLoggingDebug()){
                    logDebug("Error occured");
                }
                return false;
            }
            return true;
        }

        if (userAnswer != null){
            boolean  equals = userAnswer.equalsIgnoreCase(answer);
            setCorrectAnswer(equals);
            if (validateSuccessURL != null){
                response.sendLocalRedirect(getValidateSuccessURL(), request);
                if (isLoggingDebug()){
                    logDebug("Redirect to success URL. Answer is right : " + equals);
                }
                return false;
            }

        }
        return true;
    }

    public boolean handleCancel(DynamoHttpServletRequest request, DynamoHttpServletResponse response){
        setUserAnswer(null);
        if (isLoggingDebug()){
            logDebug("Cancel answer");
        }
        return true;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
        if (isLoggingDebug()){
            logDebug("Answer set: " + answer);
        }
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
        if (isLoggingDebug()){
            logDebug("question set: " + question);
        }
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
        if (isLoggingDebug()){
            logDebug("userAnswer set: " + userAnswer);
        }
    }

    public boolean isCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(boolean correctAnswer) {
        this.correctAnswer = correctAnswer;
        if (isLoggingDebug()){
            logDebug("setCorrectAnswer: " + correctAnswer);
        }
    }

    public String getValidateSuccessURL() {
        return validateSuccessURL;
    }

    public void setValidateSuccessURL(String validateSuccessURL) {
        this.validateSuccessURL = validateSuccessURL;
    }

    public String getValidateErrorURL() {
        return validateErrorURL;
    }

    public void setValidateErrorURL(String validateErrorURL) {
        this.validateErrorURL = validateErrorURL;
    }
}
