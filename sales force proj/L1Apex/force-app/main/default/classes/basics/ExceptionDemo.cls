public with sharing class ExceptionDemo {
  public ExceptionDemo() {
  }

  public static void diffExceptionsDemo() {
    Double d=0.011;
    System.debug(d*100);
    System.debug('Math Exception demo >>');
    // System.debug('10/0 >>' +10/0);

    System.debug('DML Exception demo >>');
    // Account  acc=new Account();
    // insert acc;
    System.debug('Null pointer Exception demo >>');

    // String s;
    // s.toLowerCase();
    System.debug('throwing custom exception demo >>');
    throw new NoSuchElementException('Train ticket missing bro');
  }

  public static void TRY_CATCH_FINALLY_DEMO() {
    System.debug('Before try block >>');
    try {
      System.debug('Inside try block >>');
      System.debug('10/0 >>' + 10 / 0);
      System.debug('After 10/0 >>');
    } catch (NullPointerException e) {
      System.debug('in catch block  >>' + e);
    } catch (Exception e) {
      System.debug('in parent catch block  >>' + e);
    } finally {
      System.debug('in finally block >>');
    }
    System.debug('after finally block >>');
  }
}
