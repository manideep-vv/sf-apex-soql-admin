import { LightningElement,api } from 'lwc';

export default class P2cChildAlertComp extends LightningElement {
    @api dailyStudyProgress;
    @api messageToUser;
    @api isDailyLearner;
   
}