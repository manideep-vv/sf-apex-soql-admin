public with sharing class ListDemo {
    public ListDemo() {
        
    }
    
    // Runnable entry point to demonstrate List creation and adding elements
    public static void run() {
       Map<Integer,String> hm=new Map<Integer,String>();
hm.put(1,'Mani');
hm.put(1,'sai');
System.debug('map >>' + hm);

Set<Integer> s=hm.keySet();
System.debug('keyset >>' + s);
 List<String> valuesInMap=hm.values();
 System.debug('map vlaues >>' + valuesInMap);
 Map<Integer,String>  clonedMap=new Map<Integer,String> (hm);
 clonedMap.put(2, 'santu');
 System.debug('cloned map >>' + clonedMap);
 System.debug('<Integer,String> >>' +hm);
System.debug('Contains key or not >>' + hm.containsKey(1));
hm.remove(1);
System.debug('Contains key after removal ? >>' + hm.containsKey(1));

    }
}