import { LightningElement } from "lwc";

export default class LaptopParentComp extends LightningElement {
  brandName;

  isChildVisible = false;
  // this callback method is used to catch exceptions arised in child component
  errorCallback(error, stack) {
    console.log("parent errorCallback is called");
    console.log(error);
    console.log(error.message);
    console.log(stack);
  }
  constructor() {
    super();
    console.log(" parent constructor is called");
  }
  connectedCallback() {
    console.log("parent connectedCallback is called");
  }

  renderedCallback() {
    console.log("parent renderedCallback is called");
  }

  toggleVisibility() {
    this.isChildVisible = !this.isChildVisible;
  }

  changeHandler(e) {
    this.brandName = e.target.value;
  }


  disconnectedCallback() {
    console.log("parent disconnectedCallback is called");
  }

  
}
