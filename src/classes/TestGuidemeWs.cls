public class TestGuidemeWs {
    public String guideme_categories{set;get;}
    public String guideme_url{set;get;} 
    public String accesstoken{set;get;}
    public Message guidemeDto{set;get;} 
    public TestGuidemeWs(){
        guideme_url ='https://phpservice.wagmob.com/v1/client/categories?parentid=0&page=1'; 
          Map<String,String> parameter = new Map<String,String>();
       guideme_categories = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url);
        
    //  guideme_url = (Message)System.JSON.deserialize(guideme_categories, Message.class);
    }
}