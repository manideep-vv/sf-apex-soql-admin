public with sharing class FetchOperations {
    public FetchOperations() {
        System.debug('in dynamic query cons' );
    }

    public void fetchAndBindDataToMap(){
        String regex='%a%';
        List<Contact> lis= [select id,email, mobilephone, name, mailingcity from contact where name like  :regex];
        Map<Id,Contact> m1=new Map<Id,Contact>(lis);
        System.debug('db records count is with map ' + m1.size());
    }

    
    public void queryWithoutNamedParams(){
        String temp='cold';
        String qry;
        if(temp=='hot'){
            qry='select id, name,type,rating  from account  where rating =\'hot\' ';
        }
        else if (temp=='cold'){
            qry='select id, name,type,rating  from account  where rating =\'cold\' ';
        }
        Database.query(qry);
        List<Account> accList=Database.query(qry);
        System.debug('total records got areea  >>' +accList.size());
    }


    
   public void passDetailsInMap(){
        Map<String,String> hm=new Map<String,String>();
        hm.put('companyName', 'Edge Communications');
        hm.put('compType', 'Customer - Direct');
        String s='select id, name,type,rating  from account where name=:companyName  and type =:compType ';
        List<Account> recs=Database.queryWithBinds(s, hm, AccessLevel.SYSTEM_MODE);
        System.debug('results are-- ' +recs.size() +recs);
    }

    public void printContacts(){
        System.debug('fetching with like' );
        Map<String,String> m=new Map<String,String>();
        m.put('condition', '%o%');
        String qry='select id, name, email from contact where name like :condition  ';
        List<Contact> recs=Database.queryWithBinds(qry, m, AccessLevel.SYSTEM_MODE);
        
        System.debug('got count is ' +recs.size());
    }
    public void FiveLevelDeepQuery(){
        System.debug('in multi sub level query >>'  );
        String s='select id, name, (select name, (select subject, id  from  cases ) from contacts ) from account  ';
         List<Account> recs= Database.query(s);
         System.debug('got recs are  >>' + recs.size());
         System.debug('all recs  are  >>' + recs);
    }

}