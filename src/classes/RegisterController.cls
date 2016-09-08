public class RegisterController {
    
    public String firstName {set;get;}
    public String lastName {set;get;}
    public String email {set;get;}
    public String password {set;get;}
    public Blob file {set;get;}
    public String fileName {set;get;}
    public String jsonString;
    public String errorMessage= 'Oops! An error occured. Please try again after some time.';
    public CallingWebServices webServiceObject;
    public RegisterController(){
        webServiceObject = new CallingWebServices();
    }
    
     public PageReference registerUser(){
           Map<String, String> parameter = new Map<String, String>();
           parameter.put('first_name', firstName);
           parameter.put('last_name', lastName);
           parameter.put('user_email', email);
           parameter.put('password', password);
           String url = '/user/register/wagmob';
           String accesstoken = 'na';
           String method= 'POST';
           jsonString = webServiceObject.getRestfulWSResonse(parameter, method, url, accesstoken);
          // jsonString = webServiceObject.getCdnData();
         if(jsonString!=null){
            String error = webServiceObject.getJsonResponse(jsonString, 'error');
            String message = webServiceObject.getJsonResponse(jsonString, 'message');
             if(error !=null && message!=null){
                 if(error=='false'){
                  PageReference newPage = new PageReference('/apex/registerSuccess');
                  Map<String,String> parameters = new Map<String,String>{'success'=>message};
                  newPage.getParameters().putAll(parameters);
                  newPage.setRedirect(true);
                  return newPage;  
                 }else{
                PageReference newPage = new PageReference('/apex/errorPage');
                Map<String,String> parameters = new Map<String,String>{'message'=>message};
                newPage.getParameters().putAll(parameters);
                newPage.setRedirect(true);
                return newPage;    
                 }
             }else{
                PageReference newPage = new PageReference('/apex/errorPage');
                Map<String,String> parameters = new Map<String,String>{'message'=>errorMessage};
                newPage.getParameters().putAll(parameters);
                newPage.setRedirect(true);
                return newPage;   
             }
         }else{
                PageReference newPage = new PageReference('/apex/errorPage');
                Map<String,String> parameters = new Map<String,String>{'message'=>errorMessage};
                newPage.getParameters().putAll(parameters);
                newPage.setRedirect(true);
                return newPage;
         }  
    }
}