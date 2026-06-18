public with sharing class DeleteOps {
    public DeleteOps() {

    }
    public void deleteContact(){
        Map<String,String> m=new Map<String,String>{'cName'=>'Voleti Venkatas VVs'};
        String qry= 'select id, Name,lastName, isDeleted from contact  where lastname=:cName' ;
        List<Contact> ls=Database.queryWithBinds(qry, m, AccessLevel.SYSTEM_MODE);
        System.debug('got recs are  >>' + ls.size());
        Database.delete(ls);
        //  delete ls;
    }
    public void unDeleteRecs(){
        String qry= 'select   Name,lastName from contact  where   isDeleted = true ALL ROWS ' ;
        Database.undelete(qry);
        System.debug('undeleted all recss >> ' );
    }
}