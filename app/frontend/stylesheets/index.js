// window.Swiper = require('swiper');
window.Swiper = require("swiper/swiper-bundle");
// import Swiper styles
import "swiper/swiper-bundle.css";
// core version + navigation, pagination modules:
import Swiper, { Navigation, Pagination } from "swiper";

// configure Swiper to use modules
Swiper.use([Navigation, Pagination]);

import "bootstrap/dist/css/bootstrap.css";
import "tailwindcss/base";
import "tailwindcss/components";
import "./actiontext.scss";
import "trix/dist/trix";
import "trix/dist/trix.css";
import "./navbar";
import "./shared";
import "./tickets";
import "./seats";
import "./qr_code";
import "./user";
import "tailwindcss/utilities";
