public with sharing class CTLocationController {
    public CTLocationController() {

    }
    public List<Location__c> getRecentStatusChanges(){
        List<Location__c> l=[SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c order by Status_Update_Date__c  desc limit 100];
        System.debug('got location records count --'+l.size());
        return l;
    }
    /**
     * SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c where name like '%SEZ%' or Address__c like '%SEZ%'
     */
        public List<Location__c> searchLocations(String searchStr){
            searchStr= '%'+    searchStr +'%';
            List<Location__c> l= [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c where name like :searchStr or Address__c like :searchStr];
            System.debug('global search gave us  >>' + l.size() +'records');
            return l;
        }

        /**
         * SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c where id='a07dL000011F9QdQAK'
         * */
        public Location__c getLocationById(String locationVal){
                Location__c l= [SELECT Id, Name, Address__c, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c FROM Location__c where id=:locationVal];
                System.debug('fethced by id got location name as >>' +l.name);
                return l;
        }
     
        public void test(){
            CTLocationController c = new CTLocationController();
            c.getLocationById('a07dL000011FJT6QAO');
            c.searchLocations('MEPZ');
            c.getRecentStatusChanges();
            
        
    }
}