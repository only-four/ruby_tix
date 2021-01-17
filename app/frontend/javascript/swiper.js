// // core version + navigation, pagination modules:
// import Swiper, { Navigation, Pagination } from 'swiper';
// window.Swiper = Swiper;
// // debugger
// console.log('!!!')
// // configure Swiper to use modules
// Swiper.use([Navigation, Pagination]);
import Swiper, { Navigation, Pagination } from 'swiper';

Swiper.use([Navigation, Pagination]);



document.addEventListener("turbolinks:load", function(){

  var swiper = new Swiper('.swiper-container', {
    pagination: {
      el: '.swiper-pagination',
      type: 'fraction',
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
})


