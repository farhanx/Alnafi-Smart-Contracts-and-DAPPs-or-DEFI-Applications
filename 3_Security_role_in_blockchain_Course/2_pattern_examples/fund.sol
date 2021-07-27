// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Fund {
    /// @dev Mapping of ether shares of the contract.
    address owner;
    mapping(address => uint) shares;
    /// Withdraw your share.
    
    constructor()  payable 
    {
         shares[msg.sender] = msg.value;
         owner = msg.sender;
    }
    
    
    
    function withdraw_safe() public {
        uint share = shares[msg.sender];
        shares[msg.sender] = 0;
        payable(msg.sender).transfer(share);
    }
    
    function getBalance() public view returns(uint256 balance) {
        
        return address(this).balance;
    }
    
    
    function add() public payable {
        
        shares[msg.sender] = msg.value;

    }
    
      function close() public  {
        selfdestruct(payable(owner));
    }
}