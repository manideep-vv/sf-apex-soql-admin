public with sharing class CTPersonController {
    public CTPersonController() {

    }

    public List<Person__c> getRecentHealthChanges(){
        List<Person__c> l =[select id,name,mobile__c,health_status__C,status_update_date__c,token__c from person__c order by status_update_date__c desc limit 100 ];
        System.debug('got person records count --'+l.size());
        return l;
    }

    /**
     * select id,name,mobile__c,health_status__C,status_update_date__c,token__c from person__c where name like '%bata%' or token__C like '%bata%' order by status_update_date__c desc 
     */
    public List<Person__c> searchPeople(String searchStr){
        searchStr='%'+searchStr +'%';
        List<Person__c> l=[select id,name,mobile__c,health_status__C,status_update_date__c,token__c from person__c where name like :searchStr or token__C like :searchStr order by status_update_date__c desc ];
        System.debug('filtered  records count is --'+ l.size());
        return l;
    }
    public String  getToken(String mobileNum){
        Blob b= Blob.valueOf( mobileNum);
        Blob digest=Crypto.generateDigest('MD5',b);
        String result=EncodingUtil.base64Encode(digest);
        System.debug('encoded value is'+result);
        return result;
    }
    public Person__c getPersonById(String idVal){
       Person__c p =[select id,name,mobile__c,health_status__C,status_update_date__c,token__c from person__c where id=:idVal];
        System.debug('got person record and his name is  >>' +p.name);
        return p;

    }

    public void test(){
        CTPersonController c = new CTPersonController();
        Person__c p= c.getPersonById('a09dL00000L52gKQAR');
        List<Person__c> l = c.searchPeople('tata');
        List<Person__c> l2 = c.getRecentHealthChanges();
    }
}