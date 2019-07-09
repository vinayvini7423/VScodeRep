/* eslint-disable no-console */
import { LightningElement, api, track, wire } from 'lwc';
import demoMethod from '@salesforce/apex/demoTest.demoMethod';
import sampleTest from '@salesforce/apex/demoTest.sampleTest';
import getContactList from '@salesforce/apex/demoTest.getContactList';
//import getAccounttList from '@salesforce/apex/demoTest.getAccounttList';
export default class FirstCmp extends LightningElement {
    @api name='vinay test';
    @track name2=' =================done';
    @track rec;
    @track contactRec;
    @wire(demoMethod) testdata;
    @track searchKey;
    @wire(sampleTest) testdata1({ error,data}){
        if(data){
            this.rec=data;
        }
        if(error){
            this.rec='error contains';
        }
    }
    @wire(getContactList,{
        name:'$searchKey'
    }) conatctlistdata({error,data}){
        if(data){
this.contactRec=data;
        }
        if(error){
           
        console.log('value 1'+error);
        }
    }
    
    handleChange(event){
        event.preventDefault();
        
        // eslint-disable-next-line no-console
        console.log('value 1'+event.target.value);
       this.searchKey=event.target.value;
    }
}