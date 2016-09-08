@isTest
private class CallingWebServicesTest {
    
    static testMethod void unitTest() {
        
         CallingWebServices cws = new CallingWebServices();
           Map<String, String> parameter = new Map<String, String>();
           parameter.put('user_email', 'pm@pm.com');
           parameter.put('password', '12345');
          String url = '/user/login/wagmob';
          String accesstoken = 'na';
          String method= 'POST';
        
        System.assertNotEquals(cws.getRestfulWSResonse(parameter, method, url, accesstoken),null);
        System.debug(cws.getRestfulWSResonse(parameter, method, url, accesstoken));
    }

   
    
}