import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class LdsCreateRecord extends LightningElement {
    accountId;
    name;

    handleNameChange(event){
        this.name = event.target.value;
    }

    handleCreate() {
        const recordInput = {
            apiName: 'Account',
            fields: {
                Name : this.name
            }
        };
        createRecord(recordInput)
            .then(result => {
                this.accountId = result.id;
            })
            .catch(error => {
                // TODO:エラー処理
            });
    }
}