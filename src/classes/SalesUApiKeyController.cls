public class SalesUApiKeyController {
    public String apiKeySU{set;get;}
    public String apiKeyPTD{set;get;}
    public String userKeyPTD{set;get;}
    public List<ApiKey_SU__c> apiList{set;get;}
    public List<String> alist{set;get;}
    public SalesUApiKeyController(){
    }
    public PageReference insertKey(){
    ApiKey_SU__c  api = new ApiKey_SU__c(); 
    api.api_key_su__c =  apiKeySU;     
    api.api_key_ptd__c = apiKeyPTD;
    api.user_key_ptd__c = userKeyPTD; 
    insert api;   
    PageReference page = new PageReference('/apex/apikeypage'); 
    return page;
    }
    public PageReference editKey(){ 
    PageReference page = new PageReference('/apex/SalesU_AppKey'); 
    return page;
    }
    public void getApiKey(){
    alist = new List<String>();
    apiList = [SELECT api_key_su__c,api_key_ptd__c,user_key_ptd__c FROM ApiKey_SU__c];
        for(ApiKey_SU__c apikey : apiList){
            alist.add(apikey.api_key_su__c);
            alist.add(apikey.api_key_ptd__c);
            alist.add(apikey.user_key_ptd__c);
            
       }
    apiKeySU = alist[0];
    apiKeyPTD = alist[1];
    userKeyPTD = alist[2];
    }
    
}