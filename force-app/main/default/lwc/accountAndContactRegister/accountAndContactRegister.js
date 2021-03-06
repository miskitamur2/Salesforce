import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { api, LightningElement } from 'lwc';
export default class AccountAndContactRegister extends LightningElement {
    accountId;
    accountName;
    accountNameKana;
    accountCode;
    contactId;
    lastName;
    firstName;

    onChangeAccountName(event){
        this.accountName = event.target.value;
    }

    onChangeAccountNameKana(event){
        this.accountNameKana = event.target.value;
    }

    onChangeAccountCode(event){
        this.accountCode = event.target.value;
    }

    onChangeLastName(event){
        this.lastName = event.target.value;
    }

    onChangeFirstName(event){
        this.firstName = event.target.value;
    }

    handleCreate(){
        const accountRec = {
            apiName: 'Account',
            fields: {
                Name : this.accountName,
                AccountKana__c : this.accountNameKana,
                AccountNumber : this.accountCode
            }
        };
        const contactRec = {
            apiName : 'Contact',
            fields : {
                LastName : this.lastName,
                FirstName : this.firstName
            }
        };
        createRecord(accountRec)
            .then(result => {
                this.accountId = result.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
        createRecord(contactRec)
            .then(result => {
                this.contactId = result.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }
}