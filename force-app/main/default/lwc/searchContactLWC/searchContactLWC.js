/* eslint-disable @lwc/lwc/no-async-operation */
/* eslint-disable no-console */

import { LightningElement,track,wire } from 'lwc';
import findContacts from '@salesforce/apex/LWCApexClassForTest.findContacts';
const DELAY = 300;

export default class SearchContactLWC extends LightningElement {
 
    @track searchKey = '';

    @wire(findContacts, { searchKey: '$searchKey' })
    contacts;

    handleKeyChange(event) {
        // Debouncing this method: Do not update the reactive property as long as this function is
        // being called within a delay of DELAY. This is to avoid a very large number of Apex method calls.
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, DELAY);
    }
}