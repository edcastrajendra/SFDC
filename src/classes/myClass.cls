public class myClass {
    // Our test variable        
    public String myString {get; set;}

    public myClass(){
        myString = '';
        myString = UserInfo.getUserEmail();
    }

    // Method for testing a hidden field functionality 
    public PageReference myMethod(){
        System.debug('myString: ' + myString);
        return null;
    }
}