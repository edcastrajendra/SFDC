public class exampleCon {
    Integer count = 0;
    boolean valid=false;
    public String questionfilecombo{set;get;}                     
    public PageReference incrementCounter() {
        if(valid && count < 10){
            String  toParse = new CallingWebServices().getQuizFile('333','wtoolbasedproactiveselling00beforefail_1');
            List<Quiz> quizList =  new SalesUniversity_Edcast().parseQuiz(toParse);
            Quiz quiz = quizList.get(count);
            questionfilecombo = quiz.getQuestionFileCombo();
            count++;
        }   
        return null;
    }
    public Boolean getValid(){
        return valid;
    }                    
    public PageReference currentCount()
    {
        valid=true;
        return ApexPages.currentpage();
    }  
                       
    public Integer getCount() {
        return count;
    }
}