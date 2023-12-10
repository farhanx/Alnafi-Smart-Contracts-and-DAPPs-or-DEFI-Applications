// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract TestFallback {
 
    uint public x;
    uint public y;
    
    event myevent(string );
    
    
    function existing() public returns(string memory ret)
    {
        x++;
        
        return "Test";
    }
    
    
    fallback() payable external {
        y++;
        emit myevent("no function found so this fallback function is called");
    }
    
    function getBalance() public view returns (uint balance) {
        
        return address(this).balance;
    }
}
