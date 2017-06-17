@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
	
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        
        System.debug('ACCID' +accId);
        Account acc = [Select Id, Name, (Select Name FROM Contacts) FROM Account WHERE Id=: accId];
        return acc;
    }

}