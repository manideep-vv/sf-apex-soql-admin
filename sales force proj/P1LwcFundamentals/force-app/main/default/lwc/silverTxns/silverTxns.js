import { LightningElement } from "lwc";

export default class SilverTxns extends LightningElement {
  silverExportCountries = ["Mexico", "Peru", "China2"];
  units=0;

  doUnitsValidation(event){
      this.units=event.target.value;
       console.log('fired do this.units method');  
  }
  //this method will be fired automatically when any variable changes
  get fetchStyleDynamically(){
    console.log('returning style');  
    if(this.units>0){
        return "border:2px solid green";
    }else{
        return "border:2px dashed red"
    }

  }

  printCountryNames() {
    //fetching single element using class name
    const enteredUnits = this.template.querySelector(".units").value;
    console.log(enteredUnits);

    //Fetching list of elements using class name
    const countries = this.template.querySelectorAll(".slds-item");

    Array.from(countries).forEach((c) => {
      c.style.border = "2px solid green";
      console.log(c.innerText);
    });
    console.log(countries.length);
    // Manually modify Dom Ele by adding a ele to DOM
  }

  displayDiscount() {
    console.log(`in discount method`);
    const enteredUnits = this.template.querySelector(".units").value;
    if (enteredUnits > 100) {
      this.template.querySelector(".slds-box").innerHTML =
        `<h1> Use coupon code Infosys</h1>`;
    } else {
      this.template.querySelector(".slds-box").innerHTML = ``;
    }
  }
}
