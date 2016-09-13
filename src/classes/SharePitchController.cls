public class SharePitchController {
    public String video_azure{set;get;}
    public String video_id{set;get;}
    public PeersDTO ourPitchDto{set;get;}
    public PeersDTO communityPitchDto{set;get;}
    public String jsonResultCommunity{set;get;}
    public PeersDTO ratingDto{set;get;}
    private Config config;
    public String jsonResult{set;get;}
    public  String jsonSpeech{set;get;}
    public  String jsonVideo{set;get;} 
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
    AutoCompleteController autoComplete;
    public PeersDTO searchJsonResult{set;get;}
    public String queryTerm{set;get;}
    public SharePitchController(){
        config = new Config();
        salesU = new SalesUAccessToken();
        if(accesstoken == null){
           accesstoken =  salesU.getAccessToken();
        }
     service  = new CallingWebServices();
     autoComplete = new  AutoCompleteController(); 
    }
    
    public void getVideoInfo(){ 
        speech_id =  System.currentPageReference().getParameters().get('speech_id');
        queryTerm =  System.currentPageReference().getParameters().get('query');
        try{
        jsonSpeech = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/speech?speech_id='+speech_id,accesstoken);   
        video_id = service.getJsonResponse(jsonSpeech, 'video_id');  
        currentVideoRating = service.getJsonResponse(jsonSpeech, 'rating');       
        jsonVideo = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accesstoken);
        video_azure = service.getJsonResponse(jsonVideo, 'video_url');  
         ratingCommentsJson = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/ratings?speech_id='+speech_id+'&page=1',accesstoken);     
        ratingDto =  (PeersDTO)System.JSON.deserialize(ratingCommentsJson, PeersDTO.class);
        if(queryTerm != null){
        ourPitchDto = AutoCompleteController.getAutoComplete(queryTerm, '1'); 
        //ourPitchDto =  (PeersDTO)System.JSON.deserialize(searchJsonResult, PeersDTO.class);    
        }else{
        jsonResult = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/list?page=1',accesstoken); 
        ourPitchDto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);  
        jsonResultCommunity =  service.getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/community?page=1',accesstoken); 
        communityPitchDto =  (PeersDTO)System.JSON.deserialize(jsonResultCommunity, PeersDTO.class);       
        }    
        }catch(Exception e){
            
        }  
    }
    public PageReference getPitchVideoInfo(){
           try{
           jsonVideo = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accesstoken);
           ratingCommentsJson = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/ratings?speech_id='+speech_id+'&page=1',accesstoken);     
           ratingDto =  (PeersDTO)System.JSON.deserialize(ratingCommentsJson, PeersDTO.class); 
           video_azure = service.getJsonResponse(jsonVideo, 'video_url');     
           }catch(Exception e){
           }  
       return null;
    }
    public void addComments(){
       Map<String,String> parameter =new Map<String,String>();
       parameter.put('speech_id', speech_id);
       parameter.put('points', rating);
       parameter.put('message', comments);
        try{
        ratingCommentsJson = service.getWSResponse_SalesU(parameter,'POST',config.url+'/speech/rating',accesstoken);   
        ratingCommentsJson = service.getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/speech/ratings?speech_id='+speech_id+'&page=1',accesstoken);     
        ratingDto =  (PeersDTO)System.JSON.deserialize(ratingCommentsJson, PeersDTO.class);    
        }catch(Exception e){   
        }  
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
        page.getParameters().put('speech_id',speech_id);
        page.getParameters().put('query',queryTerm);
        page.setRedirect(true);
        return page;
    } 
     public PageReference searchVideoInfoDemo(){ 
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
        page.getParameters().put('query',queryTerm);
        page.setRedirect(true);
        return page;
    }
}