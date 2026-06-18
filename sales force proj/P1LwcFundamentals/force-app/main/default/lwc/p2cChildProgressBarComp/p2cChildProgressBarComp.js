import { LightningElement,api } from 'lwc';

export default class P2cChildProgressBarComp extends LightningElement {
    // this var will receive data from parent comp when this value changes html will be updated accordingly
    @api latestPassPercentage;
}