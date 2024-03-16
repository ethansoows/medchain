import lighthouse from '@lighthouse-web3/sdk'

const apiKey = '37de3406.b85aead2c33a4c78ade044749cd3abec';
const uploadResponse = await lighthouse.upload(
  '/home/cosmos/Desktop/patient_data.txt', 
  apiKey
);

//console.log(uploadResponse);
console.log(typeof(uploadResponse['data'] ))
console.log(uploadResponse['data']['Hash'])