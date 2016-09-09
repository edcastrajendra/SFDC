public class Workbook {
    public String tutorialid{set;get;}
    public String taskid{set;get;}
    public String workbookfilename{set;get;}
    public String containerid{set;get;}
    public String elementtitle{set;get;}
    public String taskimage{set;get;}
    public String ismandatory{set;get;}
    
     public String getTaskId(){
        return taskid;
    }
    public String getIsmandatory(){
        return ismandatory;
    }
}