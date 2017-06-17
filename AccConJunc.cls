public class AccConJunc {
    public List<AccConJunc__c> accList;
    public List<Contact> cList;
    public List<AccConWrapper> displayList{get;set;}
    public Set<Contact> inlineID{get;set;}
   
    public AccConJunc() {
        accList = new List<AccConJunc__c>();
        displayList = new List<AccConWrapper>();
        accList=[select Account__c,SiteContact__r.Email, SiteContact__r.Fax,SiteContact__r.LastName from AccConJunc__c];
        system.debug('%%' +accList);
        for(AccConJunc__c acc:accList){
        AccConWrapper aWrap = new AccConWrapper();
        aWrap.junc = acc;
        displayList.add(aWrap);
        }
        
    }


    public void save() {
        inlineID = new Set<Contact>();
        Set<Id> idValue = new Set<Id>();
        List<Id> cListId = new List<Id>();
        cList = new List<Contact>();
        //List<Id> updateId = new list<Id>();
        for(AccConWrapper jList:displayList){
            
            inlineID.add(jList.junc.SiteContact__r);
          //  idValue.add(jList.junc.SiteContact__c);
        }
        cList.addAll(inlineID);
        update cList;
               
    }
    public class AccConWrapper{
    public AccConJunc__c junc{get;set;}
   
    }
}