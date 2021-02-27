import { LightningElement } from 'lwc';

export default class HelloProp extends LightningElement {
    companyName = 'テラスカイ';
    handleChange(event){
        this.companyName = event.target.value;
    }
}