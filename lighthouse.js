import lighthouse from '@lighthouse-web3/sdk'
require('dotenv').config();

const API_KEY = process.env.LIGHTHOUSE_API;

const uploadResponse = await lighthouse.upload(
  '/home/cosmos/Desktop/patient_data.txt', 
  API_KEY
);

//console.log(uploadResponse);
console.log(typeof(uploadResponse['data'] ))
console.log(uploadResponse['data']['Hash'])