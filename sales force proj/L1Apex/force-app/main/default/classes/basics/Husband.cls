public with sharing class Husband {
    String husbandName;
    Wife wife;
    public Husband(String husbandName) {
        this.husbandName=husbandName;
    }
    
    public void setWifeName(String name){
        Wife  myWife=new Wife(name);
        this.wife=myWife;
    }
    public void getWifeName(){
        System.debug('Wife name is Santhoshi');
    }
    
    public void getHusbandName(){
        System.debug('Husband name is Mani');
    }
  
    public class Wife{
        String name;
        public wife(String name ){
            this.name=name;
        }
        public void getWifeName(){
            System.debug('Wife name is -->'+name);
        }
    }
}