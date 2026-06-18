import { LightningElement } from "lwc";

export default class P2cParentcomp extends LightningElement {
  employeeData = [
    { id: 1, Name: "Charan Local boy", Age: 23 },
    { id: 2, Name: "Sailu The Actor ", Age: 29 },
    { id: 3, Name: "Santhoshi Vampire", Age: 30 },
  ];
  totalMarks;
  waterWastageInLitres;
  
  updateMarks(event){
  this.totalMarks=event.target.value;
  }

  //  this parent js method will directly call child js method
  updateWaterWastageLitres(event){
    this.waterWastageInLitres=event.target.value;
    // here this parent js method is calling child comp js method 
    this.template.querySelector("c-p2c-child-slider-comp").childJsMethodToGetLatestUpdates(this.waterWastageInLitres);
  }

  carouselData = [
    {
      src: "https://picsum.photos/800/300?1",
      header: "First Card",
      description: "First Description",
    },
    {
      src: "https://picsum.photos/800/300?2",
      header: "Second Card",
      description: "Second Description",
    },
    {
      src: "https://picsum.photos/800/300?3",
      header: "Third Card",
      description: "Third Description",
    },
  ];
}
