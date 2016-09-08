public class VideoPitchListController {
    
    private Config config;
    public String jsonResult{set;get;}
    public PeersDTO dto{set;get;}
    private SalesUAccessToken access_token;
    public VideoPitchListController(){
        config=new Config();
        access_token = new SalesUAccessToken();
    }
    
  public void getVideoList(){
       try{
      jsonResult = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/list?page=1',access_token.getAccessToken());
      }catch(Exception e){
       jsonResult = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(),'GET',Config.url+'/speech/list?page=1',access_token.getNewAccessToken());    
      }
      dto =  (PeersDTO)System.JSON.deserialize(jsonResult, PeersDTO.class);
   }
    
}