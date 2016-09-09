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
   public String rating; 
   public String comments{set;get;}
   public String addCommentsJson{set;get;}
   public String guideme_URL = 'https://prodguidemews.wagmob.com/v1/';
   public GuidemeTourVideoInfoController(){
    config = new Config();
    salesU = new SalesUAccessToken();
        if(accesstoken == null){
           accesstoken =  salesU.getAccessToken();
        }   
    }
    public String getRating(){
        return rating;
    }
    public void setRating(String rating){
        this.rating =rating;
    }
    
    public List<SelectOption> getRatingPoint(){
       List<SelectOption> options = new List<SelectOption>();  
        options.add(new SelectOption('1','')); 
        options.add(new SelectOption('2','')); 
        options.add(new SelectOption('3',''));
        options.add(new SelectOption('4',''));
        options.add(new SelectOption('5',''));
        return options; 
    }
   public void getVideoInfo(){
        tour_id =  System.currentPageReference().getParameters().get('tour_id');
        stepJson = new CallingWebServices().getRestfulGuidemeWSResponse(new Map<String,String>(),'GET',config.guideme_url+'client/tour?tour_id='+ tour_id +'&page=1'); 
        video_azure = new CallingWebServices().getJsonResponse(stepJson,'video_azure');
        tours = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/usertours?page=1'); 
        toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);
   } 
    
    public PageReference addComments(){
       Map<String,String> parameter =new Map<String,String>();
       parameter.put('speech_id', speech_id);
       parameter.put('points', rating);
       parameter.put('message', comments);
        try{
        addCommentsJson = new CallingWebServices().getWSResponse_SalesU(parameter,'POST',config.url+'/speech/rating',accesstoken);    
        }catch(Exception e){   
        }  
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
        page.getParameters().put('speech_id',speech_id);
        page.setRedirect(true);
       return page;
    }
    
    public void getTourVideoByTourId(){
         String tourId =  System.currentPageReference().getParameters().get('tourId');
         stepJson = new CallingWebServices().getRestfulGuidemeWSResponse(new Map<String,String>(),'GET',config.guideme_url+'client/tour?tour_id='+ tourId +'&page=1'); 
        video_azure = new CallingWebServices().getJsonResponse(stepJson,'video_azure');
        tours = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/usertours?page=1'); 
        toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);
    } 
    
    public PageReference getSharePage(){
         PageReference page = new PageReference('/apex/share_demo?sfdc.tabName='+config.currentTab);
         page.setRedirect(true);
         return page;
    }
    
}