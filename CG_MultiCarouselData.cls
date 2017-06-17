public class CG_MultiCarouselData {
@AuraEnabled
    public static List<Assets__c> getAssets(){
        List<Assets__c> aList = new List<Assets__c>();
        try{
        aList = [Select id,Name,Sector__c, Main_Technology__c, Main_Tag__c, ComponentName__c, Description__c,(SELECT Id FROM ContentDocumentLinks) from Assets__c];
        system.debug('Asset List in CG_MultiCarouselData Class' +aList);
        }
        catch(Exception e){
            system.debug('Exception in getAssets method - Apex class Name: CG_MultiCarouselData' +e.getMessage());
        }
        return aList;
    }
}