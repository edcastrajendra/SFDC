public class PerfectThePitchController {
    private Config config;
    public String jsonResult{set;get;}
    public String tour_id{set;get;}
    public String category_id{set;get;}
    public PerfectThePitchController(){
         config = new Config();
    }
    
   public PageReference getYourPitch(){
        PageReference page = new PageReference('/apex/pitch?sfdc.tabName='+config.currentTab); 
        return page;
    } 
   
    public PageReference getOurPitch(){
       PageReference page = new PageReference('/apex/our_pitch?sfdc.tabName='+config.currentTab); 
        return page;
    }
    
    public PageReference getCommunityPitch(){
         PageReference page = new PageReference('/apex/community_pitch?sfdc.tabName='+config.currentTab); 
        return page;
    }
     public PageReference getPerfectTheDemo(){
         PageReference page = new PageReference('/apex/perfect_the_demo?sfdc.tabName='+config.currentTab); 
        return page;
    }
    
     public PageReference searchVideoInfo(){ 
        String video_id = System.currentPageReference().getParameters().get('video_id');
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