import { LightningElement } from "lwc";

export default class RamChildComp extends LightningElement {
  ramSizeInGB;
  
  disconnectedCallback(){
    window.alert("child disconnectedCallback() called");
    console.log("child disconnectedCallback() called");
  }
  constructor() {
    super();
    console.log("child cons called ..");
  }
  changeHandler(e) {
    this.ramSizeInGB = e.target.value;
  }

  connectedCallback() {
    console.log("child connectedcallback()  Called");
  }
  renderedCallback() {
    console.log("child renderedcallback() called");
    if(this.ramSizeInGB<=0){
      window.alert('validation failed, about to throw error ')
      throw new Error("RAM size should be greater than 1 GB");
    }
  }

}
