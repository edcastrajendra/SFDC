public class insertnewrecordController{
    Public List<TrackingProgress__c> getData{set;get;}
    public List<String>  sub{set;get;}
public insertnewrecordController() {
    sub = new List<String>();
    getData = [select subject_id__c,milestone_id__c,sub_milestone_id__c,task_id__c from TrackingProgress__c];
    for(TrackingProgress__c track : getData){
        sub.add(track.subject_id__c);
        sub.add(track.milestone_id__c);
        sub.add(track.sub_milestone_id__c);
        sub.add(track.task_id__c);
    }  
}

 
}