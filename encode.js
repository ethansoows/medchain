// Function to generate a random encryption key
async function generateKey() {
    return await crypto.subtle.generateKey(
      {name: 'AES-GCM', length: 256},
      true,
      ['encrypt', 'decrypt']
    );
  }
  
  // Function to encrypt data using AES-GCM
  async function encryptData(key, data) {
    const encoder = new TextEncoder();
    const encodedData = encoder.encode(data);
    
    const iv = crypto.getRandomValues(new Uint8Array(12));
    const ciphertext = await crypto.subtle.encrypt(
      {name: 'AES-GCM', iv: iv},
      key,
      encodedData
    );
  
    return {
      ciphertext: ciphertext,
      iv: iv
    };
  }
  
  // Function to decrypt data using AES-GCM
  async function decryptData(key, encryptedData, iv) {
    const decryptedData = await crypto.subtle.decrypt(
      {name: 'AES-GCM', iv: iv},
      key,
      encryptedData
    );
  
    const decoder = new TextDecoder();
    return decoder.decode(decryptedData);
  }
  
  // Example usage:
  async function exampleUsage() {
    // Generate encryption key
    const key = await generateKey();
  
    // Encrypt data
    const data = "Hello, world!";
    const encryptedData = await encryptData(key, data);
  
    // Log the encoded hash
    console.log("Encoded Hash:", new Uint8Array(encryptedData.ciphertext).toString());
  
    // Decrypt data
    const decryptedData = await decryptData(key, encryptedData.ciphertext, encryptedData.iv);
  
    console.log("Original Data:", data);
    console.log("Decrypted Data:", decryptedData);
  }
  
  exampleUsage();