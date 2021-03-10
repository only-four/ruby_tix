document.addEventListener("turbolinks:load", function(){
  var QRCode = require('qrcode')
  var canvases = document.querySelectorAll('.qr-canvas')
  var mobileCanvases = document.querySelectorAll('.qr-canvas-mobile')
  canvases.forEach(function(canvas){
    var tkt_num = canvas.dataset.id
    QRCode.toCanvas(canvas, `${tkt_num}`,{ width:190, height:190 }, function(error){
      if (error) {
        console.error(error)
      } 
    })
  })
  mobileCanvases.forEach(function(canvas){
    var tkt_num = canvas.dataset.id
    QRCode.toCanvas(canvas, `${tkt_num}`,{ width:600, height:600 }, function(error){
      if (error) {
        console.error(error)
      } 
    })
  })
})