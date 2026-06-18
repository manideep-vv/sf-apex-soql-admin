public with sharing class Fitness {
    String trainerName='';
    public Fitness() {
        System.debug('Exec default con');
    }
    public Fitness(String trainerName){
        this(); // 1st line must be this()
        this.trainerName=trainerName;
        System.debug('Exec param con' + trainerName);
    }
    static{
        System.debug('in static block' );
    }
    
    {
        System.debug('in instance block -1'  );
    }
    {
        System.debug('in instance block -2'  );
    }
    public Decimal calculateBmi(Integer bodyWeight, Decimal height){
        if(height==0){
            System.debug('invalid height');
            return -1;
        }
        //Decimal bmi= bodyWeight/(height*height)
        Decimal bmi= bodyWeight/(height*height);
        System.debug(' body weight' + bmi);
        return bmi.round(System.RoundingMode.UP);
    }
    public Decimal calcPace(Integer kmRan, Integer timeInHours){
        Decimal timeInMinutes= timeInHours*60;
        Decimal pace=kmRan/timeInMinutes;
        System.debug('pace >>' + pace);
        return pace;
    }
    public Decimal calcPaceInMin(Integer kmRan, Integer timeInMinutes){
        if(kmRan<=0 ||timeInMinutes<=0){
                return -1;
        }
        Decimal timeInHours=timeInMinutes/60;
        Decimal pace= kmRan/timeInHours;
        return pace.round(System.RoundingMode.UP);  

    }
}