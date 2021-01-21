document.addEventListener("turbolinks:load", function(){
  var QRCode = require('qrcode')
  var canvases = document.querySelectorAll('.qr-canvas')
  canvases.forEach(function(canvas){
    var tkt_num = canvas.dataset.id
    QRCode.toCanvas(canvas, `${tkt_num}`,{ width:190, height:190 }, function(error){
      if (error) {
        console.error(error)
      } 
    })
  })
})