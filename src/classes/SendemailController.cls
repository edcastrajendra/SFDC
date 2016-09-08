Public with sharing class SendemailController{
   Public SendemailController(){
   }
 Public void sendEmailFunction(){
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   String[] toAddresses = new String[] {'rajendra.baghel@wagmob.com','rajendra.baghel@wagmob.com'}; 
   String[] ccAddresses = new String[] {'rajendra.baghel@wagmob.com','rajendra.baghel@wagmob.com'};
   mail.setToAddresses(toAddresses);
   mail.setCcAddresses(ccAddresses);
   mail.setReplyTo('rajendra.baghel@wagmob.com');
   mail.setSenderDisplayName('My Name');
   mail.setSubject('Testing email through apex');
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setPlainTextBody('This is test email body. This mail is being sent from apex code');
   mail.setHtmlBody('<b> This is HTML body </b>' );
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 } 
}