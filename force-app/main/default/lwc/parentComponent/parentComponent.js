import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    array = [1, 2, 3];
    parentNumber;

    handleEvent(e){
        this.parentNumber = e.detail;
    }
}