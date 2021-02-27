import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import CREATEDDATE_FIELD from '@salesforce/schema/Account.CreatedDate';

export default class WireGetRecordProp extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, CREATEDDATE_FIELD] })
    account;

    get name(){
        return getFieldValue(this.account.data, NAME_FIELD);
    }

    get createdDate(){
        return getFieldValue(this.account.data, CREATEDDATE_FIELD);
    }
}