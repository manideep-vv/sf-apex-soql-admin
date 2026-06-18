import { LightningElement } from "lwc";

export default class C2pChildModalComp extends LightningElement {
  sendDataToParent() {
    console.log('ok button clicked' );
    const d = {
      detail: {
        latestNewsFromChild: 'iran launched ballistic missiles on saudi arabia'
      } 
    };
    const event = new CustomEvent('senddataeventfromchild', d);
    console.log('about to dispatch event from child' );
    this.dispatchEvent(event);
  }
}
