public class UploadPictureToCloudinaryController{
  public Attachment picture {get;set;}
  public string dispresp{get;set;}
  public string pictureurl{get;set;}
  public UploadPictureToCloudinaryController(){
    picture = new Attachment();
  }
  public PageReference attachFile(){

    //specify the cloud name,apikey and apisecret
    String cloudName='';
    String apikey='';
    String apisecret='';

    /* upload image to cloudinary */
    // Instantiate a new http object
    Http h = new Http();
    // Instantiate a new HTTP request, specify the method (POST) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://php-v5-webservice.azurewebsites.net/api/v5/uploadfile');
    req.setMethod('POST');

    //base64encode picture body
    String pictureString = EncodingUtil.base64Encode(picture.body);
    //'UTF-8' encode
    pictureString= EncodingUtil.urlEncode(pictureString, 'UTF-8');

    String tiStmp=String.valueOf(System.NOW().getTime() / 1000);
    String myData = 'public_id=CldinaryImg&timestamp='+tiStmp+apisecret;
    Blob hash = Crypto.generateDigest('SHA1',Blob.valueOf(myData));
    String hexDigest = EncodingUtil.convertToHex(hash);
    String fileString = 'data:image/png;base64,';

    String finalBodyString ='public_id=CldinaryImg&api_key=’+apikey+’&timestamp='+EncodingUtil.urlEncode(tiStmp, 'UTF-8')+'&signature='+EncodingUtil.urlEncode(hexDigest, 'UTF-8')+'&file='+EncodingUtil.urlEncode(fileString, 'UTF-8')+pictureString;

    req.setBody(finalBodyString);
    HttpResponse res = h.send(req);
    parseJSON(res);
    return null;
  }

  //method to parse json response from cloudinary and get url value of the image
  public void parseJSON(HttpResponse respurl){
    JSONParser parser = JSON.createParser(respurl.getBody());

    while (parser.nextToken() != JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String text = parser.getText();
        parser.nextToken();
        if (text == 'url') {
          pictureurl = parser.getText();
          break;
        }
      }
    }
  }
}