public class JsonTest {
    public fromJSON jsonDto{set;get;}
    public JsonTest(){
        
        String jsontest='{"invoiceList":[{"totalPrice":"5.5","statementDate":"2011-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":"1.0","Quantity":"5.0","ProductName":"Pencil"},{"UnitPrice":"0.5","Quantity":"1.0","ProductName":"Eraser"}],"invoiceNumber":"1"}'+
		',{"totalPrice":"11.5","statementDate":"2011-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":"6.0","Quantity":"1.0","ProductName":"Notebook"}],"invoiceNumber":"2"}]}'+
		'';
        jsonDto = (fromJSON)JSON.deserialize(jsontest, fromJSON.class);
    }
}