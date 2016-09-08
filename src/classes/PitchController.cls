public class PitchController {
    
     private Config config;
     private String accesstoken;
     private SalesUAccessToken salesU;
     private CallingWebServices service;
     public String jsonResult{set;get;}
     public PeersDTO dto{set;get;}
     public boolean myView{set;get;}
     public boolean communityView{set;get;}
     public String tour_id{set;get;}
     public String category_id{set;get;}
    public PitchController(){
         config = new Config();
         salesU = new SalesUAccessToken();
        service = new CallingWebServices();
        if(accesstoken == null){
         accesstoken  =salesU.getAccessToken(); 
        }
    } 
    
    public void getVideoList(){
       myView = true; 
       communityView = false;   
     try{
      jsonResult = service.getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/list?page=1',accesstoken); 
      dto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);   
      }catch(Exception e){
    
      }   
   }
    
    public void getCommunityVideoList(){
       myView = false; 
       communityView = true;  
     try{
      jsonResult = service.getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/community?page=1',accesstoken); 
      dto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);   
      }catch(Exception e){
    
      }   
   }
    
    
public PageReference getpitchVideo(){
        PageReference page = new PageReference('/apex/pitch_video?sfdc.tabName='+config.currentTab); 
        return page; 
    } 
    
     public PageReference getPitchVideoInfo(){
          String video_id =  System.currentPageReference().getParameters().get('video_id');
          String speech_id =  System.currentPageReference().getParameters().get('speech_id');
          String rating =  System.currentPageReference().getParameters().get('rating');
          PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab); 
          page.getParameters().put('video_id',video_id);
          page.getParameters().put('speech_id',speech_id);
          page.getParameters().put('rating',rating);
          return page; 
         } 
    public PageReference getCommunityPitchVideoInfo(){
          String video_id =  System.currentPageReference().getParameters().get('video_id');
          String speech_id =  System.currentPageReference().getParameters().get('speech_id');
          String rating =  System.currentPageReference().getParameters().get('rating');
          PageReference page = new PageReference('/apex/share_community?sfdc.tabName='+config.currentTab); 
          page.getParameters().put('video_id',video_id);
          page.getParameters().put('speech_id',speech_id);
          page.getParameters().put('rating',rating);
          return page; 
         }
    public PageReference searchVideoInfo(){ 
        String video_id = System.currentPageReference().getParameters().get('video_id');
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
    
    public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
}