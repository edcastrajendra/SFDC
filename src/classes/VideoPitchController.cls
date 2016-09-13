public class VideoPitchController{
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
    public String searchQuery{set;get;}
    public Boolean video_share{set;get;}
    public Boolean video_share_submit{set;get;}
    public String add_speech_response{set;get;}
    public VideoPitchController(){
          video_share = false;
          video_share_submit = true;
          config = new Config();
        if(accesstoken == null){
        accesstoken = new SalesUAccessToken().getAccessToken();
        }
    }
     public void getLocatorURL(){
         try{
           jsondata = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(), 'GET',config.url+'/file/locator',accesstoken);      
         }catch(Exception e){
         
         }
        locator_url = new CallingWebServices().getJsonResponse(jsondata,'_locator_url');
        
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
    public void addVideoInfo(){
         try{
          asset_id = new CallingWebServices().getJsonResponse(jsondata,'_asset_id');
          locator_id= new CallingWebServices().getJsonResponse(jsondata,'_locator_id');
          access_policy_id = new CallingWebServices().getJsonResponse(jsondata,'_access_policy_id');
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('asset_id', asset_id);
          parameter.put('locator_id', locator_id);
          parameter.put('access_policy_id', access_policy_id);  
          uploadstatus =  new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/file/uploadstatus',accesstoken); 
          video_id =  new CallingWebServices().getJsonResponse(uploadstatus,'video_id');
          video_url = new CallingWebServices().getJsonResponse(uploadstatus,'video_url');
          parameter.put('title', video_title);
          parameter.put('description', video_desc);
          parameter.put('video_id', video_id); 
          add_speech_response = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/add',accesstoken); 
          speech_id =  new CallingWebServices().getJsonResponse(add_speech_response,'speech_id');
          rating =     new CallingWebServices().getJsonResponse(add_speech_response,'rating');     
          }catch(Exception e){
          }
         video_share_submit = false;
         video_share=true;
        // return page;
    }
    public PageReference getVideoShareInfo(){
        PageReference page = new PageReference('/apex/share_user?sfdc.tabName='+config.currentTab+video_id);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',rating);
        page.setRedirect(true);
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
    public PageReference getLeaderBoard(){
     PageReference page = new PageReference('/apex/leaderboard?sfdc.tabName='+config.currentTab); 
     page.setRedirect(true);
        return page;        
    }
 
}