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
    
    @RemoteAction
    public static PeersDTO getAutoCompleteGuidemeTour(String searchTerm){  
           return (PeersDTO)System.JSON.deserialize(getGuidemeTourVideoResult(searchTerm), PeersDTO.class);
    }
    public static String getGuidemeTourVideoResult(String searchTerm){
        String url = 'https://phpservice.wagmob.com/v1/client/search?query='+ searchTerm +'&page=1';
         HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');  
        req.setHeader('appkey','E99DB1C2-9AAE-4C18-8E69-2F369CEC8148');
        req.setHeader('userkey','F12671E5-BBFB-4BAB-968B-2F043E6549C5');
        req.setTimeout(60000);
        try {
            if(Test.isRunningTest()){
            res = new HttpResponse();  
            res.setHeader('Content-type', 'application/json');
            res.setStatusCode(200);
            }else {
              res = http.send(req);    
            }
          
        } catch(System.CalloutException e) {
           System.debug('Callout error: '+ e);
           System.debug(res.toString());
        }
        return res.getBody();
    }
    public String searchTerm {get; set;}
    private static String Access_Token = null;
    
     @RemoteAction
    public static PeersDTO getAutoComplete(String searchTerm){  
         
        if(Access_Token == null){
           Access_Token = getAccessToken(); 
        }
        
           return (PeersDTO)System.JSON.deserialize(getValue(Access_Token,searchTerm), PeersDTO.class);
    }
     public static String getValue(String accesstoken,String searchTerm){
        String url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1/speech/search?q='+searchTerm+'&page=1';
        Map<String,String> parameter = new Map<String,String>();
        parameter.put('email_id', 'test@test.com');
        parameter.put('password', '123456');
        parameter.put('keep_login', '1');
        String method = 'GET';
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type','application/json');  
        req.setHeader('ApiKey','19b75efe43c95a2b66319d6e6529a27c233e101ccb70c32bd785880b35ed9247');
        req.setHeader('AccessToken',accesstoken);
        req.setTimeout(60000);
        try {
            if(Test.isRunningTest()){
            res = new HttpResponse();  
            res.setHeader('Content-type', 'application/json');
            res.setBody('{"message": "user enrollment enqueued"}');
            res.setStatusCode(200);
            }else {
              res = http.send(req);    
            }
          
        } catch(System.CalloutException e) {
           System.debug('Callout error: '+ e);
           System.debug(res.toString());
        }
         return res.getBody();
      }
    public static String getAccessToken(){
        String url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1/user/signin';
        Map<String,String> parameter = new Map<String,String>();
        parameter.put('email_id', 'test@test.com');
        parameter.put('password', '123456');
        parameter.put('keep_login', '1');
        String method = 'POST';
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type','application/json');  
        req.setHeader('ApiKey','19b75efe43c95a2b66319d6e6529a27c233e101ccb70c32bd785880b35ed9247');
        if(method != 'GET'){
        String body='';
        for(String key : parameter.keySet()){
        body += key+'='+EncodingUtil.urlEncode(parameter.get(key),'UTF-8')+'&';
        }
        req.setBody(body.removeEnd('&'));
        }
        req.setTimeout(60000);
        try {
            if(Test.isRunningTest()){
            res = new HttpResponse();  
            res.setHeader('Content-type', 'application/json');
            res.setBody('{"message": "user enrollment enqueued"}');
            res.setStatusCode(200);
            }else {
              res = http.send(req);    
            }
          
        } catch(System.CalloutException e) {
           System.debug('Callout error: '+ e);
           System.debug(res.toString());
        }
        return getJsonResponse(res.getBody(),'accesstoken');
    }
    public static String getJsonResponse(String jsonString,String value){
        String jsonResult;
        JSONParser parser = JSON.createParser(jsonString);
         while (parser.nextToken() != null) {
         if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
             String fieldName = parser.getText();
		     parser.nextToken();
		if(fieldName == value) {
			jsonResult = parser.getText();
   		}
         }
      }
        return jsonResult;
    }
}