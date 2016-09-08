public with sharing class CallingWebServices {
    
    public String getCdnData(){
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');  
        req.setEndpoint('https://storage.googleapis.com/cdn.wagmob.com/library/xml/org_2.json');
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
   // 
    public String getMileStone(String uniqueFolderId){
         HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');  
        req.setEndpoint('http://cdn.wagmob.com/subject/'+uniqueFolderId+'/xml/android/windows_category.xml');
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
     public String getQuizFile(String uniqueFolderId,String fileName){
         HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');  
        //http://cdn.wagmob.com/subject/333/xml/android/wtoolbasedproactiveselling00beforefail_1.xml
        req.setEndpoint('http://cdn.wagmob.com/subject/'+uniqueFolderId+'/xml/android/'+fileName+'.xml');
        req.setTimeout(60000);
         try {
            if(Test.isRunningTest()){
            res = new HttpResponse();  
            res.setHeader('Content-type', 'application/xml');
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
    public String getRestfulWSResponse(Map<String, String> parameter,String method,String url,String accesstoken){
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type','application/json');  
        req.setHeader('appkey','508d67f4-4b39-11e5-aed8-f891effb198d');
        //req.setHeader('ApiKey','D66F7D34-54EE-42CE-AD5D-D9A70C04DEC9');
        req.setHeader('oauthtoken',accesstoken);
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
        return res.getBody();
    }
    public String getRestfulGuidemeWSResponse(Map<String, String> parameter,String method,String url){
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type','application/json');  
        req.setHeader('appkey','E99DB1C2-9AAE-4C18-8E69-2F369CEC8148');
        req.setHeader('userkey','F12671E5-BBFB-4BAB-968B-2F043E6549C5');
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
        return res.getBody();
    }
    public String getWSResponse_SalesU(Map<String, String> parameter,String method,String url,String accesstoken){
        HttpRequest req = new HttpRequest();
        HttpResponse res;
        Http http = new Http();
        req.setEndpoint(url);
        req.setMethod(method);
        req.setHeader('Content-Type','application/json');  
        req.setHeader('ApiKey','19b75efe43c95a2b66319d6e6529a27c233e101ccb70c32bd785880b35ed9247');
        if(url.contains('refreshtoken')){
        req.setHeader('RefreshToken',accesstoken);    
        }
        req.setHeader('AccessToken',accesstoken);
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
        return res.getBody();
    }  
  public String getJsonResponse(String jsonString,String value){
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
    
     public List<String> getJsonResponseList(String jsonString,String value){
        List<String> jsonResult= new List<String>();
        JSONParser parser = JSON.createParser(jsonString);
         while (parser.nextToken() != null) {
         if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
             String fieldName = parser.getText();
		     parser.nextToken();
		if(fieldName == value) {
			jsonResult.add(parser.getText());
   		}
         }
      }
        return jsonResult;
    } 
    
    public static String uploadFile(Blob file_body,String file_name,String accesstoken){
      String boundary = '----------------------------741e90d31eff';
      String header = '--'+boundary+'\nContent-Disposition: form-data; name="file"; filename="'+file_name+'";\nContent-Type: application/octet-stream';
      String footer = '--'+boundary+'--';             
      String headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
      while(headerEncoded.endsWith('='))
      {
       header+=' ';
       headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\n\r\n'));
      }
      String bodyEncoded = EncodingUtil.base64Encode(file_body);
      Blob bodyBlob = null;
      String last4Bytes = bodyEncoded.substring(bodyEncoded.length()-4,bodyEncoded.length());
     if(last4Bytes.endsWith('==')) {
        last4Bytes = last4Bytes.substring(0,2) + '0K';
        bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
        String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
        bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);
      } else if(last4Bytes.endsWith('=')) {
        last4Bytes = last4Bytes.substring(0,3) + 'N';
        bodyEncoded = bodyEncoded.substring(0,bodyEncoded.length()-4) + last4Bytes;
        footer = '\n' + footer;
        String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
        bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);              
      } else {
        footer = '\r\n' + footer;
        String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
        bodyBlob = EncodingUtil.base64Decode(headerEncoded+bodyEncoded+footerEncoded);  
      }
      HttpRequest req = new HttpRequest();
      req.setHeader('Content-Type','multipart/form-data; boundary='+boundary);
      req.setHeader('appkey','b4329004-40bd-11e4-b461-6f7707bea4f9');
      req.setHeader('accesstoken',accesstoken);
      req.setMethod('POST');
      req.setEndpoint('https://php-v5-webservice.azurewebsites.net/api/v5/uploadfile');
      req.setBodyAsBlob(bodyBlob);
      req.setTimeout(120000);
      Http http = new Http();
      HTTPResponse res = http.send(req);
      return res.getBody();
}  
}