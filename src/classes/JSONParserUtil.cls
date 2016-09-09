public class JSONParserUtil {
    @future(callout=true)
    public static void parseJSONResponse() {        
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'http://php-v5-webservice.azurewebsites.net/api/v5/test';
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        HttpResponse response = httpProtocol.send(request);
        system.debug('result =' + response.toString());
    }   
}