public class PerfectTheDemoController {
     private Config config;
    public PerfectTheDemoController(){
        config = new Config();
    }
    
    public PageReference getMyDemo(){
        PageReference page = new PageReference('/apex/g_cat?sfdc.tabName='+config.currentTab); 
        return page;
    }
    
    public PageReference getCommunityDemo(){
        PageReference page = new PageReference('/apex/g_cat?sfdc.tabName='+config.currentTab); 
        return page;
    }
    public PageReference getPerfectThePitch(){
        PageReference page = new PageReference('/apex/perfect_the_pitch?sfdc.tabName='+config.currentTab); 
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
    
    public PageReference getLeaderBoard(){
     PageReference page = new PageReference('/apex/leaderboard?sfdc.tabName='+config.currentTab); 
     page.setRedirect(true);
        return page;        
    }
}