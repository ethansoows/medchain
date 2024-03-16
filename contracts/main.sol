pragma solidity ^0.8.0;

contract EHR {

    // Define a struct for Patient Profile 
    struct PatientProfile {
        string profileHash; // IPFS hash of patient profile
        address patientAddress; //Ethereum address of patient 
    }
   
    // Define a struct for Clinic Profile
    struct ClinicProfile {
        string profileHash; // IPFS hash of the clinic profile
        address clinicAddress; //Ethereum address of clinic 
    }

    // Define a struct for Medical Records
    struct MedicalRecord {
        string recordHash; // IPFS hash of medical record
        uint256 timestamp; //timestamp when the record was added
    }

    //Mapping from patient identifier (bytes32) to their profile information and medical information
    mapping(bytes32 => MedicalRecord[]) private patientMedicalRecords;
    mapping(bytes32 => PatientProfile) private patientProfiles;

    mapping(bytes32 => ClinicProfile) private clinicProfiles;

    //FUNCTIONS()

    //Function for patient registration 
    function setPatientProfile(bytes32 patientId, string memory profileHash, address patientAddress) public {
        // In a real-world scenario, ensure that only the patient or an authorized entity can call this
        PatientProfile memory newProfile = PatientProfile({
            profileHash: profileHash,
            patientAddress: patientAddress
        });
        patientProfiles[patientId] = newProfile;
    }

    // Function for clinic registration or profile update
    function setClinicProfile(bytes32 clinicId, string memory profileHash, address clinicAddress) public {
    //ClinicProfile Creation: A new ClinicProfile struct instance is created in memory with profileHash assigned to the profileHash field of the struct. This struct is a temporary object representing the clinic's profile.
        ClinicProfile memory newProfile = ClinicProfile({
            profileHash: profileHash,
            clinicAddress: clinicAddress  // Now providing the second field
        });
        //Updating the Mapping: The clinicProfiles mapping, which maps clinicId to ClinicProfile, is updated with the newProfile. If clinicId already exists in clinicProfiles, this operation updates the existing entry; if not, it creates a new entry.
            clinicProfiles[clinicId] = newProfile;
        clinicProfiles[clinicId] = newProfile;
}

    // Function to add a medical record for a patient
    function addMedicalRecord(bytes32 patientId, string memory recordHash) public {
        // At production level, we would add checks to ensure only authorized clinics can add records
        MedicalRecord memory newRecord = MedicalRecord({
            recordHash: recordHash,
            timestamp: block.timestamp
        });
        patientMedicalRecords[patientId].push(newRecord);
    }

    // Function to retrieve and view medical record for a patient
    function getAllPatientHashes(bytes32 patientId) public view returns (string[] memory) {
        // Retrieve the patient profile
        PatientProfile storage profile = patientProfiles[patientId];
        string memory profileHash = profile.profileHash;

        // Retrieve all medical record hashes for the patient
        MedicalRecord[] storage records = patientMedicalRecords[patientId];
        string[] memory allHashes = new string[](records.length + 1);

        // First element is the patient's profile hash
        allHashes[0] = profileHash;

        // Subsequent elements are the patient's medical record hashes
        for (uint i = 0; i < records.length; i++) {
            allHashes[i + 1] = records[i].recordHash;
        }

        return allHashes;
    }
}