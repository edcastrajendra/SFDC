public class VideoPitchShareController {
    
     public String video_url{set;get;}
     public String video_id{set;get;}
     public String speech_id{set;get;}
     public String rating{set;get;}
     public String tour_id{set;get;}
     public String category_id{set;get;}
     private Config config;
     private SalesUAccessToken salesU;
     public String accesstoken;
     public String searchQuery{set;get;}
     public VideoPitchShareController(){
        config=new Config();
         salesU = new SalesUAccessToken();
         if(accesstoken == null){
          accesstoken = salesU.getAccessToken();
         }
        }
    
     public void getVideoInfo(){
        video_id = System.currentPageReference().getParameters().get('video_id');
        speech_id = System.currentPageReference().getParameters().get('speech_id');
         rating = System.currentPageReference().getParameters().get('rating');
         String jsonString;
        try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accesstoken);    
        }catch(Exception e){
        }  
       video_url = new CallingWebServices().getJsonResponse(jsonString, 'video_url'); 
       }
    
    public PageReference getVideoShareInfo(){
        PageReference page = new PageReference('/apex/share_user?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',rating);
        page.setRedirect(true);
        return page;
    }  
    public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference searchVideoInfo(){   
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('query',searchQuery);
        page.setRedirect(true);
        return page;
    } 
    public PageReference searchVideoInfoDemo(){ 
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
        page.getParameters().put('query',searchQuery);
        page.setRedirect(true);
        return page;
    } 
}