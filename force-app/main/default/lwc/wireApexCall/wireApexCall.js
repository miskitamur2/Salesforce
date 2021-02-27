import { LightningElement, wire } from 'lwc';
import findAccounts from '@salesforce/apex/WireApexCallController.findAccounts';

const columns = [
    { label: '会社名', fieldName: 'Name' },
    { label: 'Website', fieldName: 'Website', type: 'url' },
    { label: '電話', fieldName: 'Phone', type: 'phone' },
    { label: '最終更新日', fieldName: 'LastModifiedDate', type: 'date' },
];

export default class WireApexCall extends LightningElement {

    columns = columns;
    accounts;
    inputName = 'united';

    @wire(findAccounts,{searchKey: '$inputName'})
    wiredAccounts({error, data}){
        if(data){
            this.accounts = data;
        } else if(error){
            // TODO: エラー処理(this.errors = error など)
        }
    }

    handleChange(event){
        this.inputName = event.target.value;
    }
}