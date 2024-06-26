# MedChain - Smart Contract (Base Layer) and Distributed file storage (Filecoin-Lighthouse) 


# Overview
The MedChain decentralised application uses [lighthouse*](https://docs.lighthouse.storage/lighthouse-1/quick-start) to store the patient's data on the Filecoin network and generates a hash which is then uploaded on to the [Base](https://www.base.org/) Layer 2 network.

For a more detailed version of what the team is trying to achieve, please refer to this [link](https://github.com/timch8/Patient_Portal) which is also the front end of the patient's profile. Refer to this [link](https://github.com/timch8/Doctor_Portal) for the front end to the doctor's portal. 

*Lighthouse is a facilitator of permanent file storage on the Filecoin Network where users only pay once and their files are stored forever."
<br>
<br>




# 1.Filecoin (Lighthouse)
## 1.1 Set up 

Create an API Key

1. Login into Lighthouse files dapp (https://files.lighthouse.storage/)

2. Go to the API key section and generate the key
<img width="452" alt="image" src="https://github.com/ethansoows/medchain/assets/32422632/ac739836-1ad0-4a91-bada-1371e3b5cf73">


3. Create a .env file and in there create a varaible `LIGHTHOUSE_API` = `<API_KEY>`

4. Enter the patient's name and date of birth in the [patient_contact.txt]() file.  

<br>

## 1.2 Functionlity
The [lighthouse.js](https://github.com/ethansoows/medchain/blob/main/lighthouse.js) javascript file saves the `patient_context.txt` onto Filecoin decentralised storage and the hash will be passed to the smart contract to be stored in the block chain. 

<br>

# 2. Smart Contract (Baselayer)
# 2.1 Set up

1. Setting Up Base's Custom Testnet on MetaMask:
Install MetaMask: If you haven't already installed MetaMask, you can download and install it as a browser extension for Chrome, Firefox, Brave, or Edge.

2. Create or Import an Account: Open MetaMask and either create a new Ethereum account or import an existing one using your seed phrase.

3. Switch to Test Network: By default, MetaMask connects to the Ethereum Mainnet. To switch to a test network, click on the network dropdown at the top of the MetaMask window.

4. Select Custom RPC: At the bottom of the network list, click on "Custom RPC" to add a custom network.

5. Fill in Network Details: Fill in the following details for Base's custom test network:

6. Network Name: "Base Testnet" or any name you prefer.
New RPC URL: Consult Base's documentation or website for the RPC URL of their testnet.
Chain ID: Base should provide the Chain ID for their testnet.
Symbol (optional): Symbol of the test network's currency, if applicable.
Block Explorer URL (optional): URL of the block explorer for Base's test network.
Save the Configuration: Click "Save" to add the custom network configuration.

7. Switch to Base's Test Network: After saving the configuration, select "Base Testnet" or the name you provided from the network dropdown to switch to it.

## 2.2 Requesting Test Ether (if necessary)

1. If Base's testnet requires test Ether for transactions, you may need to request it from a testnet faucet. Follow these steps to request test Ether:

2. Find a Base Testnet Faucet: Search for a testnet faucet specific to Base's test network. You can often find these by searching "Base Testnet ETH faucet" or similar.

3. Navigate to the Faucet Website: Once you've found a suitable faucet, navigate to its website. These faucets typically have a simple web interface where you can request test Ether.

4. Follow the Faucet Instructions: Provide your Ethereum address (the one from your MetaMask account) and complete any required CAPTCHAs or verification steps.

5. Request Test Ether: Submit your request for test Ether. Some faucets may provide a small amount of Ether instantly, while others may take a short time to process your request.

6. Check Your MetaMask Balance: Once your request has been processed, check your MetaMask balance to see if the test Ether has been deposited into your account on Base's test network. You should see the test Ether balance increase accordingly.


## 2.3 Contract Details
The contract details are in the [main.sol](https://github.com/ethansoows/medchain/blob/main/contracts/main.sol) file. 

- **Compiler Version:** Solidity ^0.8.0
- **Contract Name:** EHR

### Structs

### PatientProfile

- `profileHash`: IPFS hash of the patient profile.
- `patientAddress`: Ethereum address of the patient.

### ClinicProfile

- `profileHash`: IPFS hash of the clinic profile.
- `clinicAddress`: Ethereum address of the clinic.

### MedicalRecord

- `recordHash`: IPFS hash of the medical record.
- `timestamp`: Timestamp when the record was added.

### Mappings

- `patientMedicalRecords`: Maps a patient identifier to their array of medical records.
- `patientProfiles`: Maps a patient identifier to their profile information.
- `clinicProfiles`: Maps a clinic identifier to their profile information.

### Functions

### setPatientProfile

Registers or updates a patient profile.

- **Parameters:**
    - `patientId` (bytes32): The identifier for the patient.
    - `profileHash` (string): The IPFS hash of the patient's profile.
    - `patientAddress` (address): The Ethereum address of the patient.

### setClinicProfile

Registers or updates a clinic profile.

- **Parameters:**
    - `clinicId` (bytes32): The identifier for the clinic.
    - `profileHash` (string): The IPFS hash of the clinic's profile.
    - `clinicAddress` (address): The Ethereum address of the clinic.

### addMedicalRecord

Adds a medical record for a specific patient.

- **Parameters:**
    - `patientId` (bytes32): The identifier for the patient.
    - `recordHash` (string): The IPFS hash of the medical record.

### getAllPatientHashes

Retrieves all medical record hashes for a given patient, including their profile hash.

- **Parameters:**
    - `patientId` (bytes32): The identifier for the patient.
- **Returns:**
    - `allHashes` (string[]): An array of all medical record hashes for the patient, including the profile hash.

## 2.4 Deployment
The team ran this code using the [remix editor](https://remix.ethereum.org/). Do note that we need to set the environemnt to **Injected Provider - Metammask**. You can also choose to run this contract on other testnet that utilizes Base. 


<img width="286" alt="image" src="https://github.com/ethansoows/medchain/assets/32422632/eed7ab81-cea8-4e30-b0f1-ac05d99e6f48">



## Contribution

Contributions are welcome! If you'd like to contribute, please fork the repository and submit a pull request with your proposed changes.


