@Istest
public class AnimalLocatorTest {
    @IsTest static void testcallout(){
            Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());                                   
            System.assertEquals('Tiger',AnimalLocator.getAnimalNameById(0));            
    }

}