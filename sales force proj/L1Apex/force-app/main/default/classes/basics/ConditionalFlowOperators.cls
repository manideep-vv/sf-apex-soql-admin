public with sharing class ListDemo {
    public ListDemo() {
        
    }
    
    public static void if_elseDemo1(){
        Integer y=2200;
        if( Math.mod(y,4) ==0 && ( Math.mod(y,100)!=0 || Math.mod(y,400)==0) ) {
            System.debug('yes its leap year >>' +y );
        }
        else{
            System.debug('not a prime num >>' + y);
        }
    }
    public  static void switchDemo() {
        Integer currentHour=1;
        switch on currentHour {
            
            when 0,1,2,3,4,5,6,7,8,9,10,11,12 {
                System.debug('Good morning >>' );
            }
            when 13,14,15,16,17,18 {
                System.debug('Good Afternoon >>' );
            }
            when else{
                System.debug('Good Evening >>' );
            }
        }
    }
    
    public static void switchWithString(){
        String day='Friday';
        switch on day {
            
            when 'Monday', 'Tuesday', 'wednesday'{
                System.debug('go to office on >>' +day);
            }
            when 'Friday' {
                System.debug(' Goto party on >>' + day );
            }
            when else{
                System.debug('Goto  Movies on >>' + day);
            }
            
        }
    }
    public  static void  ForLoopDemo_withCont(){
        List<String> l= new List<String> {'Monday','Tuesday','wednesday','Thursday','Friday','Saturday','Sunday'};
        for (Integer i = 0; i < l.size(); i++) {
            String s=l.get(i);
            if(s=='Wednesday'){
                continue;
            }
            System.debug(s );
        }
    }
    
    
    public  static void  whileDemo(){
        Integer x=0;
        Integer y=1;
        Integer z=x+y;
        List <Integer> ls=new List<Integer>{x,y};
        
        while (z<=100) {
            z=x+y;
            ls.add(z);
            x=y;
            y=z;
        }
    }
    
    // Runnable entry point to demonstrate List creation and adding elements
    public static void run() {
        
        //if else demo
        Boolean isDeveloper=true;
        Boolean isManager=true;
        Boolean isTester=true;
        
        if(isDeveloper ==true){
            System.debug('is he developer >>' + isDeveloper);
        }else if(isManager) {
            System.debug('isManager >>' + isManager);
        }else if (isTester) {
            System.debug('isTester >>' + isTester);
        }
    }
}