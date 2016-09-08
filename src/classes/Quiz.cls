public class Quiz {
    public String taskid{set;get;}
    public String quizview{set;get;}
    public String quizcount{set;get;}
    public String containerid{set;get;}
    public String quiztitle{set;get;}
    public String elementtitle{set;get;}
    public String questionid{set;get;}
    public String questionfilecombo{set;get;}
    public String correctoption{set;get;}
    public String ismandatory{set;get;}
    
    public String getCorrectOption(){
        return correctoption;
    }
    
    public String getQuestionId()
    {
        return questionid;
    }
    public String getQuestionFileCombo(){
        return questionfilecombo;
    }
    
     public String getTaskId(){
        return taskid;
    }
    public String getIsmandatory(){
        return ismandatory;
    }
}