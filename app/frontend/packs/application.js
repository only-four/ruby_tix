require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("javascript")
require("styles")

import "controllers"
// import "stimulus"
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import "@fortawesome/fontawesome-free/js/all"
import 'jquery'
import $ from 'jquery';
window.$ = $
import './qr_code_reader'



// tailwind
// import "stylesheets/application" // ADD THIS LINE

require("trix")
require("@rails/actiontext")
require("stylesheets/application.scss")

import "stylesheets/application"
import "controllers"



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
