/****
* @author : Vaishnavi A S
*/
public class AccConController
{
    public Id aId{get;set;}
    public List<Contact> contacts;
    
    public List<Contact> getContacts() {
        System.debug('$$' +aId);
        contacts=[SELECT Id FROM Contact WHERE AccountId=:aId];
        return contacts;
    }

   public list<Account> accounts;
    
   public List<Account> getAccounts(){
   
    accounts = [SELECT Id, Name from Account];
    return accounts;
   }

}