public class SubItem {
    public String subid{get;set;}
    public String containerid{get;set;}
    public String parentid{set;get;}
    public String subimageview{set;get;}
    public String subtitle{set;get;}
    public List<Video> video{set;get;}
    public List<Tutorial> tutorial{set;get;}
    public Quiz quiz {set;get;}
    public Workbook workbook{set;get;}
    
    public String getContainerId(){
        
        return containerid;
    }
    
    public String getParentId(){
        
        return parentid;
    }
}