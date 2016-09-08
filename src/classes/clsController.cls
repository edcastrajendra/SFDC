public class clsController {
    public String jsonCDN{set;get;}
    public OrgInfoDto dto{set;get;}
    public String mileStoneXML{set;get;}
    public String uniqueId;
    
    public clsController(){
         
    }
    
    public String getUniqueId(){
        return uniqueId;
    }
    public void setUniqueId(String uniqueId){
         uniqueId = uniqueId;
    }
    
    public String getMileStone(){
         mileStoneXML = new CallingWebServices().getMileStone(uniqueId);
         return null;
    }
}