@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
    List<lead> dummy_list=new List<lead>();
	for (Integer i=0; i<200; i++) {
        Lead l=new Lead(lastname='Naruto Uzumaki_'+i,company='UzumakiInc'+i);
        dummy_list.add(l);
    	}
       insert dummy_list;        
    Test.startTest();
    string jobid=System.schedule('LeadSourceUpdater', CRON_EXP,new DailyLeadProcessor());
    Test.stopTest();
    System.assertEquals(200,[Select count() from lead where LeadSource='Dreamforce']);
    }

}