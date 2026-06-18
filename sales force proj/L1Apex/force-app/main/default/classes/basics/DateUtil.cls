public with sharing class DateUtil {
    public DateUtil() {

    }

    public static void testDateMethods(){
        Date d =Date.newInstance(2020, 1,1);
        Date d1 =Date.newInstance(2025, 1,1);
        System.debug('months between>>>' + d1.monthsBetween(d));
        System.debug('days between>>>' + d1.daysBetween(d));
    }
}