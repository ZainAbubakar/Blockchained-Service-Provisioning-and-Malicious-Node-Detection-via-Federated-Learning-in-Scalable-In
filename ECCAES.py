from tinyec import registry
from Crypto.Cipher import AES
from web3 import Web3
from Crypto.Hash import keccak, SHA256
import hashlib, secrets, binascii
import time


w3 = Web3(Web3.HTTPProvider('http://127.0.0.1:8545'))
w3.eth.default_account = w3.eth.accounts[0]

abi = [
	{
		"inputs": [
			{
				"internalType": "int256",
				"name": "D_Id",
				"type": "int256"
			}
		],
		"name": "FeatureEvaluation",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "int256",
				"name": "a",
				"type": "int256"
			},
			{
				"internalType": "string",
				"name": "b",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "c",
				"type": "string"
			}
		],
		"name": "Step11_DataRequest",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "int256",
				"name": "DId",
				"type": "int256"
			},
			{
				"internalType": "string",
				"name": "DName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "DType",
				"type": "string"
			}
		],
		"name": "Step1S_DataRequest",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "hash",
				"type": "string"
			}
		],
		"name": "Step2_add_hash",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "adata",
				"type": "string"
			}
		],
		"name": "Step3_sig_data",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "conn",
				"type": "string"
			}
		],
		"name": "Step4_con1",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "pub",
				"type": "string"
			}
		],
		"name": "Step5_pub",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "conn2",
				"type": "string"
			}
		],
		"name": "Step6_con2",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "arb",
				"type": "string"
			}
		],
		"name": "Step7_arb",
		"outputs": [
			{
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_2hash11",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_3data11",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_4con11",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_5pub11",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_6con123",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_7arb",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "Step1_DataRequest",
		"outputs": [
			{
				"internalType": "int256",
				"name": "a",
				"type": "int256"
			},
			{
				"internalType": "string",
				"name": "b",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "c",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
        
        
contract_address= '0x111A0F181139C36Fcd4ec1856823F94498798D0F'
contract_BS= w3.eth.contract(address=contract_address,abi=abi)


totalstarttime= time.time()

for x in range(100):
    def encrypt_AES_GCM(msg, secretKey):
        aesCipher = AES.new(secretKey, AES.MODE_GCM)
        ciphertext, authTag = aesCipher.encrypt_and_digest(msg)
        return (ciphertext, aesCipher.nonce, authTag)

    def decrypt_AES_GCM(ciphertext, nonce, authTag, secretKey):
        aesCipher = AES.new(secretKey, AES.MODE_GCM, nonce)
        plaintext = aesCipher.decrypt_and_verify(ciphertext, authTag)
        return plaintext

    def ecc_point_to_256_bit_key(point):
        sha = hashlib.sha256(int.to_bytes(point.x, 32, 'big'))
        sha.update(int.to_bytes(point.y, 32, 'big'))
        return sha.digest()
    
    curve = registry.get_curve('brainpoolP256r1')
    
    def encrypt_ECC(msg, pubKey):
        ciphertextPrivKey = secrets.randbelow(curve.field.n)
        sharedECCKey = ciphertextPrivKey * pubKey
        secretKey = ecc_point_to_256_bit_key(sharedECCKey)
        ciphertext, nonce, authTag = encrypt_AES_GCM(msg, secretKey)
        ciphertextPubKey = ciphertextPrivKey * curve.g
        return (ciphertext, nonce, authTag, ciphertextPubKey)
    
        
    def decrypt_ECC(encryptedMsg, privKey):
        (ciphertext, nonce, authTag, ciphertextPubKey) = encryptedMsg
        sharedECCKey = privKey * ciphertextPubKey
        secretKey = ecc_point_to_256_bit_key(sharedECCKey)
        plaintext = decrypt_AES_GCM(ciphertext, nonce, authTag, secretKey)
        return plaintext
    
    msg = b'Zain' 
    print("original msg:", msg)
    privKey = secrets.randbelow(curve.field.n)
    pubKey = privKey * curve.g
    
    encryptedMsg = encrypt_ECC(msg, pubKey)
    encryptedMsgObj = {
        'ciphertext': binascii.hexlify(encryptedMsg[0]), 
        'nonce': binascii.hexlify(encryptedMsg[1]), 
        'authTag': binascii.hexlify(encryptedMsg[2]), 
        'ciphertextPubKey': hex(encryptedMsg[3].x) + hex(encryptedMsg[3].y % 2)[2:]
    }
    
    print("encrypted msg:", encryptedMsgObj)
    
    decryptedMsg = decrypt_ECC(encryptedMsg, privKey)
    print("decrypted msg:", decryptedMsg)
    
    
    
    
    starttimeofkhash= time.time()
    keccak_hash = keccak.new(digest_bits=256) 
    keccak_hash.update((str(binascii.hexlify(encryptedMsg[0]))).encode())
    print ("keccak_S :", keccak_hash.hexdigest())
    a = keccak_hash.hexdigest();
    
    abc = contract_BS.functions.Step2_add_hash(keccak_hash.hexdigest()).transact()
    print("Step 2 :",abc.hex())
    
    endtimeofkhash = time.time()
    print("The time of keccak hash is: ", endtimeofkhash - starttimeofkhash)
    
    
    
    
    
#    
#    starttimeofshash= time.time()
#    def encrypt_string(hash_string):
#        sha_signature = \
#            hashlib.sha256(hash_string.encode()).hexdigest()
#        return sha_signature
#    hash_string = str(binascii.hexlify(encryptedMsg[0]))
#    sha_signature = encrypt_string(hash_string)
#    print("SHA256 :", sha_signature)
#    abc = contract_BS.functions.Step2_add_hash(keccak_hash.hexdigest()).transact()
#    print("Step 2 :",abc.hex())
#    
#    endtimeofshash = time.time()
#    print("The time of Sha 256 hash is: ", endtimeofshash - starttimeofshash )
    
    
    
    keccak_hash = keccak.new(digest_bits=256) 
    keccak_hash.update((str(binascii.hexlify(encryptedMsg[0]))).encode())
    print ("keccak_C :", keccak_hash.hexdigest())
    b = keccak_hash.hexdigest();
    
    if a == b:
        con1 = "Singnatured Data is Ok"
    else:
        con1 = "Singnatured Data is not Ok"
            
    
    
    encryptedMsg12 = encrypt_ECC(msg, pubKey)
    
    if encryptedMsg12 == encryptedMsg12:
        con2 = "The Data is Ok"
    else:
        con2 = "The Data is not Ok"
    
    
    
    
    
    xyz = contract_BS.functions.Step3_sig_data(binascii.hexlify(encryptedMsg[0])).transact()
    print("Step 3 :",xyz.hex());
    
    efg = contract_BS.functions.Step4_con1(con1).transact()
    print("Step 4 :",efg.hex())
    
    lmn = contract_BS.functions.Step5_pub( hex(encryptedMsg[3].x) + hex(encryptedMsg[3].y % 2)[2:]).transact()
    print("Step 5 :",lmn.hex())
    
    lmnp = contract_BS.functions.Step6_con2(con2).transact()
    print("Step 6 :",lmnp.hex())
    
    
    #h =SHA256.new()
    #h.update(binascii.hexlify(encryptedMsg[0]))
    #print h.hexdigest()
    
totalendtime = time.time()
time11 = totalendtime - totalstarttime
print("The total time is: ", time11)
    
    
    
    
starttimeof7= time.time()
for x in range(1):
    a = 1
    b = "Zain"
    c = "string"
    features = (a,b,c)
    abf = contract_BS.functions.Step11_DataRequest(a,b,c).call()
    Data = features;
     
    if Data == features:
        arbitration = "Client is Malicious"
    else:
        arbitration = "Service Provider is Malicious"
            
    lmnpq = contract_BS.functions.Step7_arb(arbitration).transact()
    print("Step 7 :",lmnpq.hex())
        
    endtimeof7 = time.time()
print("The time of Step 7: ", endtimeof7 - starttimeof7)  