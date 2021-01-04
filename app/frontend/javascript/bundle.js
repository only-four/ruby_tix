document.addEventListener('DOMContentLoaded',function () {
  var QRCode = require('qrcode')
  var canvas = document.getElementById('canvas')

  
  QRCode.toCanvas(canvas, 'https://github.com/soldair/node-qrcode#highlights', function (error) {
    if (error) console.error(error)
    console.log('success!');
  })
  
})