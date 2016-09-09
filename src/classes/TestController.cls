public class TestController {
    private SalesUAccessToken accessToken;
    public String uploadstatus{set;get;}
     public String jsondata{set;get;}
    public Config config;
    public TestController(){
         accessToken = new SalesUAccessToken();
        config = new Config();
       
       try{
           jsondata = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(), 'GET',config.url+'/file/locator',accessToken.getAccessToken());      
         }catch(Exception e){
          jsondata = new CallingWebServices().getWSResponse_SalesU(new Map<String,String>(), 'GET',config.url+'/file/locator',accessToken.getNewAccessToken());  
         }
        String locator_url = new CallingWebServices().getJsonResponse(jsondata,'_locator_url');
        String asset_id = new CallingWebServices().getJsonResponse(jsondata,'_asset_id');
        String locator_id= new CallingWebServices().getJsonResponse(jsondata,'_locator_id');
        String access_policy_id = new CallingWebServices().getJsonResponse(jsondata,'_access_policy_id');
       
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('asset_id', asset_id);
          parameter.put('locator_id', locator_id);
          parameter.put('access_policy_id', access_policy_id);
         try{
          uploadstatus =  new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/file/uploadstatus',accessToken.getAccessToken()); 
         }catch(Exception e){
          uploadstatus =  new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/file/uploadstatus',accessToken.getNewAccessToken());   
         }
    }
}