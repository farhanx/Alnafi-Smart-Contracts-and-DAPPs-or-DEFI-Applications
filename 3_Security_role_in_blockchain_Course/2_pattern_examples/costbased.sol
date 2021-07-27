// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract CostBasedRest {
 
 
  mapping(address => uint) balance;
  
  
  error LackOfFundsBecauseYouMustPayAtleast30Ethers(); 
 


  modifier CostRestriction(uint ethers)
  {
      if(msg.value < ethers)
      revert LackOfFundsBecauseYouMustPayAtleast30Ethers();
      
      _;
      
      if(msg.value > ethers) 
        payable(msg.sender).transfer(msg.value-ethers);
  }
  
  function addFunds() public payable CostRestriction(30 ether) {
      
      balance[msg.sender] = 30 ether;
  } 
 

    
}
    