public class VideoPitchController {
    private Config config;
    public String locator_url{set;get;}
    public String asset_id{set;get;}
    public String locator_id{set;get;}
    public String access_policy_id{set;get;}
    public String video_id{set;get;}
    public String video_url{set;get;}
    public String video_title{set;get;}
    public String video_desc{set;get;}
    public boolean disabled{set;get;}
    public String uploadstatus{set;get;}
    public String speech_id{set;get;}
    public String rating{set;get;}
    private SalesUAccessToken salesUAccessToken;
    public String jsondata; 
    public String accesstoken;
    public String tour_id{set;get;}
    public String category_id{set;get;}
    public VideoPitchController(){
          config = new Config();
          salesUAccessToken = new SalesUAccessToken();
        if(accesstoken == null){
         accesstoken = salesUAccessToken.getAccessToken();    
        }
    }
     public void getLocatorURL(){
         try{
           jsondata = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(), 'GET',config.url+'/file/locator',accesstoken);      
         }catch(Exception e){
         
         }
        locator_url = new CallingWebServices().getJsonResponse(jsondata,'_locator_url');
        asset_id = new CallingWebServices().getJsonResponse(jsondata,'_asset_id');
        locator_id= new CallingWebServices().getJsonResponse(jsondata,'_locator_id');
        access_policy_id = new CallingWebServices().getJsonResponse(jsondata,'_access_policy_id');
    }
    public PageReference cancel(){
         PageReference page = new PageReference('/apex/pitch_video?sfdc.tabName='+config.currentTab);
         page.setRedirect(true);  
         return page;
    }
     public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference addVideoInfo(){
       Map<String,String> parameter = new Map<String,String>();
          parameter.put('asset_id', asset_id);
          parameter.put('locator_id', locator_id);
          parameter.put('access_policy_id', access_policy_id);
         
         try{
          uploadstatus =  new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/file/uploadstatus',accesstoken); 
         }catch(Exception e){
         }
          video_id =  new CallingWebServices().getJsonResponse(uploadstatus,'video_id');
          video_url = new CallingWebServices().getJsonResponse(uploadstatus,'video_url');
         parameter.put('title', video_title);
         parameter.put('description', video_desc);
         parameter.put('video_id', video_id);
        
         String response;
        try{
         response = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/add',accesstoken); 
        }catch(Exception e){
         
        }
        speech_id =  new CallingWebServices().getJsonResponse(response,'speech_id');
        rating =     new CallingWebServices().getJsonResponse(response,'rating');
        PageReference page  = new PageReference('/apex/share?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',rating);
        page.setRedirect(true);
         return page;
    }
    
     public PageReference searchVideoInfo(){ 
        video_id = System.currentPageReference().getParameters().get('video_id');
        String speech_id = System.currentPageReference().getParameters().get('speech_id');
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.setRedirect(true);
        return page;
    }
    public PageReference searchVideoInfoDemo(){ 
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
         page.getParameters().put('category_id',category_id);
        page.setRedirect(true);
        return page;
    }
    public PageReference getLeaderBoard(){
     PageReference page = new PageReference('/apex/leaderboard?sfdc.tabName='+config.currentTab); 
     page.setRedirect(true);
        return page;        
    }
 
}