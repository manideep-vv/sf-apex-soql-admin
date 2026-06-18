trigger ContactTrigger on Contact(before insert,after insert,before update,after update) {
  ContactTriggerHandler handler=new ContactTriggerHandler();
  System.debug('Executing contact trigger >> new value --current event is ' + Trigger.operationType);

   switch on Trigger.operationType{
    when AFTER_INSERT{
      System.debug('exec TRIGGER doing after insert >>' );
      handler.createTaskForEachNewContact(Trigger.newMap);  
     
    }
    when AFTER_UPDATE{
      System.debug('exec Trigger after update a contact' );
       handler.updateActiveContactsCountInAccountTable(Trigger.new,Trigger.old);

    }
  }
  
  if(Trigger.isBefore){
    if (Trigger.isInsert) {
      System.debug( 'Exec trigger before insert new --' + Trigger.new + 'old --' + Trigger.old);
      ContactTriggerHandler.handleBeforeInsert(Trigger.new);
    }
  }else{
    
    if ( Trigger.isInsert) {
      System.debug('Exec trigger after insert new --' + Trigger.new + 'old --' + Trigger.old);
    }
    
    if (Trigger.isUpdate  ) {
      System.debug('Executing trigger afte update');
      //to compare always use maps 
      ContactTriggerHandler.handleAfterUpdate(Trigger.oldMap, Trigger.newMap);
    }
  }

 
}