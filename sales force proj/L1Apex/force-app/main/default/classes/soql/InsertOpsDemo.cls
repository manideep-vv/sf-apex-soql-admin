public with sharing class InsertOpsDemo {
  public InsertOpsDemo() {
  }
  public void insert1Contact() {
    System.debug('insert'); //u can initialise db object in 3 ways
    Contact c = new Contact(FirstName = 'Puneeth3', LastName = 'ar3'); //create obj with constructor
    c.Email = 'punee@ampf3.com'; //2 setting values to global variables
    c.put('MobilePhone', '25252525253'); // 3)using Map put method
    Database.SaveResult result = Database.insert(c, false);
    if (result.isSuccess()) {
      System.debug('inserted');
    } else {
      System.debug('errors' + result.getErrors());
    }
  }

  public void insertMultipleContacts() {
    List<Contact> allContacts = new List<Contact>{
      new Contact(
        FirstName = 'Ramadevi',
        LastName = 'vvs',
        Email = 'vvs@gmail.com'
      ),
      new Contact(
        FirstName = 'ranga rao',
        LastName = 'vv',
        Email = 'Ranga@gmail.com'
      ),
      new Contact(
        FirstName = 'roopa',
        LastName = 'thaneru',
        Email = 'Roopa@gmail.com'
      )
    };
    Database.insert(allContacts, false);
    System.debug('inserted');
  }
}
