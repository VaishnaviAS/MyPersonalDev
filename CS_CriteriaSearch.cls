public class CS_CriteriaSearch {

    @AuraEnabled
    public static List<String> getTagType(){
        List<String> options = new List<String>();
        try{
        Schema.DescribeFieldResult fieldResult = Assets__c.Main_Tag__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug('opt' +options);
        }
        catch(Exception e){
            system.debug('Exception in method - getTagType' +e.getMessage());
        }
        return options;
    }
    @AuraEnabled
    public static List<String> getTechType(){
        List<String> options = new List<String>();
        try{
        Schema.DescribeFieldResult fieldResult = Assets__c.Main_Technology__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug('opt' +options);
        }
        catch(Exception e){
            system.debug('Exception in method - getTechType' +e.getMessage());
        }
        return options;
    }
    @AuraEnabled
    public static List<String> getSector(){
        List<String> options = new List<String>();
        try{
        Schema.DescribeFieldResult fieldResult = Assets__c.Sector__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug('opt' +options);
        }
        catch(Exception e){
            system.debug('Exception in method - getSector' +e.getMessage());
        }
        return options;
    }
    @AuraEnabled
    public static List<Assets__c> searchRecords(Assets__c selectedVal){
        system.debug('SV#' +selectedVal);
   
        String sector = selectedVal.Sector__c;
        String tech = selectedVal.Main_Technology__c;
        String tag = selectedVal.Main_Tag__c;
        String aName = selectedVal.Name;
        system.debug('Name@' +aName);
        List<Assets__c> matchingValues = new List<Assets__c>();
        try{
            
        
        String myQuery ='SELECT Id, Name, Description__c,Sector__c,Main_Technology__c,Main_Tag__c,ComponentName__c FROM Assets__c WHERE Name!=null';
        if(!sector.equals('')){
            myQuery += ' and Sector__c=: sector ';
            
        }
        if(!tech.equals('')){
            myQuery += ' and Main_Technology__c=: tech';
            
        }
        if(!tag.equals('')){
            myQuery += ' and Main_Tag__c=: tag';
            
        }
        if (!aName.equals('')){
            myQuery += ' and Name LIKE \'%'+String.escapeSingleQuotes(aName)+'%\'';  
        }
      	
        system.debug('myQ' +myQuery);
        matchingValues = Database.query(myQuery);
                                        
        System.debug('MV# '+matchingValues);
        
        }
        catch(Exception  e){
            system.debug('Exception in searchRecords' +e.getMessage());
        }
        return matchingValues;
    }
    
}