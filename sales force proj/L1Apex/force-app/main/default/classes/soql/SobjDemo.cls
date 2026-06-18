public with sharing class SobjDemo {
    public SobjDemo() {
        
    }
    public void castDemo(){
        Map<String,String> m=new Map<String,String>{'cName'=>'Voleti Venkatas VVs'};
        String qry= 'select Name,mobilephone, isDeleted from contact  where lastname=:cName' ;
        List<SObject> ls=Database.queryWithBinds(qry, m, AccessLevel.SYSTEM_MODE);
        System.debug('got recs are they are  >>' + ls.size());
        for (SObject ob : ls) {
            System.debug('name --' +ob.get('Name')+'phone --'+ob.get('mobilephone'));
        }
    }
    public void getParentAndChildsDemo(){
        String qry='SELECT id, Name, mobilephone, Account.name ,(select caseNumber from cases ) FROM contact where id in (select contactId from case where contactId !=null)  ';
        List<SObject> recs=Database.query(qry);
        System.debug('parent-child recs are   >>' + recs.size());
        for (SObject ob :recs) {
            //to get parent obj use field name and use method-- object// here field name is account
            System.debug('parent details --' + ob.getSObject('Account').get('name'));
            //to get child obj use child rel name and use method-- objects
            List<Case> casesList= ob.getSObjects('cases');
            System.debug('--name --' +ob.get('Name')+'phone --'+ob.get('mobilephone')+'cases are '+casesList.size());
            for (Case c : casesList) {
                System.debug('caseNum >>' + c.CaseNumber);
            }
        }
    }
    public void createSObjDemo(){
        SObject s= (SObject)Type.forName('Account').newInstance();
        s.put('Name', 'Tata consultancy services');
        s.put('billingcity', 'Hyderabad');
        s.put('phone', '9849918801'); 
        insert s;
    }
}