public class BatchableDemo implements Database.Batchable<SObject> {
    
    List<String> countries=new List<String>{'India','US','UK','Germany','France','Japan','China','Australia','Canada','Russia','Brazil','South Africa','Nigeria','Mexico','Argentina','Ukraine'};
    public BatchableDemo() {
        
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('Starting a batch with id  >>' + bc.getJobId());
        return Database.getQueryLocator('select id,name from Book__C');
    }
    public void execute(Database.BatchableContext bc, List<Book__C> booksList){
        if (booksList == null || booksList.isEmpty()) {
            return; // return early
        }
        System.debug('Batch is running with chunk of  >>' + booksList.size()+ 'records');
        for (Book__C b:booksList){
            Integer index=(Math.round(Math.random()*(countries.size()-1)));
            b.countryOfOrigin__c=countries[index];
        }
        List<Database.SaveResult> results = Database.update(booksList,false);
    }
    
    
    public void finish(Database.BatchableContext bc){
        System.debug(bc.getJobId()+'batch is finished');
    }
    
    public void triggerThisBatch(){
        Database.executeBatch(this,200);
    }
    
    
}