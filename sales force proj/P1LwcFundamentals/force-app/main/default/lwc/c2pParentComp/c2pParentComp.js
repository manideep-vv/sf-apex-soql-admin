import { LightningElement } from 'lwc';

export default class C2pParentComp extends LightningElement {
    latestNews;
    latestNewsFromc2;
    showModalFromChild=false;
    showModalFromChild2=false;
    afterClickingModal(){
        this.showModalFromChild=true;
    }
    afterClickingModalWithBubbling(){
    this.showModalFromChild2=true;
    console.log('making modal as true');
    }
    anyParentJsMethodToCloseAlert(event){
        this.showModalFromChild=false;
        this.latestNews=event.detail.latestNewsFromChild;
    }
    handlecloseEventFromc2(event){
        this.showModalFromChild2=false;
        this.latestNewsFromc2=event.detail.latestNewsFromC2;

    }
    
}
