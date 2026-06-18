public with sharing class NightlyJob_SchedulableDemo implements Schedulable {
    public NightlyJob_SchedulableDemo() {
        
    }
    public void execute(SchedulableContext sc){
        System.debug('cron nightly job has been started with id  >>' +sc.getTriggerId());
        List<Book__c> bookIds=[select id,countryOfORigin__C from Book__c];
        Database.executeBatch(new BatchableDemo(),200);
        
    }

//     NightlyJob_SchedulableDemo ns=new NightlyJob_SchedulableDemo();
// ns.scheduleThisJob();
    public void scheduleThisJob(){
        String cronExp = '0 53 5 * * ?';
        String jobId=System.schedule('NightlyJob_SchedulableDemo',cronExp,this) ;
    }
}