public with sharing class FutureDemo {
    public FutureDemo() {
        
    }
    
    @Future
    public static void insertBooksAsync(){
        List<Author__c> authorsList=[select id,name from author__C where name like '%a%'];
        System.debug('got author is  >>' +authorsList.size() );
        List<Book__c> booksList=new List<Book__C>();
        for (Integer i=0;i<2000;i++){
            Integer authorId=Math.random()<0.5?0:1;
            Book__c b=new Book__c(Name='Java Book'+i,author__c=authorsList[authorId].Id);
            booksList.add(b);
        }
        insert booksList;
        System.debug('size of list is  >>' +booksList.size()  );
    }
    
    
    
}