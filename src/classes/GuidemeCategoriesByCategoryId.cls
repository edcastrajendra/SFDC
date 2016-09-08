public class GuidemeCategoriesByCategoryId {
    
    public String categories{set;get;}
    public PeersDTO categoriesdto{set;get;}
    public String parent_id{set;get;}
    public String category_id{set;get;}
    private Config config;
  public GuidemeCategoriesByCategoryId(){
      config = new Config();
  }
    
    public void getGuidemeCategoriesByCategory(){
         parent_id = System.currentPageReference().getParameters().get('parent_id');
         categories = new CallingWebServices().getRestfulGuidemeWSResponse(new Map<String,String>(),'GET',config.guideme_url+'client/categories?parentid='+ parent_id +'&page=1'); 
         categoriesdto =  (PeersDTO)System.JSON.deserialize(categories, PeersDTO.class); 
    }
    
    public PageReference getTourByCategoryId(){
       category_id = System.currentPageReference().getParameters().get('category_id');
        PageReference page = new PageReference('/apex/tour?sfdc.tabName='+config.currentTab);
        page.getParameters().put('category_id',category_id);
        page.setRedirect(true);
        return page;
    }
    
        public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab); 
        return page;
    }
}