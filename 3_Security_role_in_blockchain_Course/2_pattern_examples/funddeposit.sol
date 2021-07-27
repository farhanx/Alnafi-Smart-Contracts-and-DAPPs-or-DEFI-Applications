// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract FundDeposit 
{

    mapping(address => uint) shares;
    
    
    constructor() {
        
    }

    function getBalance() public view returns (uint balance) {
        
        return address(this).balance;
        
    }
    
    function addFund() public payable {
        
        shares[msg.sender] = msg.value;
    }
    
    
    function withdraw() public {
        uint share = shares[msg.sender];
        shares[msg.sender] = 0;
        payable(msg.sender).transfer(share);
    }
}