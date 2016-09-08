public class CRUDOperation {
    
     public string contactfirstname{get;set;}
     public string contactlastname{get;set;}
    
     //public CRUDOperation(ApexPages.StandardSetController controller) {
 
      //  }
    
       public void insertmethod()
                {
                contact cc= new contact();
                cc.Firstname=contactfirstname;
                cc.Lastname=contactlastname;
                insert cc;
               
                }

}