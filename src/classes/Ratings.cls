public class Ratings {
    public String user_id{set;get;}
    public String first_name{set;get;}
    public String last_name{set;get;}
    public String image_url{set;get;}
    public String points{set;get;}
    public String message{set;get;}
    public String creation_date;
    
    public String getCreation_Date(){
        DateTime dateInstance = datetime.newInstanceGmt(1970, 1, 2, 0, 0, 0);
        creation_date = dateInstance.addSeconds(Integer.valueOf(creation_date)).format();
        return creation_date;
    }
    
    public void setCreation_Date(String creation_date){
        this.creation_date = creation_date;
    }
}