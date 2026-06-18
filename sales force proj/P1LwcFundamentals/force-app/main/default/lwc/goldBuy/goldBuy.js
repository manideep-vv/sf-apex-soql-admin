import { LightningElement } from "lwc";

export default class GoldBuy extends LightningElement {
  todayGoldPrice = 1000;

  units;
  options = [
    "Gold MututalFunds",
    "ETF",
    "Soverigns Gold Bonds",
    "Physical Gold Bars",
  ];
  goldShopsList = [
    {
      name: "Lalitha jewelery",
      address: "Hyderabad",
      contactNumber: "9876543210",
    },
    {
      name: "GRT jewelery",
      address: "Chennai",
      contactNumber: "9876543210",
    },
    {
      name: "Khazana jewelery",
      address: "Bangalore",
      contactNumber: "9876543210",
    },
  ];
  doesShowOptions = false;

  updateUnits(e) {
    console.log(e.target.value);
    this.units = e.target.value;
  }

  get totalBill() {
    console.log("inside getter method");
    return this.units * this.todayGoldPrice;
  }
  showOptions() {
    this.doesShowOptions = true;
  }
  hideOptions() {
    this.doesShowOptions = false;
  }

  // this getter will be fired automatically when the getter method var update
  get showCoupouns() {
    return this.units > 100;
  }
}
