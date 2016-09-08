public class SharePitchController {
    public String video_azure{set;get;}
    public String video_id{set;get;}
    public PeersDTO dto{set;get;}
    public PeersDTO communityDto{set;get;}
    public String jsonResultCommunity{set;get;}
    public PeersDTO ratingDto{set;get;}
    private Config config;
    public String jsonResult{set;get;}
    public  String jsonString{set;get;}
    public String speech_id{set;get;}
    public String rating{set;get;}
    public String currentVideoRating{set;get;}
    public String comments{set;get;}
    private SalesUAccessToken salesU;
    private String accesstoken;
    public String ratingCommentsJson{set;get;}
    public String tour_id{set;get;}
    public String category_id{set;get;}
    CallingWebServices service;
    
    public SharePitchController(){
        config = new Config();
        salesU = new SalesUAccessToken();
        if(accesstoken == null){
           accesstoken =  salesU.getAccessToken();
        }
     service  = new CallingWebServices();
    }
    
    public void getVideoInfo(){
       video_id = System.currentPageReference().getParameters().get('video_id'); 
       speech_id =  System.currentPageReference().getParameters().get('speech_id');
        currentVideoRating =  System.currentPageReference().getParameters().get('rating');
        try{
         jsonString = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accesstoken);    
        }catch(Exception e){
        }  
        video_azure = service.getJsonResponse(jsonString, 'video_url');        
         try{
          jsonResult = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/list?page=1',accesstoken);
         }catch(Exception e){
         } 
       dto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);
       try{
        ratingCommentsJson = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/ratings?speech_id='+speech_id+'&page=1',accesstoken);    
        }catch(Exception e){ 
        }  
        ratingDto =  (PeersDTO)System.JSON.deserialize(ratingCommentsJson, PeersDTO.class);
        try{
        jsonResultCommunity =  service.getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/community?page=1',accesstoken); 
         communityDto =  (PeersDTO)System.JSON.deserialize(jsonResultCommunity, PeersDTO.class);   
        }catch(Exception e){
    
         } 
    }
    public PageReference getPitchVideoInfo(){
            video_id = System.currentPageReference().getParameters().get('videoid'); 
            speech_id =  System.currentPageReference().getParameters().get('speechid');
           PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
             page.getParameters().put('video_id',video_id);
             page.getParameters().put('speech_id',speech_id);
             page.setRedirect(true);
       return page;
    }
    public PageReference getCommunityPitchVideoInfo(){
            video_id = System.currentPageReference().getParameters().get('videoid'); 
            speech_id =  System.currentPageReference().getParameters().get('speechid');
            rating =  System.currentPageReference().getParameters().get('rating');
           PageReference page = new PageReference('/apex/share_community?sfdc.tabName='+config.currentTab);
             page.getParameters().put('video_id',video_id);
             page.getParameters().put('speech_id',speech_id);
             page.getParameters().put('rating',rating);
             page.setRedirect(true);
       return page;
    }
    public PageReference addComments(){
       Map<String,String> parameter =new Map<String,String>();
       parameter.put('speech_id', speech_id);
       parameter.put('points', rating);
       parameter.put('message', comments);
        try{
        ratingCommentsJson = service.getWSResponse_SalesU(parameter,'POST',config.url+'/speech/rating',accesstoken);    
        }catch(Exception e){   
        }  
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',currentVideoRating);
        page.setRedirect(true);
       return page;
    }  
   public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference getSharePage(){
        PageReference page = new PageReference('/apex/share_user?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('rating',currentVideoRating);
        page.setRedirect(true);
       return page;
    }
    
    public PageReference searchVideoInfo(){  
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
}