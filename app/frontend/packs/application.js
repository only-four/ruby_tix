require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("javascript")
require("stylesheets")
require("trix")
require("@rails/actiontext")
// import "stimulus"
import "controllers"
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import 'jquery'
import $ from 'jquery';
window.$ = $
import "chart.js"
// import './qr_code_reader';
import Swal from 'sweetalert2';
window.Swal= Swal
// window.Swiper = require('swiper');
window.Swiper = require('swiper/swiper-bundle');

// import Swiper styles
import 'swiper/swiper-bundle.css';
// core version + navigation, pagination modules:
import Swiper, { Navigation, Pagination } from 'swiper';


// configure Swiper to use modules
Swiper.use([Navigation, Pagination]);

