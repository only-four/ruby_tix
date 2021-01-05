document.addEventListener('DOMContentLoaded',function () {
  var QRCode = require('qrcode')
  var canvas = document.getElementById('canvas')

  
  QRCode.toCanvas(canvas, '20210104v4DJv', function (error) {
    if (error) console.error(error)
    console.log('success!');
  })
  
})