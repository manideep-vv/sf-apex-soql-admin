public with sharing class updateOperation {
    public updateOperation() {
        
    }
    public void fetchAndUpdateDemo(){
        Map<String,String> m=new Map<String,String>{ 'cName' => 'Ramadevi Hyderabad'};
        String qry='select Name from contact where name = :cName ';
        List<Contact> recs=Database.queryWithBinds(qry, m, AccessLevel.SYSTEM_MODE);
        System.debug('receivedd size is' +recs.size()+'id is '+recs[0].id );
        Contact c=recs[0];
        c.LastName=' BLR'; //modifying a field
        // Database.update(recs); //updating
        update c;
    }
    public void fetchAndUpdateMobileNum(String existingName,String newMobileNum){
        Contact c=[select id,mobilephone from contact where name=:existingName ];
            c.MobilePhone=newMobileNum;
       
        Database.SaveResult ds=Database.update(c,false);
        if(ds.isSuccess()){
            System.debug('saved successfully with id' + ds.id);
        } else{
            for (Database.Error err : ds.getErrors()) {
                System.debug('Failed to update contact for id ' + ds.id+'status '+err.getStatusCode()+'msg'+err.getMessage());
            }          
        }
    }

    public void updateWithId(){
        Contact c=new Contact();
        c.Id='003dL00001ViH1BQAV';
        c.LastName='Bengaluru';
        update c;
        System.debug('updated the rec');
    }
    public void updateList(){
        String qry='select  Name,lastName from contact  where lastName=:ln ';
        Map<String,String> m=new Map<String,String>{'ln'=>'Voleti Venkatas'};
        List<Contact> lis= Database.queryWithBinds(qry,m,AccessLevel.SYSTEM_MODE);
        for (Contact c : lis) {
            c.LastName='Voleti Venkatas VVs';
        }
        System.debug('updated records count >>' + lis.size());
        update lis;
    }
}