pragma solidity >=0.7.0 <0.9.0;
import "./eternal_storage.sol";


contract ABC  {
    
    using ABC_LIB for address;
    address ABCData;
    

    constructor(address _storageData) {
        ABCData = _storageData;
    }

    
    function add(uint val1,uint val2) public {
        
        uint x = val1 +val2*4;
        ABCData.setXValue(x);
        
    }
    
    function getValue() public view returns (uint ret) {
        
        return ABCData.getXValue();
    }
    
    
    function setUserData(string calldata name, string calldata age)  public {
        
        ABCData.setUserNameValue(name);
        ABCData.setAgeValue(age);
    }
    
    function getUserData() public view returns(string memory name,string memory age) {
        
        return(ABCData.getUserNameValue(),ABCData.getAgeValue());
    }
   
}