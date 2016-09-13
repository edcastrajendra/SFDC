public class AutoCompleteDemoController {
    
     private Config config;
     private SalesUAccessToken accessToken;
    
     public AutoCompleteDemoController(){
         config=new Config();
         accessToken = new SalesUAccessToken();
    }
    public void getSearchSpeech(){
        try{
         String jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id=',accessToken.getAccessToken());    
        }catch(Exception e){
         } 
    }
   public list<account> getAccountList(){
        return [select id,name from account limit 25];
    }
}