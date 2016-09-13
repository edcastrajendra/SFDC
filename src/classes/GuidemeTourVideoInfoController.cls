public class GuidemeTourVideoInfoController {
    
   public String tour_id{set;get;}
   public String video_azure{set;get;}   
   public String stepJson{set;get;}
   public String category_id{set;get;} 
   public String tours{set;get;}
   public PeersDTO toursdto{set;get;}
   public String speech_id{set;get;}  
   private Config config; 
   public PeersDTO ratingDto{set;get;} 
   public String ratingCommentsJson{set;get;} 
   private SalesUAccessToken salesU;
   private String accesstoken; 
   public String ratings{set;get;} 
   public String comments{set;get;}
   public String addCommentsJson{set;get;}
   public String guideme_URL = 'https://prodguidemews.wagmob.com/v1/';
    public String searchQuery{set;get;} 
   public GuidemeTourVideoInfoController(){
    config = new Config();
    salesU = new SalesUAccessToken();
        if(accesstoken == null){
           accesstoken =  salesU.getAccessToken();
        }   
    }
    
   public void getVideoInfo(){
       try{
        tour_id =  System.currentPageReference().getParameters().get('tour_id');
        searchQuery = System.currentPageReference().getParameters().get('query');    
        stepJson = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/tour?tour_id='+ tour_id +'&page=1'); 
        video_azure = new CallingWebServices().getJsonResponse(stepJson,'video_azure');
           if(searchQuery != null){
           toursdto = AutoCompleteController.getAutoCompleteGuidemeTour(searchQuery);    
           }else {
           tours = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/usertours?page=1'); 
           toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);  
           }
        
       }catch(Exception e){
           
       }
   } 
    
    public PageReference setComments(){
       Map<String,String> parameter =new Map<String,String>();
       //parameter.put('speech_id', speech_id);
       //parameter.put('points', ratings);
       //parameter.put('message', comments);
       // try{
       // addCommentsJson = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/rating',accesstoken);    
       // }catch(Exception e){   
        //}  
       // PageReference page = new PageReference('/apex/video_pitch?sfdc.tabName='+config.currentTab);
      //  page.setRedirect(true);
       return null;
    }
    
    public PageReference getTourVideoByTourId(){
         stepJson = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/tour?tour_id='+ tour_id +'&page=1'); 
         video_azure = new CallingWebServices().getJsonResponse(stepJson,'video_azure');
        return null;
    } 
    
    public PageReference getSharePage(){
         PageReference page = new PageReference('/apex/share_demo?sfdc.tabName='+config.currentTab);
         page.setRedirect(true);
         return page;
    }
    
     public PageReference searchVideoInfo(){   
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('query',searchQuery);
        page.getParameters().put('speech_id',speech_id);
        page.setRedirect(true);
        return page;
    } 
    public PageReference searchVideoInfoDemo(){   
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('query',searchQuery);
        page.getParameters().put('tour_id',tour_id);
        page.setRedirect(true);
        return page;
    } 
    public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab); 
        return page;
    }
}