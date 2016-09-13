// AutoCompleteController.cls
global class AutoCompleteController {
    public String searchTerm {get; set;}
    private static String Access_Token = null;
   @RemoteAction
    public static PeersDTO getAutoComplete(String searchTerm,String pageNumber){  
    searchTerm = EncodingUtil.urlEncode(searchTerm,'UTF-8');     
        if(Access_Token == null){
           Access_Token = getAccessToken(); 
        }
      return (PeersDTO)System.JSON.deserialize(getValue(Access_Token,searchTerm,pageNumber), PeersDTO.class);
    }
    @RemoteAction
    public static PeersDTO getAutoCompleteGuidemeTour(String searchTerm){
           searchTerm = EncodingUtil.urlEncode(searchTerm,'UTF-8');
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
     public static String getValue(String accesstoken,String searchTerm,String pageNumber){
        String url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1/speech/search?q='+searchTerm+'&page='+pageNumber;
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