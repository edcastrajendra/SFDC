public class GuidemeTourController {
   
    public String tours{set;get;}
    public PeersDTO toursdto{set;get;}
    public String category_id{set;get;}
    public String tour_id{set;get;}
    private Config config;
    public String guideme_URL = 'https://prodguidemews.wagmob.com/v1/';
    public String searchQuery{set;get;}
    public String speech_id{set;get;}
    public GuidemeTourController(){
        config = new Config();
    }
    public void getGuidemeTour(){
       tours = new CallingWebServices().getGuidemeWSResponseNew(new Map<String,String>(),'GET',guideme_URL+'client/usertours?page=1');  
       toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);
    }
    
    public PageReference getTourVideoByTourId(){
        tour_id =  System.currentPageReference().getParameters().get('tour_id');
        category_id =  System.currentPageReference().getParameters().get('category_id');
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
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