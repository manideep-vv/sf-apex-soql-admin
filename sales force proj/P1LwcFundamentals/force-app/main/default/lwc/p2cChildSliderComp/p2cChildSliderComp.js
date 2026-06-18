import { LightningElement,api } from 'lwc';

export default class P2cChildSliderComp extends LightningElement {
    @api waterWastageInLitres=10;

    /**
     this method will be called by parent comp js method 
     when this child js var updated then child html will be re-rendered
     */
    @api
    childJsMethodToGetLatestUpdates(litresWasted){
        this.waterWastageInLitres=litresWasted
    }
}