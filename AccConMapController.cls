public class AccConMapController 
{
Map<Id, List<Contact>> acMap = new Map<Id,List<Contact>>();
Set<Id> AccountId = new Set<Id>();
public Map<Id,List<Contact>> getAccConMap() {
    

for(Contact con : [SELECT Id, Account.Id FROM Contact WHERE Account.Id!=null]) {
    
        if(!acMap.containsKey(con.Account.Id)) 
        {
         acMap.put(con.Account.Id, new List<Contact>());
         }
        acMap.get(con.Account.Id).add(con);
       }
        return acMap;
}
}