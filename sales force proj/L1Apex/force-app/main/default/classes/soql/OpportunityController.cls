public with sharing class OpportunityController {
    public OpportunityController() {
        
    }
    
    public static void updateProfile(List<Id> opps){
        
        List<Opportunity> oppsList= [select id,amount, profile__c from Opportunity where id in :opps];
        System.debug('got results are >>' + oppsList.size());
        for(Opportunity op:oppsList){
            if(op.Amount<=10000){
                op.profile__c='Low';
            }else if(op.Amount>10000&& op.Amount<=50000){
                op.profile__c='Medium';
            }else {
                op.profile__c='High';
            }
        }
        List<Database.SaveResult> results=  Database.update(oppsList,false);
        for(Database.SaveResult result:results){
            if(! result.isSuccess()){
                System.debug('error occured'+result.getErrors() );
            }
        }
        System.debug('updated records count is >> '+results.size()    );
    }
    
    public static void cpuLimitHitDemo(List<Id> opps){
        List<Opportunity> oppsList= [select id,amount, profile__c from Opportunity where id in :opps];
        System.debug('got results are >>' + oppsList.size());
        while (1==1&& Limits.getCpuTime()<Limits.getLimitCpuTime()) {
            // oppsList.addAll(oppsList);

        }
        // System.debug('program done heap size is' + Limits.getHeapSize());
        System.debug('program done cpu  time reached is' + Limits.getCpuTime());
    }
}