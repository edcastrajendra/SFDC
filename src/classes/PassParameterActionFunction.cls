public with sharing class PassParameterActionFunction {
    public String val{get;set;}
    public String enteredText1{get;set;}
    public String enteredText2{get;set;}
    public String mileStoneXML{set;get;}
     public Integer size{set;get;}
    public List<Item> xmlData {set;get;}
    public void echoVal()
    {
     val = 'You have entered : 1 - '+enteredText1;
     mileStoneXML = new CallingWebServices().getMileStone(enteredText1);
    xmlData = parse(mileStoneXML);
        //size = xmlData.size();
    }
    public  Map<String,String> XMLParser(String strXml) {           
         Map<String,String> xmlstring =new  Map<String,String>();
        Dom.Document doc = new Dom.Document();
        doc.load(strXml);
        Dom.XMLNode node = doc.getRootElement();
        for(integer i=0; i < node.getChildElements().size(); i++)
        {
            Dom.XMLNode Body = node.getChildElements()[i];
            for(Dom.XMLNode child : Body.getChildElements())
            {  
             if(child.getName()=='containerid'){
               xmlstring.put(child.getName(),child.getText());  
             }
            }
        }
    return xmlstring;
    }
    
  public List<Item> parse(string toParse) {
        List<Item> items = new List<Item>();
        DOM.Document doc = new DOM.Document();
        doc.load(toParse);    
        parseItems(doc.getRootElement(), items);
        return items;
    }
 
    public void parseItems(DOM.XMLNode node, List<Item> items){
         for (Dom.XMLNode child : node.getChildElements()) {
              if (child.getName() == 'item') {
                Item itm = new Item();
                parseItem(child, itm);
                items.add(itm);
            }
         }
    }
    
    public void parseItem(DOM.XMLNode node, Item itm){
         for (Dom.XMLNode child : node.getChildElements()) {
            if (child.getName() == 'id') {
                itm.id = child.getText().trim();
            } else if (child.getName() == 'containerid') {
                itm.containerid = child.getText().trim();
            } else if (child.getName() == 'view') {
                itm.view = child.getText().trim();
            } else if (child.getName() == 'title') {
                itm.title = child.getText().trim();
            }else if (child.getName() == 'subitem') {
              //  SubItem subitm = new SubItem();
               // itm.subitem = parseSubItem(child,subitm);
            }
        }
    }
    /* public List<SubItem> parseSubItem(DOM.XMLNode node,SubItem items){
          List<SubItem>  subitems = new  List<SubItem>();
         for (Dom.XMLNode child : node.getChildElements()) {
              if (child.getName() == 'subid') {
              items.subid = child.getText().trim();
            }
             subitems.add(items);
         }
         return subitems;
    }*/
}