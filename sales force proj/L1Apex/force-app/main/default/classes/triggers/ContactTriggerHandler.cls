public with sharing class ContactTriggerHandler {
  public ContactTriggerHandler() {
  }
  
  
  public void updateActiveContactsCountInAccountTable( List<Contact> newContacts,List<Contact> oldContacts){
    Set<Id> accIds=new Set<Id>();
    for(Contact c:newContacts){
      accIds.add(c.AccountId);
    }
    for(Contact c:oldContacts){
      accIds.add(c.AccountId);
    }
    System.debug('got acc ids aree ' +accIds);
    List<AggregateResult> l=[SELECT accountId, count(id) activeCount FROM Contact where isActive__c=true and accountid in :accIds group by accountId ];
    List<Account> accountsWithActiveContactsCount=new List<Account>();
    for (AggregateResult ar:l){
      System.debug('account id is ' + ar.get('accountId') + 'count is ' + ar.get('activeCount') );
      Account acc=new Account(Id=(Id)ar.get('accountId'), activeContactsCount__c=(Integer)ar.get('activeCount') );
      accountsWithActiveContactsCount.add(acc);
    }
    
    System.debug('total list from db is  >>' + accountsWithActiveContactsCount);
    for(Id accid:accIds){
      Map<Id,Account> accMap=new Map<Id,Account>(accountsWithActiveContactsCount);
      
      if(!accMap.containsKey(accid)){
        Account acc=new Account(Id=accid, activeContactsCount__c=0);
        System.debug('list doesnt contain this so adding this ele' +accid);
        accountsWithActiveContactsCount.add(acc);
      }
      
    }
    
    update accountsWithActiveContactsCount;
    System.debug('updated records in account table are ' + accountsWithActiveContactsCount.size());
    
  }
  private void updateActiveCountForTheseIds(Set<Id> accIds){
    
  }
  
  
  
  public static void handleAfterUpdate(Map<Id,Contact> oldContacts,Map<Id,Contact> newContacts){
    System.debug('in handler method to compare the data ');
    Set<Id>keys=oldContacts.keySet();
    for (Id i : keys) {
      String oldMobilenum = (oldContacts.get(i).MobilePhone ) ?? '';
      String newMobNum = (newContacts.get(i).MobilePhone)?? '';
      if (!oldMobilenum.equals(newMobNum)) {
        System.debug('Warn mobile num changed for Id --' + i + ' new mob num is ' + newMobNum + ', old mob num is ' + oldMobilenum);
      }
      
    }
    
  }
  // Handle logic for Contact before insert trigger
  public static void handleBeforeInsert(List<Contact> newContacts) {
    if (!newContacts.isEmpty()) {
      for (Contact c : newContacts) {
        if (String.isBlank(c.MailingCity)) {
          System.debug('mailing city is blank');
          c.MailingCity = 'FutureCity';
        }
      }
    }
  }
  
  public void createTaskForEachNewContact(Map<Id,Contact> nMap){
    System.debug('in after trigger-- create task method got contacts size'+nMap.size());
    List<Task> tasksList=new List<Task>();
    for(Contact c:nMap.values()){
      System.debug('contact id ref is >>' +c.id);
      Task t=new Task(Description=c.name+' Pls link pan and aadhar',whoId=c.Id,subject='call');
      tasksList.add(t);
      
      
    }
    
    
    insert tasksList;
    System.debug('inserted all tasks at once' +tasksList.size());
    
    
    
  }
  
  
}