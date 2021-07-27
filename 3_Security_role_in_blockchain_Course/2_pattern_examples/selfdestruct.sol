// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract SelfDestruct {
    
    
    
    mapping(address => uint) balances; 
    
    address companyaccount;
    
    
    modifier ownerBased() {
        
        if(msg.sender != companyaccount) revert(" You are not allowed to do this operation");
        
        _;
    
    }
    
    constructor()
    {
        companyaccount = msg.sender;
    }
    
    function addMoney() public payable {
        
        balances[msg.sender] = msg.value;
        
    }
    
    
    function withdraw() public payable {
        
        uint balance = balances[msg.sender];
        
        balances[msg.sender] = 0;
        
        payable(msg.sender).transfer(balance);
        
    }
    
    
    function kill() public ownerBased  {
        
        selfdestruct(payable(companyaccount))   ;
        
    }
     
}