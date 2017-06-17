public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String mPostalCode){
        List<Contact> rList =[SELECT Id, Name FROM Contact WHERE lastName =: lName AND MailingPostalCode =:mPostalCode];
        return rList;
    }
}