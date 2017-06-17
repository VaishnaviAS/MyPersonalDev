public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String lName){
        List<List< SObject>> rList = [FIND :lName IN NAME FIELDS RETURNING Contact(firstname, lastname), Lead(FirstName, LastName)];
        system.debug('rList3' +rList);
        return rList;
    }
}