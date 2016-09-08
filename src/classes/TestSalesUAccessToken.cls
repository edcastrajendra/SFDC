@isTest
public class TestSalesUAccessToken {
    
    static testMethod void testAccessToken(){ 
    Test.startTest();    
    SalesUAccessToken token = new SalesUAccessToken(); 
    String accesstoken =  token.getAccessToken();
    system.assertEquals(null,accesstoken);  
    Test.stopTest();   
    }

}