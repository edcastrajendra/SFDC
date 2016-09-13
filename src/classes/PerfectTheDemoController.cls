public class PerfectTheDemoController {
     private Config config;
     public String searchQuery{set;get;}
     public String speech_id{set;get;}
    public String tour_id{set;get;}
    public PerfectTheDemoController(){
        config = new Config();
    }
    
    public PageReference getMyDemo(){
        PageReference page = new PageReference('/apex/tour?sfdc.tabName='+config.currentTab); 
        return page;
    }
    
    public PageReference getCommunityDemo(){
        PageReference page = new PageReference('/apex/tour?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab); 
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
    public PageReference getLeaderBoard(){
     PageReference page = new PageReference('/apex/leaderboard?sfdc.tabName='+config.currentTab); 
     page.setRedirect(true);
        return page;        
    }
}