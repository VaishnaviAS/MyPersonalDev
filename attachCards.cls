public class attachCards{

public static List<Cards__c> cList;


    public static void insertCards(List<Cards__c> cardsList){
    
        List<Wallet__c> walletList = [SELECT Name FROM Wallet__c WHERE OwnerId=: UserInfo.getUserId() ];
        System.debug('###W' +walletList);
        
        List<Cards__c> cards = [SELECT Card_Number__c,Name, Wallet__c FROM Cards__c WHERE Id in:cardsList limit 1];
        System.debug('@@@C' +cards); 
        
        
             for(Cards__c cardsObj : cards){    
                     for(Wallet__c wallet : walletList){
                         if(wallet!=null){
                         
                         Cards__c cObj = new Cards__c();
                         cObj.Id = cardsObj.Id;
                         cObj.wallet__c = wallet.Id;  
                         update cObj;  
                         System.debug('%%%' +cObj);
                         
                        // cList.add(cObj);
                 }
             }
             }
             
       //  update cList;
       //  System.debug('$$$cl' +cList);    
        
 
    }

}