public class AccessDemor {
    public AccessDemor() {
        
    }
    public void getDay(Integer i){
        switch on i  {
            when 1 {
                System.debug('sunday');
            }
            when else {
                System.debug(' not recognised' );
            }
        }
    }
    
    public void getDay(String s ){
        switch on s {
            when 'Mon'{
                System.debug('Monday >>' );
            }
            when else {
                System.debug('not recognized>>' );
            }
        }
    }
}