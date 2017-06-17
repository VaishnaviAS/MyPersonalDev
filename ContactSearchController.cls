public class ContactSearchController {

    @AuraEnabled
    public static List<Contact> getAllContacts() {
        List<Contact> allContacts =[SELECT Id, Name, Email FROM Contact];
        return allContacts;
    }
}