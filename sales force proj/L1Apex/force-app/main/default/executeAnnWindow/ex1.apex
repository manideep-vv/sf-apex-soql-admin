//Basics
// ExceptionDemo.diffExceptionsDemo();
// ExceptionDemo.TRY_CATCH_FINALLY_DEMO(); 

ExceptionDemo.diffExceptionsDemo();

// ContactTriggerHandler handler= new ContactTriggerHandler();
// handler.updateActiveContactsCountInAccountTable();

// GroupAggregationsDemo demo=new GroupAggregationsDemo();
// demo.captureAggregateResultDemo();

// Map<Id,Opportunity> allIds=new Map<Id,Opportunity>([select Id  from Opportunity ]);
// OpportunityController.updateProfile(new List<Id>(allIds.keySet()));
// OpportunityController.cpuLimitHitDemo(new List<Id>(allIds.keySet()));

// DateUtil.testDateMethods();

// Account table related
// List<Account> accs= [SELECT  Id FROM account ];
// AccountController.updateAvgCaseResolutionDaysInAccount(new Map<Id,Account>(accs).keySet());

// Case c=[select id from case where id='500dL00002atUCIQA2'];
// c.ClosedDate(System.now());
// update c;

 

// FutureDemo.insertBooksAsync();
// List<String> ls=new List<String>{'a','b','c '};
// System.debug('index from list >>' + ls[0]);

// new BatchableDemo().triggerThisBatch();

// List<Book__c> bookIds=[select id,countryOfORigin__C from Book__c];
// System.enqueueJob(new QueueableApexDemo(bookIds ));

// NightlyJob_SchedulableDemo ns=new NightlyJob_SchedulableDemo();
// ns.scheduleThisJob();

// System.debug('Now (org time)        : ' + System.now());