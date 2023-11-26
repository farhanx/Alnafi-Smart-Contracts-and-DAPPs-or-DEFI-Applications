// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract ABC  {
    
    uint x = 0;
    
    
    function add(uint val1,uint val2) public {
        
        x = val1 +val2;
        
    }
    
     function mult(uint val1) public {
        
        x = x * val1;
        
    }
    
    function getValue() public view returns (uint ret) {
        return x;
    }
}
