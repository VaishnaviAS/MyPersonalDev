global class bdayreminder implements Database.Batchable<sObject>
{
global database.QueryLocator start(Database.BatchableContext bc){

    String qry='SELECT Email, Birthdate FROM Contact';
    return Database.getQueryLocator(qry);
}

global void execute(Database.BatchableContext bc, List<Contact> scope){
List<String> toAddr = new List<String>();

for(Contact c:scope){
if(c.Birthdate == system.TODAY()){
toAddr.add(c.Email);
}
}

List<Messaging.SingleEmailMessage> mailingList = new List<Messaging.SingleEmailMessage>();
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setToAddresses(toAddr);
mail.setSubject('Happy Birthday');
mail.setPlainTextBody('Wish you a happy birthday!');
mailingList.add(mail);

Messaging.sendEmail(mailingList);

}

global void finish(Database.BatchableContext bc){

}
}