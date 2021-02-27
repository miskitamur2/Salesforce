import { LightningElement } from 'lwc';
export default class HeloLWC extends LightningElement {
name = 'Developer';
changeHandler(event) {
    this.name = event.target.value;
    }
}