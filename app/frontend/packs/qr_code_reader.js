import { BrowserQRCodeReader } from '@zxing/library/cjs/index.js';

const codeReader = new BrowserQRCodeReader();

codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    // process the result
    console.log(result.text)

    document.getElementById('result').textContent = result.text
  })
  .catch(err => console.error(err));