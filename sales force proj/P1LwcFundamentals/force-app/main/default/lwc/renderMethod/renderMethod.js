import { LightningElement } from "lwc";
//we should import all the html files
import login from "./login.html";
import registerUser from "./registerUser.html";
/**
 * this class is to demo the render lifecycle method
 */
export default class RenderMethod extends LightningElement {
  buttonClicked = "";

  handleClick(e) {
    this.buttonClicked = e.target.label;
  }
  LoginOrRegisterActions(e) {
    console.log(`Hello Dear user you have ${e.target.label}  successfully `);
  }

  //This method is called when any state or global variable changes
  render() {
    console.log(
      `calling r-render method with button clicked as ${this.buttonClicked}`,
    );
    if (this.buttonClicked === "Login") {
      return login;
    } else if (this.buttonClicked === "Register") {
      return registerUser;
    } else {
      return super.render();
    }
  }
  constructor() {
    super();
    console.log("r constructor");
  }

  connectedCallback() {
    console.log("r-connectedCallback");
  }
  renderedCallback() {
    console.log("r-renderedCallback");
  }

  disconnectedCallback() {
    console.log("r-disconnectedCallback");
  }
}
