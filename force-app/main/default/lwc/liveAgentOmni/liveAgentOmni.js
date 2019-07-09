/* eslint-disable no-alert */
/* eslint-disable @lwc/lwc/no-document-query */
/* eslint-disable @lwc/lwc/no-async-operation */
/* eslint-disable no-undef */
/* eslint-disable no-console */
/* eslint-disable no-unused-vars */
import { LightningElement, api } from 'lwc';
import deployement from '@salesforce/resourceUrl/deployement';
import jQueryPlugin from '@salesforce/resourceUrl/jQueryPlugin';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
export default class LiveAgentOmni extends LightningElement {
    @api heading="Omni-Channel Chat";
    renderedCallback(){  
       // alert('renderedCallback22');
        //alert('@@ test '+JSON.stringify( this.querySelector('div')));
       // alert('@@ test '+JSON.stringify(this.querySelector('.chatButton')));
        Promise.all([
        loadScript(this, jQueryPlugin + '/jquery-2.1.1.min.js'),
        loadScript(this, deployement )
    ])
    .then(() => { 
        
            liveagent.enableLogging();
            function bindLiveAgent() {
                console.log('@@ live agent');
                liveagent.init('https://d.la1-c2-ukb.salesforceliveagent.com/chat', '5720o000000bq0Z', '00D0o0000015v4l');
                //  liveagent.showWhenOnline('5730o000000XvxC', document.getElementById('chatButton'));
                liveagent.showWhenOnline('5730o000000XvxC', document.getElementById('chatButton'));
                liveagent.showWhenOffline('5730o000000XvxC', document.getElementById('liveagent_button_offline_5730o000000XvxC'));
                if (!window._laq) { window._laq = []; }
                window._laq.push(function(){liveagent.showWhenOnline('5730o000000XvxC', document.getElementById('chatButton'));
                                            liveagent.showWhenOffline('5730o000000XvxC', document.getElementById('liveagent_button_offline_5730o000000XvxC'));
                                           });
            }
             window.setInterval(bindLiveAgent,500);
            
        
     });
}
startChat(){
    console.log('@@ live agent startChat');
    liveagent.startChat('5730o000000XvxC');
}
}