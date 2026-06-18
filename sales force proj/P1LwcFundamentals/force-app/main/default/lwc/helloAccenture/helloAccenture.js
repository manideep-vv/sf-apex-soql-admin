import { LightningElement } from "lwc";

export default class HelloAccenture extends LightningElement {
  cityName = "";

  user = {
    name: "Mani",
  };
  // updating direct variable
  updateCityName(event) {
    this.cityName = event.target.value;
  }
  // updating the whole object variable not fields of obj variable by using  spread operatorr
  updatePersonalDetails(event) {
    this.user = { ...this.user, name: event.target.value };
  }
}
