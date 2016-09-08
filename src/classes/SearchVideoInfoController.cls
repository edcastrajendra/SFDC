public class SearchVideoInfoController {
    
    public String video_azure{set;get;}  
    public String jsonResult{set;get;}  
    public PeersDTO dto{set;get;}
    private Config config;
    public String jsonString{set;get;}
    public List<String> listVideoUrl{set;get;}
    public String thumb_url{set;get;}
    private SalesUAccessToken accessToken;
    public SearchVideoInfoController(){
        config = new Config();
        accessToken = new SalesUAccessToken();
    }
 
    public void getVideoInfo(){
         String video_id = System.currentPageReference().getParameters().get('video_id');
        try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accessToken.getAccessToken());    
        }catch(Exception e){
        jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',config.url+'/file/video?video_id='+video_id,accessToken.getNewAccessToken());   
        }  
        video_azure = new CallingWebServices().getJsonResponse(jsonString, 'video_url');
        thumb_url = new CallingWebServices().getJsonResponse(jsonString, 'thumb_url');
        try{
          jsonResult = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/list?page=1',accessToken.getAccessToken());
         }catch(Exception e){
         jsonResult = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/list?page=1',accessToken.getNewAccessToken());    
        } 
         dto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);
    }  
  public PageReference getTourVideoByTourId(){
         String video_id = System.currentPageReference().getParameters().get('videoId');
         PageReference page  = new PageReference('/apex/search_video?sfdc.tabName='+config.currentTab+'&video_id='+video_id);
         page.getParameters().put('video_id',video_id);
         page.setRedirect(true);
         return page;
    }
}