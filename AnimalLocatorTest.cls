@isTest
public class AnimalLocatorTest {
	
   @isTest static void testPostCallout() {
    // Set mock callout class 
   System.Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
   
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String response = AnimalLocator.getAnimalNameById(12345);
    // Verify that the response received contains fake values
    
    //System.assertEquals('animal',response);
}
}