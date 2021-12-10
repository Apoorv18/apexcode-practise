public class AddPrimaryContact implements Queueable {
    private Contact ct;
    private string state_st;
    public AddPrimaryContact(Contact record,string state_short){
        this.ct=record;
        this.state_st=state_short;
    }
    public void execute(QueueableContext context) {
        List<Account>act=[Select id from Account where billingstate=:state_st limit 200];
        List <Contact> updated_ct =new List<Contact>();               
        for(Account a:act){           
            Contact c=ct.clone(false,false,false,false);
            c.AccountId=a.id;
            updated_ct.add(c);
        }
        insert updated_ct;
    }

}