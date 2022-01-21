pragma solidity >=0.4.22 <0.8.1;



contract NonRepudiation
{
    int DataId;
    string DataName;
    string DataType;
    
    
    string Arbitration;


struct Data{
 
 int _Id;
 string _DataName;
 string _DataType;
 }
mapping(int => Data) private Datas;

string public _2hash11;
string public _3data11;
string public _4con11;
string public _5pub11;
string public _6con123;
int _DId;
string _DName;
string _DType;
//mapping(string => ha) public ciha;
      

function Step1S_DataRequest (int DId, string memory DName, string memory DType) public {
    int i=0; 
    Datas[i]._Id = DId;
    DataId = DId;
    Datas[i]._DataName = DName;
    DataName = DName;
    Datas[i]._DataType = DType;
    DataType = DType;
}

function Step1_DataRequest () public view returns(int a, string memory b, string memory c) {
    a = _DId;
    b =  _DName;
    c = _DType;
    return (a, b, c);
}

function Step11_DataRequest (int a, string memory b, string memory c) public payable{
    _DId = a;
    _DName = b;
    _DType = c;
    
}

function Step2_add_hash(string memory hash) public payable returns (bool status){
    _2hash11 = hash;
    return true;
}
   
function Step3_sig_data(string memory adata) public payable returns (bool status){
    _3data11 = adata;
    return true;
}

function Step4_con1(string memory conn) public payable returns (bool status){
    _4con11 = conn;
    return true;
}

function Step5_pub(string memory pub) public payable returns (bool status){
    _5pub11 = pub;
    return true;
}


function Step6_con2(string memory conn2) public payable returns (bool status){
    _6con123 = conn2;
    return true;
}

function FeatureEvaluation(int D_Id) public returns (string memory){
      {
          if (DataId == D_Id)
         {
              Arbitration ="The Service is correct, the client is malicious.";
              return Arbitration;
              
          }
          else{
              Arbitration="The Service is not correct, the service provider is malicious.";
              return Arbitration;
          } 
      }
      }
      
   
      

}