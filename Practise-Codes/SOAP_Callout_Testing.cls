@IsTest
public class ParkLocatorTest {
    @isTest static void testCallout() { 
        	Test.setMock(WebServiceMock.class,new ParkServiceMock());
        	string [] expected_output =new string[]{'Ma','Ba','Gi'};
            System.debug(ParkLocator.country('I'));
            System.assertEquals(expected_output, ParkLocator.country('I'));           
    }

}