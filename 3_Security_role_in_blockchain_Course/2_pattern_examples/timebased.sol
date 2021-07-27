// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract TimeBasedRest {
    
    uint creationTime = block.timestamp;
    
    uint maximumTime = creationTime + 1 minutes;
    
    
    modifier timeRestrict(uint time) {
       if(block.timestamp < time)
       revert("The call is restricted for this function, its time will come soon!");
       _; 
    }
    
    
    
    function callme1() public view  timeRestrict(maximumTime) returns(string memory missionStatement) {
        
        return "You have to find a clue something as ABCDEFG";
        
    }
    
    
    function callme2()  public view  timeRestrict(maximumTime + 1 minutes)  returns(string memory missionStatement) {
        
        return "You have to add 1 ether money in the contract using function callme3";
        
    }
    
    
    function callme3() public  timeRestrict(maximumTime + 2 minutes)  payable  {
        
        
    }
    
    
    function getBalance() public view returns (uint balance)
    {
        return address(this).balance;
    }
}