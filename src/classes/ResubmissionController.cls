public with sharing class ResubmissionController {
    public boolean isShow { get; set; }
    public Contact contact {get;set;}
    public List<Contact> getContactList() {
        return [Select LastName from Contact order by CreatedDate desc LIMIT 5];
    }
    public ResubmissionController(){
        isShow = true;
        contact = new Contact();
    }
    public PageReference save() {
        insert contact ;
        isShow = false ;
        return null;
    }
  }