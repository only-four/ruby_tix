document.addEventListener('DOMContentLoaded',function () {
  var QRCode = require('qrcode')
  var canvas = document.getElementById('canvas')
  var tkt_num = document.getElementsByClassName('ticket_number')
  console.log(tkt_num);

  
  QRCode.toCanvas(canvas, "https://github.com/xx4673?tab=overview&from=2021-01-01&to=2021-01-05", function (error) {
    if (error) console.error(error)
    console.log('success!');
  })
  
})