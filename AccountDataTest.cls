@isTest
public class AccountDataTest {
     static testMethod void createData(){
        
        
        Account acc = new Account();
        acc.Name ='Testing';
        acc.BillingCity ='Bangalore';
        
        insert acc;
        
         //AccountData ad = new AccountData();
         AccountData.insertRecord(acc);
         List<String> accTypes = AccountData.getAccountType();
         system.assert(accTypes.size()>0);
         
         List<String> slaTypes = AccountData.getSLAType();
         system.assert(slaTypes.size()>0);
    }
}