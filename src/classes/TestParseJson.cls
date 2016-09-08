public class TestParseJson {
  public  String group_id{set;get;}
     public  String getspeechlist{set;get;}
     public  String peersJson{set;get;}
     public  String accesstoken{set;get;}
     public  String refreshtoken{set;get;}
    public  String jsondata{set;get;}
     public String url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1'; 
    public PeersDTO dto{set;get;}
    public TestParseJson(){
             Map<String,String> parameter = new Map<String,String>();
             parameter.put('email_id','test@test.com');
             parameter.put('password', '123456');
             parameter.put('keep_login', '1');
             jsondata = new CallingWebServices().getWSResponse_SalesU(parameter, 'POST', url+'/user/signin', 'NA');
             refreshtoken = new CallingWebServices().getJsonResponse(jsondata,'refreshtoken'); 
             accesstoken =  getAccessToken(refreshtoken);  
             getspeechlist = new CallingWebServices().getWSResponse_SalesU(parameter,'GET',url+'/speech/list?page=1',accesstoken);
        
    }
     public String getAccessToken(String refreshtoken){
         Map<String,String> parameter = new Map<String,String>();
         jsondata = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',url+'/user/refreshtoken',refreshtoken);   
         accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');  
        return accesstoken;
    }

    }