public class AccessTokenSingleton {
    // private static variable referencing the class
    private static AccessTokenSingleton instance = null;
    public String accesstoken {get;private set;} // the id of the record type
    private Config config;
    // The constructor is private and initializes the id of the record type
    private AccessTokenSingleton(){
         config = new Config(); 
         Map<String,String> parameter = new Map<String,String>();
         parameter.put('email_id','test@test.com');
         parameter.put('password', '123456');
         parameter.put('keep_login', '1');
        String jsondata = new CallingWebServices().getWSResponse_SalesU(parameter, 'POST', config.url+'/user/signin', 'NA');
        accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');  
        //refreshtoken = new CallingWebServices().getJsonResponse(jsondata,'refreshtoken');  
    }
    // a static method that returns the instance of the record type
    public static AccessTokenSingleton getInstance(){
        // lazy load the record type - only initialize if it doesn't already exist
        if(instance == null) instance = new AccessTokenSingleton();
        return instance;
    }
}