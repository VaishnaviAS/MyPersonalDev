@IsTest
public class AccountManagerTest {
	@isTest static void testGetCaseById() {
        Id recordId = createTestRecord();
    	RestRequest request = new RestRequest();
		request.requestUri = 'https://vaishnavi-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+recordId+ '/contacts';
        request.httpMethod = 'GET';
		RestContext.request = request;
		Account acc = AccountManager.getAccount();

    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
           Name='TestingREST');
        insert accTest;
        system.debug('NewId' +accTest.Id);
        return accTest.Id;
    } 
}