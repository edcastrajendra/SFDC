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
        String jsondata = new CallingWebServices().getWSResponse_SalesU(parameter, 'POST', config.url+'/user/signin', 'NA');
        accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');  
        refreshtoken = new CallingWebServices().getJsonResponse(jsondata,'refreshtoken');  
        return accesstoken;
    }
}