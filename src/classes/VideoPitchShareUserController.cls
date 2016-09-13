public class VideoPitchShareUserController {
    
    public PeersDTO dto{set;get;}
    public PeersDTO dto2{set;get;}
    public PeersDTO mentorsDto{set;get;} 
    public PeersDTO groupsDto{set;get;}
    public boolean mentorsActive{set;get;} 
    public boolean groupsActive{set;get;}
    public String jsonString{set;get;} 
    public String group_id{set;get;} 
    public String error{set;get;}
    private Config config;
    public String mentorsJson{set;get;}
    public String groupsJson{set;get;}
    public String video_url{set;get;}  
    public String video_id{set;get;} 
    public String speech_id{set;get;}
    private SalesUAccessToken salesU;
    private String accesstoken;
    public String userJson{set;get;}
    public String rating{set;get;}
    public String image_url{set;get;}
    public String group_name{set;get;}
    public String speechJson{set;get;}
    public String thumb_url{set;get;}
    public String title{set;get;}
    public String tour_id{set;get;}
    public String category_id{set;get;}
     public String searchQuery{set;get;}
    public VideoPitchShareUserController(){
        config = new Config();
         salesU = new SalesUAccessToken();
        if(accesstoken == null){
           accesstoken = salesU.getAccessToken();
        }
    }
    
    public void getVideoInfo(){
        error='false';
        video_id  =  System.currentPageReference().getParameters().get('video_id');
        speech_id =  System.currentPageReference().getParameters().get('speech_id');
        rating =  System.currentPageReference().getParameters().get('rating');
         
        try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accesstoken);    
         mentorsJson = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/user/mentors?page=1',accesstoken);
         mentorsDto  = (PeersDTO)System.JSON.deserialize(mentorsJson, PeersDTO.class);
         groupsJson = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/user/groups?page=1',accesstoken);
         groupsDto  = (PeersDTO)System.JSON.deserialize(groupsJson, PeersDTO.class);   
         video_url = new CallingWebServices().getJsonResponse(jsonString, 'thumb_url'); 
         speechJson  = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/speech?speech_id='+speech_id,accesstoken);  
         thumb_url = new CallingWebServices().getJsonResponse(speechJson, 'thumb_url'); 
          title  = new CallingWebServices().getJsonResponse(speechJson, 'title'); 
        }catch(Exception e){ }  
       
    }

    public PageReference getGroup(){
         group_id =  System.currentPageReference().getParameters().get('group_id');
         image_url =  System.currentPageReference().getParameters().get('image_url');
         group_name =  System.currentPageReference().getParameters().get('group_name');
         PageReference page  = new PageReference('/apex/share_groups?sfdc.tabName='+config.currentTab); 
        page.getParameters().put('group_id',group_id);
         page.getParameters().put('video_id',video_id);
         page.getParameters().put('speech_id',speech_id);
         page.getParameters().put('rating',rating);
         page.getParameters().put('id',group_id);
         page.getParameters().put('name',group_name);
         page.getParameters().put('url',image_url);
        
         page.setRedirect(true);
         return page;
    }
     public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference getShareVideoList(){  
       userJson ='{"users": ['+userJson+']}';
       Map<String,String> parameter = new Map<String,String>();
       parameter.put('users',userJson);
       parameter.put('speech_id',speech_id); 
       String jsonString;
       try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',Config.url+'/speech/share',accesstoken);
         }catch(Exception e){
         jsonString = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',Config.url+'/speech/share',accesstoken);    
          }
        PageReference page  = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',rating);
        page.setRedirect(true);
        return page;
    }
    
    public PageReference cancel(){
        PageReference page  = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab); 
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
}