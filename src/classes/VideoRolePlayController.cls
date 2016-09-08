public class VideoRolePlayController {
    public String jsondata{set;get;}
    public String accesstoken{set;get;}
    public String refreshtoken{set;get;}
    public String locator_url{set;get;}
    public string dispresp{get;set;}
    public string pictureurl{get;set;}
    public String response{set;get;}
    public String asset_id{set;get;}
    public String locator_id{set;get;}
    public String access_policy_id{set;get;}
    public String uploadstatus{set;get;}
    public String url{set;get;}
    public String video_id{set;get;}
    public String video_title{set;get;}
    public String video_desc{set;get;}
    public String video_url{set;get;}
    public String getusergroups{set;get;}
    public String group_id{set;get;}
    public String group_name{set;get;}
    public String peersJson{set;get;}
    public List<String> peersList{set;get;}
    public PeersDTO dto{set;get;}
    public String guideme_categories{set;get;}
    public String categories{set;get;}
    public String guideme_url{set;get;} 
    public PeersDTO guidemedto{set;get;}
    public PeersDTO categoriesdto{set;get;}
    public PeersDTO toursdto{set;get;}
    public PeersDTO stepsdto{set;get;}
    public String category_id{set;get;}
    public String categoryIdTour{set;get;}
    public String tours{set;get;}
    public String steps{set;get;}
    public String tourId{set;get;}
     public String tour_Id{set;get;}
    public VideoRolePlayController(){
            guideme_url ='https://phpservice.wagmob.com/v1/';
            url = 'https://salusuapiprod-stage.azurewebsites.net/client/v1';
            Map<String,String> parameter1 = new Map<String,String>();
            parameter1.put('email_id','test@test.com');
            parameter1.put('password', '123456');
            parameter1.put('keep_login', '1');
           jsondata = new CallingWebServices().getWSResponse_SalesU(parameter1, 'POST', url+'/user/signin', 'NA');
           accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');  
           refreshtoken = new CallingWebServices().getJsonResponse(jsondata,'refreshtoken');  
           Map<String,String> parameter2 = new Map<String,String>();
           jsondata = new CallingWebServices().getWSResponse_SalesU(parameter2, 'GET',url+'/file/locator',accesstoken);
           locator_url = new CallingWebServices().getJsonResponse(jsondata,'_locator_url');
           asset_id = new CallingWebServices().getJsonResponse(jsondata,'_asset_id');
           locator_id= new CallingWebServices().getJsonResponse(jsondata,'_locator_id');
           access_policy_id = new CallingWebServices().getJsonResponse(jsondata,'_access_policy_id');
           guideme_categories = new CallingWebServices().getRestfulGuidemeWSResponse(parameter2,'GET',guideme_url+'client/categories?parentid=0&page=1');
           guidemedto =  (PeersDTO)System.JSON.deserialize(guideme_categories, PeersDTO.class); 
           
    }
    public PageReference getPerfectTheDemo(){
        PageReference page = new PageReference('/apex/perfect_the_demo');
        return page;
    }
    public PageReference getGuidemeCategories(){
     Map<String,String> parameter2 = new Map<String,String>();    
     guideme_categories = new CallingWebServices().getRestfulGuidemeWSResponse(parameter2,'GET',guideme_url+'client/categories?parentid=0&page=1');
     guidemedto =  (PeersDTO)System.JSON.deserialize(guideme_categories, PeersDTO.class);  
     PageReference page = new PageReference('/apex/guideme_categories');
        return page;
    }
    public PageReference getCategoriesByCategoryId(){
        Map<String,String> parameter = new Map<String,String>();
        categories = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url+'client/categories?parentid='+ category_id +'&page=1'); 
        String error =  new CallingWebServices().getJsonResponse(categories,'error');
        if(error == 'true'){
        PageReference page = new PageReference('/apex/errorPage');
        page.setRedirect(true);    
        return page;   
        }
        categoriesdto =  (PeersDTO)System.JSON.deserialize(categories, PeersDTO.class);
        PageReference page = new PageReference('/apex/categories_by_parent_id?parentId='+category_id);
        page.setRedirect(true);    
        return null;
    }
    public PageReference getCategories(){
        Map<String,String> parameter = new Map<String,String>();
        categories = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url+'client/categories?parentid='+ category_id +'&page=1'); 
        String error =  new CallingWebServices().getJsonResponse(categories,'error');
        if(error == 'true'){
        PageReference page = new PageReference('/apex/errorPage');  
         page.setRedirect(true);        
        return page;   
        }
        categoriesdto =  (PeersDTO)System.JSON.deserialize(categories, PeersDTO.class);
        PageReference page = new PageReference('/apex/categories_by_parent_id');
        page.setRedirect(true);    
        return null;
    }
    public PageReference getTourByCategoryId(){
       Map<String,String> parameter = new Map<String,String>();
       tours = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url+'client/tours?category_id='+ categoryIdTour +'&page=1'); 
       toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);
       return null;
    }  
    public PageReference getStepByTourId(){
       Map<String,String> parameter = new Map<String,String>();
        steps = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url+'client/tour?tour_id='+ tourId +'&page=1'); 
        stepsdto = (PeersDTO)System.JSON.deserialize(steps, PeersDTO.class);
        return null;
    }
    public PageReference getStepByTour_Id(){
       Map<String,String> parameter = new Map<String,String>();
        steps = new CallingWebServices().getRestfulGuidemeWSResponse(parameter,'GET',guideme_url+'client/tour?tour_id='+ tourId +'&page=1'); 
        stepsdto = (PeersDTO)System.JSON.deserialize(steps, PeersDTO.class);
        return null;
    }
    public PageReference completeUploadVideo(){
          Map<String,String> parameter = new Map<String,String>();
          parameter.put('asset_id', asset_id);
          parameter.put('locator_id', locator_id);
          parameter.put('access_policy_id', access_policy_id);
          accesstoken = getAccessToken(refreshtoken);
          uploadstatus =  new CallingWebServices().getWSResponse_SalesU(parameter,'POST',url+'/file/uploadstatus',accesstoken); 
          video_id =  new CallingWebServices().getJsonResponse(uploadstatus,'video_id');
          video_url = new CallingWebServices().getJsonResponse(uploadstatus,'video_url');
          getusergroups = new CallingWebServices().getWSResponse_SalesU(parameter,'GET',url+'/user/groups?page=1',accesstoken);
          dto =  (PeersDTO)System.JSON.deserialize(getusergroups, PeersDTO.class);
         return null;
    }
    
    public String getAccessToken(String refreshtoken){
         Map<String,String> parameter = new Map<String,String>();
         String jsondata = new CallingWebServices().getWSResponse_SalesU(parameter, 'POST',url+'/user/refreshtoken',refreshtoken);   
         accesstoken = new CallingWebServices().getJsonResponse(jsondata,'accesstoken');  
        return accesstoken;
    }
    
    public PageReference getSpeechList(){
        
          return null;
    }
}