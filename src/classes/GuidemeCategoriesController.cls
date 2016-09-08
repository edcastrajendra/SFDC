public class GuidemeCategoriesController {
    public String category_id{set;get;}
    public String guideme_categories{set;get;}
    public PeersDTO guidemedto{set;get;}
    public String parent_id{set;get;}
    private Config config;
    public GuidemeCategoriesController(){
        config = new Config();
    }
    public void getGuidemeCategories(){
        guideme_categories = new CallingWebServices().getRestfulGuidemeWSResponse(new Map<String,String>(),'GET',config.guideme_url+'client/categories?parentid=0&page=1');
         guidemedto =  (PeersDTO)System.JSON.deserialize(guideme_categories, PeersDTO.class); 
    }

    public PageReference getCategoriesByCategoryId(){
        parent_id =  System.currentPageReference().getParameters().get('parent_id');
        PageReference page = new PageReference('/apex/g_cat_parent?sfdc.tabName='+config.currentTab);
        page.getParameters().put('parent_id',parent_id);
        page.setRedirect(true);
        return page;
    }
    public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab); 
        return page;
    }
}