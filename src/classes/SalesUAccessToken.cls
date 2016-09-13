public class SalesUAccessToken {
    public Config config;
    public  String accesstoken;
    public String refreshtoken;
    public SalesUAccessToken(){
       config = new Config(); 
    }
    public String getAccessToken(){
         Map<String,String> parameter = new Map<String,String>();
         parameter.put('email_id','test@test.com');
         parameter.put('password', '123456');
         parameter.put('keep_login', '1');
        try{    
        if(accesstoken == null){
        String jsondata = new CallingWebServices().getWSResponse_SalesU(parameter, 'POST', config.url+'/user/signin', 'NA');     
        accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');
        refreshtoken = new CallingWebServices().getJsonResponse(jsondata,'refreshtoken');        
        }    
        }catch(Exception e){
        }
        return accesstoken;
    }
    @RemoteAction
    public static String getRemoteAccessToken(){
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