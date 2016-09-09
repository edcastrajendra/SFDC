public class actfuncon {
public string dte {get;set;}
public List<String> xmlData {set;get;}    
public string act() {
dte = new CallingWebServices().getMileStone('224');
 xmlData = XMLParser(dte);     
return null;
}
 public List<String> XMLParser(String strXml) {           
        List<String> xmlstring =new List<String>();
        Dom.Document doc = new Dom.Document();
        doc.load(strXml);
        Dom.XMLNode node = doc.getRootElement();
        for(integer i=0; i < node.getChildElements().size(); i++)
        {
            Dom.XMLNode Body = node.getChildElements()[i];
            for(Dom.XMLNode child : Body.getChildElements())
            {
                String Text = child.getText();
                if(child.getText().contains('%23'))
                Text = child.getText().replace('%23', '&');
                xmlstring.add(Text);
            }
        }
    return xmlstring;
    }     
}