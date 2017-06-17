public class AccountData {
    
   /* @AuraEnabled
    public static Account insertRecord(String AccName, String billStreet, String billCity, String billState, String billCountry, String accType, String recordId,
                                       String AccNo, String accSite, String slaType, String slaSNo, String slaDate){
        Account newRec = new Account();
        try{
            
            if(AccName!=null){
            if(recordId!=null)newRec.Id = recordId;
            newRec.Name = AccName;
            newRec.BillingStreet = billStreet;
            newRec.BillingCity = billCity;
            newRec.BillingState = billState;
            newRec.BillingCountry = billCountry;
            newRec.Type = accType;
            newRec.AccountNumber = AccNo;
            newRec.Site = accSite;
            newRec.SLA__c = 'Gold';
            newRec.SLASerialNumber__c = slaSNo;
            newRec.SLAExpirationDate__c = Date.valueOf(slaDate);
              
            upsert newRec;
            system.debug('newRec' +newRec);
            }
            
        }
        catch(Exception e){
            System.debug('Exception in method - insertRecord ' +e.getMessage());
        }
        return newRec;
    }*/
    @AuraEnabled
    public static Account insertRecord(Account acc, String slaType){
        Account newRec = new Account();
        if(acc!=null){
            newRec = acc;
            newRec.SLA__c = slaType;
            upsert newRec;
        }
        system.debug('newREc@' +newRec);
        return newRec;
    }
    
    @AuraEnabled
    public static List<String> getAccountType(){
        List<String> options = new List<String>();
        try{
        Schema.DescribeFieldResult fieldResult = Account.Type.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug('opt' +options);
        }
        catch(Exception e){
            system.debug('Exception in method - getAccountType' +e.getMessage());
        }
        return options;
    }
    
    @AuraEnabled
    public static List<String> getSLAType(){
        List<String> options = new List<String>();
        try{
        Schema.DescribeFieldResult fieldResult = Account.SLA__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }
        system.debug('opt' +options);
        }
        catch(Exception e){
            system.debug('Exception in method - getSLAType' +e.getMessage());
        }
        return options;
    }
    
}