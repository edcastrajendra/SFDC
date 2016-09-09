public class exampleInc {

    Integer count = 0;
                        
    public PageReference incrementCounter() {
            count++;
            return null;
    }
                        
    public PageReference currentCount()
    {
        return ApexPages.currentpage();
    }  
                       
    public Integer getCount() {
        return count;
    }
}