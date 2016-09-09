public class LoginSuccess {
    public String userid {get;set;}
    public String jsonString {get;set;}
    public LoginDto dto{get;set;}
    public CallingWebServices webServiceObject;
    public LoginSuccess(){
         dto = new LoginDto();
         webServiceObject = new CallingWebServices();
         userid = ApexPages.CurrentPage().getparameters().get('userid');
         Map<String, String> parameter = new Map<String, String>();
         parameter.put('user_id', userid);
         String url = '/user/getuser';
         String accesstoken = 'na';
         String method= 'POST';
         jsonString = webServiceObject.getRestfulWSResonse(parameter, method, url, accesstoken);
         dto = (LoginDto)JSON.deserialize(jsonString, LoginDto.class);         
    } 
}