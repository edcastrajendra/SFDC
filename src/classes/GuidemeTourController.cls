public class GuidemeTourController {
   
    public String tours{set;get;}
    public PeersDTO toursdto{set;get;}
    public String category_id{set;get;}
    public String tour_id{set;get;}
    private Config config;
    public GuidemeTourController(){
        config = new Config();
    }
    public void getGuidemeTour(){
       category_id =  System.currentPageReference().getParameters().get('category_id');
       tours = new CallingWebServices().getRestfulGuidemeWSResponse(new Map<String,String>(),'GET',config.guideme_url+'client/tours?category_id='+ category_id +'&page=1'); 
       toursdto = (PeersDTO)System.JSON.deserialize(tours, PeersDTO.class);
    }
    
    public PageReference getTourVideoByTourId(){
        tour_id =  System.currentPageReference().getParameters().get('tour_id');
        category_id =  System.currentPageReference().getParameters().get('category_id');
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
        page.getParameters().put('category_id',category_id);
        page.setRedirect(true);
        return page;
    }
    
}