// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./eternal_storage.sol";


contract ABC  {
    
    using ABC_LIB for address;
    address ABCData;
    

    constructor(address _storageData) {
        ABCData = _storageData;
    }

    
    function add(uint val1,uint val2) public {
        
        uint x = val1 +val2;
        ABCData.setXValue(x);
        
    }
    
    function getValue() public view returns (uint ret) {
        
        return ABCData.getXValue();
    }
    
    
   
}
