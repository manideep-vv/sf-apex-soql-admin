public with sharing class QueueableApexDemo implements Queueable {
    
    List<Book__c> booksList;
    public QueueableApexDemo(List<Book__c> booksList) {
        this.booksList=booksList;
        System.debug('received books count is >>' +booksList.size());
    }
    
    
    public void execute(QueueableContext qc) {
        System.debug('starting the job with this id >>' +qc.getJobId());
        for(Book__C book:booksList){
            book.countryOfOrigin__c=String.isNotBlank(book.countryOfOrigin__c)?book.countryOfOrigin__c.toLowerCase():'';
        }
        Database.update(booksList,false);
        System.debug('queueable task ran successfully if u want create and submit another task to pool >>' + qc.getJobId());
    }
    //If u call this method , then task will be submitted automatically
    public void submitThisTaskToQueue(){
        System.enqueueJob(this);
        //         List<Book__c> bookIds=[select id,countryOfORigin__C from Book__c];
        // System.enqueueJob(new QueueableApexDemo(bookIds ));
    }
}