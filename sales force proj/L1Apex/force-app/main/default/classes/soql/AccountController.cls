public with sharing class AccountController {
    public AccountController() {
        
    }
    public static void updateAvgCaseResolutionDaysInAccount(Set<Id> accountIds){
        System.debug('input account ids are >>' + accountIds.size());
        Map<Id,Account> mapWithCount=new Map<Id,Account>();
        for (Case c:[select Id, CaseNumber, AccountId, ClosedDate, CreatedDate FROM Case where AccountId in :accountIds]){
            if(c.CreatedDate!=null && c.ClosedDate!=null){
                Date openedDate=c.CreatedDate.date();
                Date clsDate=c.ClosedDate.date();
                Integer daysBetween=Math.abs(openedDate.daysBetween(clsDate));
                System.debug('for Account' +c.AccountId+'gap is'+ daysBetween);
                if(! (mapWithCount.containsKey(c.AccountId)) ){
                    mapWithCount.put(c.AccountId, new Account(Id=c.AccountId,AvgCaseResolutionDays__c=daysBetween));
                }else{
                    Decimal existingAvg=mapWithCount.get(c.AccountId).AvgCaseResolutionDays__c;
                    Decimal newAvg=(existingAvg+daysBetween)/2;
                    mapWithCount.put(c.AccountId, new Account(Id=c.AccountId,AvgCaseResolutionDays__c=newAvg));
                }
            }
            
        }
        System.debug('final map>>' +mapWithCount);
        List<Database.SaveResult> results=   Database.update(mapWithCount.values(),false);
        System.debug('after saving we got >>' + results.size());
        
        for (Database.SaveResult  r : results) {
            if(!r.isSuccess()&& r.getErrors().size()>0){
                System.debug('got error ' +r.getErrors());
            }
        }
        
    }
    
}