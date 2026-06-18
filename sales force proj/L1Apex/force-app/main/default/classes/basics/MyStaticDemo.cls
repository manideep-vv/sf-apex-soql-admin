public with sharing class MyStaticDemo {
    public MyStaticDemo() {

    }
   public static Integer x;
    static {
         x=10;
        System.debug('executed static class' );
    }
} 