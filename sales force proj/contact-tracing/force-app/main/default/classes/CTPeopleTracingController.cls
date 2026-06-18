public with sharing class CTPeopleTracingController {
    public CTPeopleTracingController() {

    }

    /**
     * Query People Tracing records matching “personId” value
     * get each person id, health status, token and contact date
        Sort by “Contact Date” in descending order
        SELECT Id, Person_1__c,Person_1__r.health_status__c, Person_2__c,Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c='a09dL00000L6K9dQAF' or person_2__c='a09dL00000L6K9dQAF' order by contact_date__c desc
     */
    public List<People_Tracing__c> getTraces(String personId){
        List<People_Tracing__c> l= [SELECT Id, Person_1__c,Person_1__r.health_status__c, Person_2__c,Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c=:personId or person_2__c=:personId order by contact_date__c desc];
        Logger.info('got {0} records for this person id {1} ', l.size().toString(),personId);
        return l;

    }

    public void test (){
        CTPeopleTracingController ct=new CTPeopleTracingController();
        ct.getTraces('a09dL00000L6K9dQAF');
 
        // People_Tracing__c t=new People_Tracing__c(Person_1__c='a09dL00000L6K9dQAF',Person_2__c='a09dL00000L6HQjQAN');
        // People_Tracing__c t1=new People_Tracing__c(Person_1__c='a09dL00000L6K9dQAF',Person_2__c='a09dL00000L6HHFQA3');
        People_Tracing__c t=new People_Tracing__c(Person_1__c='a09dL00000L6HQjQAN',Person_2__c='a09dL00000L6K9dQAF');
        People_Tracing__c t1=new People_Tracing__c(Person_1__c='a09dL00000L6JOrQAN',Person_2__c='a09dL00000L6K9dQAF');
        List<People_Tracing__c> newTraces =new List<People_Tracing__c>{t,t1};
        ct.getDuplicates(newTraces);
        

    }
    /**
     * Query existing records from People Tracing object
       Find duplicate records by matching peopleTraces list and existing records
       whats is a duplicate- person1 meeting person 2, person 2 meeting person 1 both are same, here new entry will be compared with existing entry - if repeats then its a duplicate
      SELECT Id, Person_1__c,Person_1__r.health_status__c, Person_2__c,Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c in('a09dL00000L6K9dQAF') or person_2__c in ('a09dL00000L6K9dQAF')

      SELECT Id, Person_1__c, Person_1__r.Name, Person_2__r.Name, Person_1__r.health_status__c, Person_2__c, Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c in('a09dL00000L6K9dQAF', 'a09dL00000L6HQjQAN', 'a09dL00000L6K9dQAF') or person_2__c in ('a09dL00000L6K9dQAF', 'a09dL00000L6HQjQAN', 'a09dL00000L6K9dQAF') 

      SELECT Id, Person_1__r.Name, Person_2__r.Name, Person_1__c,Person_1__r.health_status__c, Person_2__c,Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c in('a09dL00000L6K9dQAF','a09dL00000L6HQjQAN','a09dL00000L6K9dQAF') 
or person_2__c in ('a09dL00000L6K9dQAF','a09dL00000L6HQjQAN','a09dL00000L6K9dQAF')


     */

    public List<People_Tracing__c> getDuplicates(List<People_Tracing__c> newTraces){
        Set<Id> personIds=new Set<Id>();
        for (People_Tracing__c newTrace : newTraces) {
            personIds.add(newTrace.Person_1__c);
            personIds.add(newTrace.Person_2__c);
        }
        Logger.info('totally we got {0} persons they are {1}',personIds.size(),personIds.toString());
        List<People_Tracing__c> dbRecs=[SELECT Id, Person_1__r.Name, Person_2__r.Name, Person_1__c,Person_1__r.health_status__c, Person_2__c,Person_1__r.token__c, Contact_Date__c FROM People_Tracing__c where person_1__c in :personIds or person_2__c in:personIds];
        Logger.info('got {0} persons from db ',dbRecs.size());

        //convert the list into map 
        Map<Id,Set<Id>> dbRecAsMap=new  Map<Id,Set<Id>>();
        for (People_Tracing__c dbRec : dbRecs) {
            if(!dbRecAsMap.containsKey(dbRec.Person_1__c)){
                dbRecAsMap.put(dbRec.Person_1__c,new Set<Id>{dbRec.Person_2__c});
            }else{
                dbRecAsMap.get(dbRec.Person_1__c).add(dbRec.Person_2__c);
            }
        }
        //check the incoming records with db records
           List<People_Tracing__c> duplicateRecords=new List<People_Tracing__c>();

           for (People_Tracing__c newTrace : newTraces) {
            Id person1Ref=newTrace.Person_1__c;
            Id person2Ref=newTrace.Person_2__c;
        //compare person 1 and person 2 combo with map 
            if(dbRecAsMap.containsKey(person1Ref)&& dbRecAsMap.get(person1Ref).contains(person2Ref)){
                duplicateRecords.add(newTrace);
                Logger.info('this {0} - {1} combo is already present ' ,person1Ref, person2Ref);
            }else if(dbRecAsMap.containsKey(person2Ref)&& dbRecAsMap.get(person2Ref).contains(person1Ref)){
                duplicateRecords.add(newTrace);
                 Logger.info('this {0} - {1} comboo is already present ', person2Ref ,person1Ref);
            }

        //compare person 2 and person 1 combo with map 
           
          }
Logger.info('total duplicates count is {0} ', duplicateRecords.size());

     
        return duplicateRecords;
    }
}