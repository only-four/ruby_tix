import { BrowserQRCodeReader } from '@zxing/library/cjs/index.js';
import Rails from '@rails/ujs';

const codeReader = new BrowserQRCodeReader();
codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    document.getElementById('result').textContent = result.text
    let qrDataFromReader = result.text;
    let formData = new FormData();
    let qrCodeParams = {
      qr_data: qrDataFromReader
    };
    formData.append("qr_code_json_data", JSON.stringify(qrCodeParams));
    Rails.ajax({
      url: "/qr_codes",
      type: "post",
      data: formData
    });
  })
  .catch(error => {
    console.error(error);
  });