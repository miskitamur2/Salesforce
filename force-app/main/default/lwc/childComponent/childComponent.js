import { LightningElement, api } from 'lwc';
export default class ChildComponent extends LightningElement {
    @api childNumber;

    handleClick(){
        const event = new CustomEvent('msg', {detail: this.childNumber});
        this.dispatchEvent(event);
    }
}