public with sharing class ListDemo {
    public ListDemo() {
        
    }
    
    // Runnable entry point to demonstrate List creation and adding elements
    public static void run() {
        System.debug('sai');
        List<String> names= new List<String>{'sai','prakash'};
        names.add('Mani');
        names.add('deep');
        
        names.add(0,'a1');
        System.debug(names);
        List<String> l1=new List<String>(names);
        l1.add('b1');
        System.debug('list 2 >>' + l1);
        //replace at certain index
        l1.set(1, 'SAIGadu');
        l1.remove(2);
        System.debug('after remove >>' + l1);
        System.debug('is Empty  >>' + l1.isEmpty() );
        System.debug('contains >>' + l1.contains('deep'));
        l1.sort();
        // store the l1 elements into l2 list
        
        List<String> l2= new List<String>(l1);
        System.debug(l1);
        System.debug(l2);
        
    }
}