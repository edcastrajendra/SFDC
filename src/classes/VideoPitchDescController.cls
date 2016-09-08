public class VideoPitchDescController {
    
    public String video_url{set;get;}
    public String video_id{set;get;}
    public String video_title{set;get;}
    public String video_desc{set;get;}
    private Config config;
    private SalesUAccessToken access_token;
    public VideoPitchDescController(){
        config=new Config();
        access_token = new SalesUAccessToken();
    }
    
    public void getVideoInfo(){
        video_url = System.currentPageReference().getParameters().get('video_url');
        video_id = System.currentPageReference().getParameters().get('video_id');
    }
    
    public PageReference addDescription(){
         Map<String,String> parameter = new Map<String,String>();
         parameter.put('title', video_title);
         parameter.put('description', video_desc);
         parameter.put('video_id', video_id);
         String response;
        try{
         response = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/add',access_token.getAccessToken()); 
        }catch(Exception e){
        response = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/add',access_token.getNewAccessToken());   
        }
         PageReference page  = new PageReference('/apex/share?sfdc.tabName='+config.currentTab);
         page.getParameters().put('video_url',video_url);
         page.setRedirect(true);
         return page;
    }
}