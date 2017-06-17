public with sharing class accountValues {
public List<AccConJunc__c> accList{get;set;}
public List<accountWrapper> awList{get;set;}
public accountWrapper aWrap{get;set;}
public accountValues(){

    try
    {
        accList = new List<AccConJunc__c>();
        awList = new List<accountWrapper>();
        String query = '';
        query += 'SELECT Id, Name,Account__c FROM AccConJunc__c';
        accList=Database.query(query); 
        system.debug('##' +accList.size());
        for(AccConJunc__c aw:accList){
        
            accountWrapper aWrap= new accountWrapper();
            aWrap.selected = false;
            aWrap.associated = True;
            aWrap.aj = aw;
            awList.add(aWrap);
            system.debug('Wrap created');
        }
        
        
    }
    catch(Exception e)
    {
        system.debug('Exception ' +e);
    }
}
    public void associate(){
        
    }
    public void disassociate(){
        
    }


public class accountWrapper{
public AccConJunc__c aj{get;set;}
public boolean selected{get;set;}
public boolean associated{get;set;}
}
}