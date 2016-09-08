public class Config {
    
    public String currentTab{set;get;}
    public String  guideme_url{set;get;}
    public String url;
    public String accesstoken;
    public String refreshtoken;
    public Config() {
        guideme_url = 'https://phpservice.wagmob.com/v1/'; 
        url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1';
        currentTab = ApexPages.currentPage().getParameters().get('sfdc.tabName');   
    }
    
    public String getaccesstoken(){
        return accesstoken;
    }
    
    public void setaccesstoken(String accesstoken){
        this.accesstoken = accesstoken;
    }
    
    public String getrefreshtoken(){
        return refreshtoken;
    }
    
    public void setrefreshtoken(String refreshtoken){
        this.refreshtoken = refreshtoken;
    }
}