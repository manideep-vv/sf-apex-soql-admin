trigger MyLeadTrigger on Lead (before insert, after insert, before update, after update) {
    System.debug('current operation typ' + Trigger.operationType+'size received is '+Trigger.size+' is executing'+Trigger.isExecuting);
    switch on Trigger.operationType{
        
        when BEFORE_INSERT{
            System.debug('doing before insert >>' );
        }
        
        when  AFTER_UPDATE{
            System.debug('exec TRIGGER doing after update >>' );
            Map<Id,Lead> nMap=Trigger.newMap;
            Map<Id,Lead> oMap=Trigger.oldMap;
            for( Id idKey:nMap.keySet()){
                String newStatus=nMap.get(idKey).status;
                String oldStatus = oMap.get(idKey).status;
                System.debug('new status --' +newStatus+'old status --' +oldStatus);
                if(oldStatus.equals('Open - Not Contacted') &&
                 ( newStatus.equals('Closed - Converted') ||  newStatus.equals('Closed - Not Converted') ) ){
                    nMap.get(idKey).addError('Broo..Status cannot be changed from Open - Not Contacted to Closed - Converted or Closed - Not Converted');
                }
            }
        }

       
    }
    
}