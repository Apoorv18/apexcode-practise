@IsTest
public class LeadProcessorTest {
    @testSetup
    static void setup(){
        List<Lead>ld=new List<Lead>();
        for (Integer i=0;i<200;i++){
            ld.add(new Lead(lastname='Loki_'+i,company='Kakshi Enterprises Ltd.'));
        }
        insert ld;
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor lp=new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [select count() from lead where company = 'Kakshi Enterprises Ltd.']);
    }

}