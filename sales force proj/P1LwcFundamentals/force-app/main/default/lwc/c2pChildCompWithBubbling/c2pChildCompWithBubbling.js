import { LightningElement } from 'lwc';

export default class C2pChildCompWithBubbling extends LightningElement {
    sendDataToParent(){
        const d={
            detail:{
                latestNewsFromC2:'IDF and USA killed Iran leader khameni'
            },
            bubbles:true
        }
        const event=new CustomEvent('senddataevernfromchild2',d);
        this.dispatchEvent(event);
    }
}