public with sharing class CTLocationTracingController {
    public CTLocationTracingController() {

    }


    /**
     * SELECT Id, Name, Person__c,Person__r.Name, Location__c,Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c order by Visit_Date__c  desc 
     */
public Location_Tracing__c getVisitors(String locationId){
        List<Location_Tracing__c> l=[SELECT Id, Name, Person__c,Person__r.Name, Location__c,Location__r.name, Visit_Date__c,person__r.health_Status__c  FROM Location_Tracing__c  where location__C=:locationId order by Visit_Date__c  desc ];
            System.debug('for this location we got   >>' +l.size()+ 'records' );
            return l[0];
}


     /**
      * SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c where person__c in ('a09dL00000L6K9dQAF','a09dL00000L6HHFQA3') and Visit_Date__c = LAST_N_DAYS:60 order by Visit_Date__c  desc  
      * SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c where Visit_Date__c = LAST_N_DAYS:40 order by Visit_Date__c  desc  
      */
public List<Location_Tracing__c> getLocationsByPersonIds(Set<String> personIds){
    List<Location_Tracing__c> l=[ SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c where person__c in :personIds and Visit_Date__c = LAST_N_DAYS:60 order by Visit_Date__c  desc  ];
    Logger.info('got {0} records for these person ids {1} ', l.size().toString(),personIds.toString());
    return l;
}  

/**
 * SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c where location__c in ('a07dL000011FNxmQAG') and Visit_Date__c = LAST_N_DAYS:10 and person__r.health_Status__c='Green' order by Visit_Date__c  desc  
 */
    public List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
            List<Location_Tracing__c> l=[SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c 
            where location__c in :locationIds  and Visit_Date__c = LAST_N_DAYS:10 and person__r.health_Status__c='Green'  ];
            Logger.info('got {0} records from this location who are green  ', l.size());
            return l;
    }

    /**
     * this method will return the list of duplicate 
     * here duplicate means  location+ person combo should not repeat, if same location and person combo is repeated then it is duplicate
     * poor performance logic  - where personid='abcd' & locationid='xyz'
     * assume if we got 10 records (location and person id combo) then we will query for 10 times like 1 query for each record if it is duplicate or not
     * new logic
     * 1) convert existing or received records into map of locationid and personid
     * 2) query for new records with received location ids  and convert that list into map of locationid and List<personid>
     * 3) now we have 2 maps and compare received map with db map and find out the duplicates in db map check if same entry is repeated or not , if repeated then its duplicate
     *
     */

     public List<Location_Tracing__c> getDuplicateRecords(List<Location_Tracing__c> receivedRecords){
        Set<Id> locationIds=new Set<Id>();
        Set<Id> personIds=new Set<Id>();
        for(Location_Tracing__c newTracingEntry:receivedRecords){
            locationIds.add(newTracingEntry.Location__c);
            personIds.add(newTracingEntry.Person__c);
        }

        //Now fetch all the entries related to that location
        List<Location_Tracing__c> dbRecords=[SELECT Person__c,Location__c,Person__r.Name, Location__r.name, Visit_Date__c,person__r.health_Status__c FROM Location_Tracing__c  where location__c in :locationIds ];
          Logger.info('got  {0} records for these locations {1} ', dbRecords.size(),locationIds.toString());

        //convert above list to map - key is location id and value is set of person ids
        Map<Id,Set<Id>> dbRecordsAsMap=new Map<Id,Set<Id>>();
        for(Location_Tracing__c entry:dbRecords){
            if(!dbRecordsAsMap.containsKey(entry.Location__c)){
                dbRecordsAsMap.put(entry.Location__c, new Set<Id>());
            }
            dbRecordsAsMap.get(entry.Location__c).add(entry.Person__c);
            // Logger.info('kept this  location {0} and person {1} ', entry.Location__c,entry.Person__c);
        }
        Logger.info('created map ass {0} ', dbRecordsAsMap);

        List<Location_Tracing__c> duplicateRecords=new List<Location_Tracing__c>();
        for(Location_Tracing__c entry:receivedRecords){
            if(dbRecordsAsMap.containsKey(entry.Location__c) && dbRecordsAsMap.get(entry.Location__c).contains(entry.Person__c)){
                duplicateRecords.add(entry);
            }
        }
        Logger.info('total duplicate records are {0}', duplicateRecords.size());
            return duplicateRecords;
     }

    public void test(){
        CTLocationTracingController c = new CTLocationTracingController();
        // c.getVisitors('a07dL000011FNxmQAG');
        Set<String> PersonIds=new Set<String>{'a09dL00000L6K9dQAF','a09dL00000L6HHFQA3'};
        // c.getLocationsByPersonIds(PersonIds);
        Set<Id> locationIds=new Set<Id>{'a07dL000011FNxmQAG'};
        // c.getLocationsByLocationIds(locationIds);
        List<Location_Tracing__c> newRecords=new List<Location_Tracing__c>();
        Location_Tracing__c entry1=new Location_Tracing__c(Person__c='a09dL00000L6JOrQAN',Location__c='a07dL000011F9QdQAK');
        Location_Tracing__c entry2=new Location_Tracing__c(Person__c='a09dL00000L6JOrQAN',Location__c='a07dL000011FNxmQAG');
        Location_Tracing__c entry3=new Location_Tracing__c(Person__c='a09dL00000L6K9dQAF',Location__c='a07dL000011F9QdQAK');
        newRecords.add(entry1);
        newRecords.add(entry2);
        newRecords.add(entry3);
      List<Location_Tracing__c> duplicates=  c.getDuplicateRecords(newRecords);
    }
}