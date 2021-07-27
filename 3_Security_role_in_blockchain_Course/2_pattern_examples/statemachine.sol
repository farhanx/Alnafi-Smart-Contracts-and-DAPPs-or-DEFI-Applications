// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract StateMachine {
 
 enum States{
     
     init,
     deposit,
     ship,
     withdraw
 }
 
 
    error RestrictedToStatus();
 
     States public contractState = States.init; 
     address buyer;
     address seller;
 
 
    modifier StateRestrict(States _state) 
    {
        if(contractState != _state)
        revert RestrictedToStatus();
        
        _;
        
        if(contractState!=States.withdraw)
            contractState = States(uint(contractState) + 1);
        
    }
 
 
     
     function initSetup(address _buyer, address _seller) public StateRestrict(States.init) {
         
         buyer = _buyer;
         seller = _seller; 
     }
     
     
     function depositMoney() public payable StateRestrict(States.deposit) {
         
     }
     

     function ship() public StateRestrict(States.ship) {
         
     }
     
        
    function withdraw_money() public  StateRestrict(States.withdraw) {
        
    }    
        
        
        
    
}