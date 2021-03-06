public class ProductTrainingController {
    private Config config;
    public String query{set;get;}
    public String video_id{set;get;}
    public String category_id{set;get;}
    public String tour_id{set;get;}
    public ProductTrainingController(){
        config = new Config();
    }
    public PageReference getPerfectTheDemo(){
        PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab);
        page.setRedirect(true);
        return page;
    }
    public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab);
        page.setRedirect(true);
        return page;
    }
    public PageReference searchVideoInfo(){ 
        video_id = System.currentPageReference().getParameters().get('video_id');
        String speech_id = System.currentPageReference().getParameters().get('speech_id');
        PageReference page = new PageReference('/apex/share_pitch?sfdc.tabName='+config.currentTab);
        page.getParameters().put('video_id',video_id);
        page.getParameters().put('speech_id',speech_id);
        page.setRedirect(true);
        return page;
    } 
    public PageReference searchVideoInfoDemo(){ 
        PageReference page = new PageReference('/apex/video_page?sfdc.tabName='+config.currentTab);
        page.getParameters().put('tour_id',tour_id);
         page.getParameters().put('category_id',category_id);
        page.setRedirect(true);
        return page;
    } 
    
    public PageReference getLeaderBoard(){
     PageReference page = new PageReference('/apex/leaderboard?sfdc.tabName='+config.currentTab); 
     page.setRedirect(true);
        return page;        
    }
    
}