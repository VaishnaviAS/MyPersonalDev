public class contactRecords {

    List<Contact> cList = new List<Contact>();
    //List<Account> aList = new List<Account>();
    List<Contact> conList = new List<Contact>();
    public Id conId{get; set;}
    
    public List<Contact> getContactList() {
        
        cList = [Select Id, FirstName from Contact];
        return cList;
    }
    
    public PageReference switch() {
        PageReference pageRef = new PageReference('/apex/tabPage1');
        return pageRef;
        
    }
    
    public List<Contact> getAccountsList() {
        System.debug('conId#' +conId);
        conId = apexpages.currentpage().getparameters().get('conId');
        
        conList = [Select Id, Account.Id, Account.Name from Contact where Id=:conId];
        System.debug('ListValue#' +conList);
        return conList;
    }

}