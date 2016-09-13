public class ShareGroupsController {
    private SalesUAccessToken salesU;
    private String accesstoken;
    private Config config;
    public String group_id{set;get;}
    public String image_url{set;get;}
    public String group_name{set;get;}
    public String jsonString{set;get;}
    public PeersDTO groupsDto{set;get;}
    public String speech_id{set;get;}
    public String video_id{set;get;}
    public String userJson{set;get;}
    public String rating{set;get;}
    public String shareGroupId{set;get;}
    public String tour_id{set;get;}
    public String category_id{set;get;}
    public String searchQuery{set;get;}
     public ShareGroupsController(){
        config = new Config();
         salesU = new SalesUAccessToken();
         if(accesstoken == null){
          accesstoken = salesU.getAccessToken();   
         }
    }
    public void getUserByGroupId(){
         speech_id =  System.currentPageReference().getParameters().get('speech_id');
          rating =  System.currentPageReference().getParameters().get('rating');
         video_id =  System.currentPageReference().getParameters().get('video_id');
         group_id =  System.currentPageReference().getParameters().get('id');
         image_url =  System.currentPageReference().getParameters().get('url');
         group_name =  System.currentPageReference().getParameters().get('name');
         try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/user/peers?group_id='+group_id+'&page=1',accesstoken);
         }catch(Exception e){
         }
       groupsDto =  (PeersDTO)System.JSON.deserialize(jsonString, PeersDTO.class);

    } 
    
   public PageReference getShareVideoList(){ 
       Map<String,String> parameter = new Map<String,String>();
       if(shareGroupId != null){
         shareGroupId='{"users": ['+shareGroupId+']}';  
         parameter.put('users',shareGroupId);  
       }else{
        userJson ='{"users": ['+userJson+']}';
        parameter.put('users',userJson);   
       }
       parameter.put('speech_id',speech_id); 
       String jsonString;
       try{
         jsonString = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',Config.url+'/speech/share',accesstoken);
         }catch(Exception e){
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