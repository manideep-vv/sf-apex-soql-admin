public with sharing class Logger {
    public Logger() {

    }
    public static void info(String logWithPlaceholders, Object  arg1 ){
        String s= String.format(logWithPlaceholders, new List<Object>{arg1});
        System.debug(s);
    }
    public static void info(String logWithPlaceholders, Object arg1,Object arg2){
        String s= String.format(logWithPlaceholders, new List<Object>{arg1,arg2});
        System.debug(s);
    }
    // public static void info(String logWithPlaceholders, Object arg1,String arg2){
    //     String s= String.format(logWithPlaceholders, new List<Object>{arg1,arg2});
    //     System.debug(s);
    // }
    
        public static void info(String logWithPlaceholders, String arg1,String arg2,String arg3){
            String s= String.format(logWithPlaceholders, new List<String>{arg1,arg2,arg3});
            System.debug(s);
        }
    
        public static void info(String logWithPlaceholders, String arg1,String arg2,String arg3,String arg4){
            String s= String.format(logWithPlaceholders, new List<String>{arg1,arg2,arg3,arg4});
            System.debug(s);
        }
    
    public static void test( ){
        Logger.info('hello {0} Good Morning , your Ticket has been {1}','Manideep','Not booked');
        Logger.info('hello {0} Good Morning , your Ticket has been {1}, so book for  {2}','Manideep','failed','Simhapuri train');
        Logger.info('hello {0} Good Morning , Choose among 3 trains- {1} ,{2}, {3} ','Manideep','Simhapuri train','Karnataka Express','Bangalore Express');
    }
}