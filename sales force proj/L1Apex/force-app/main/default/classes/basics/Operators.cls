public with sharing class ListDemo {
    public ListDemo() {
        
    }
    
    // Runnable entry point to demonstrate List creation and adding elements
    public static void run() {
        Integer ross=3;
        Integer chandler=1;
        Integer joey=4;
        
        
        
        Integer rossRate=  (ross==1)?8:(ross<=3 ? 7:6) ;
        Integer chandlerRate= (chandler==1)?8:(chandler<=3?7:6);
        Integer joeyRate=(joey==1)?8:(joey<=3?7:6) ;
        
        Integer finalBill=0;
        finalBill +=ross*rossRate;
        finalBill+=chandler*chandlerRate;
        finalBill+=joey*joeyRate;
        
        
        
        System.debug('total bill is  >>' + finalBill);

        
        Datetime dt=Datetime.now() ;
        System.debug('dt >>' + dt);
        //safe navigation operator
        System.debug('date time when not null >>' +  dt?.date());
        //coalescape operator
        Datetime dt1=dt??Datetime.newInstance(2027,1,1,12,59,33);
        System.debug('new date >>' + dt1);
    }
}