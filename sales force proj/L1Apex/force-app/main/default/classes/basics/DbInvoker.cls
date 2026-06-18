public with sharing class DbInvoker {
    public DbInvoker() {
        System.debug('in db invoker class');
    }
    
    public void getAccounts(){
        List<Account> accList = [select id, Name,phone from Account];
        Map<ID,Account> accMap = new Map<ID,Account>(accList);
        System.debug('Binded to map >>' );
        
        for (Account ac : accMap.values()) {
            System.debug('acc id ' +ac.Id+ 'Name --'+ac.Name+'---phone  is '+ac.Phone);
        }
    }
}