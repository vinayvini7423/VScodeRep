/* eslint-disable no-undef */
/* eslint-disable no-alert */
/* eslint-disable no-console */
import { LightningElement } from 'lwc';
import carousel from '@salesforce/resourceUrl/carousel';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
export default class CarouselLWC extends LightningElement {
renderedCallback(){   alert('@@ rerender');
    Promise.all([
        loadStyle(this, carousel + '/slick/slick.css'),
        loadStyle(this, carousel + '/slick/slick-theme.css'),
        loadScript(this, carousel + '/jquery/jquery.js'),
        loadScript(this, carousel + '/slick/slick.js')
    ])
    .then(() => { 
        console.log('@@ rerender 1233 ' +JSON.stringify(this.template.querySelectorAll('div')));
        $(this.template.querySelectorAll('[data-id="overview"]')).slick({dots:true,
            infinite: true,
            autoplay: true,
            autoplaySpeed: 3000,
            prevArrow:'<button type="button" style="background-color: #008CBA;" class="slick-prev"></button>',
            nextArrow:'<button type="button" style="background-color: #008CBA;"  class="slick-next"></button>',
            slidesToShow: 3,
            slidesToScroll: 3,
            responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 992,
                        settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 500,
                        settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                        }
                    }

                    ]
            });
    
    }).catch(e => {
        console.log('@@ error'+e);
    });
    alert('@@ not loaded rerender');
}
}