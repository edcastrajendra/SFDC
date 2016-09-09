public with sharing class LoginController {
    
     public String loginID { get; set; }
     public String password { get; set; }
     public String jsonString;
     public CallingWebServices webServiceObject;
    public LoginController(){
        webServiceObject = new CallingWebServices();
    }
    
    public PageReference loginUser() {
        
           Map<String, String> parameter = new Map<String, String>();
           parameter.put('user_email', loginID);
           parameter.put('password', password);
           String url = '/user/login/wagmob';
           String accesstoken = 'na';
           String method= 'POST';
           jsonString = webServiceObject.getRestfulWSResonse(parameter, method, url, accesstoken);
           accesstoken = webServiceObject.getJsonResponse(jsonString, 'accesstoken');
           parameter.put('email', loginID);
           url = '/users/get';
           jsonString = webServiceObject.getRestfulWSResonse(parameter, method, url, accesstoken);
           String userID = webServiceObject.getJsonResponse(jsonString, 'id');
           PageReference newPage = new PageReference('/apex/loginSuccess');
           Map<String,String> parameters = new Map<String,String>{'userid' => userID};
           newPage.getParameters().putAll(parameters);
           newPage.setRedirect(true);
           return newPage;    
             
       }
}