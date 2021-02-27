import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {
    subject='入力してください';
    contents='';
    handleChange(event){
        this.contents = event.target.value;
    }
}