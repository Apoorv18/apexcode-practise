@IsTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();        
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(name='Kakashi'+i,billingstate='NY'));
            accounts.add(new Account(name='Naruto'+i,billingstate='CA'));
        }
        insert accounts; 
    }
    static testmethod void testQueueable() {       
        AddPrimaryContact apc=new AddPrimaryContact(new Contact(Lastname='Jiraya Sensei'),'CA');
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        System.assertEquals(50, [Select count() from contact where lastname ='Jiraya Sensei' and
                                 AccountId in (select id from Account where billingstate='CA')]);
    }

}