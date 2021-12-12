public class LeadProcessor implements Database.Batchable<sObject> {
     public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID from Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> lead_data){
        List<Lead> updated_lead=new List<Lead>();        
        for (Lead ld : lead_data){
            ld.LeadSource='Dreamforce';
            updated_lead.add(ld);
        }
        update updated_lead;
    }
    public void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }
        

}