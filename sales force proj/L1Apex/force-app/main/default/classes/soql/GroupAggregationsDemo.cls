public with sharing class GroupAggregationsDemo {
  public GroupAggregationsDemo() {
    
  }
  public void captureAggregateResultDemo(){
    for (AggregateResult ar:[select stagename,count(id) stagecount, min(amount) minAmnt ,max(amount) maxamount from opportunity group by stagename]){
      System.debug('stage name' + ar.get('stagename') + 'count is '+ar.get('stagecount')+'min amount -- '+ar.get('minAmnt')+' maxamount --'+ar.get('maxamount') );
    }
  }
}