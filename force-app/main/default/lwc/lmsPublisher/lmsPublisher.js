import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';

import RECORD_SELECTED_CHANNEL from "@salesforce/messageChannel/RecordSelected__c";
import getContacts from '@salesforce/apex/LmsPublisherController.getContacts';

export default class lmsPublisher extends LightningElement {

    @wire(MessageContext)
    messageContext

    @wire(getContacts)
    contacts

    handleSelect(event){
        const payload = { recordId: event.currentTarget.dataset.contactId}; // 要素のdata-contact-idを取る
        publish(this.messageContext, RECORD_SELECTED_CHANNEL, payload);
    }
}