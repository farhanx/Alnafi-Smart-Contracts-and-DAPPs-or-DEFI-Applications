pragma solidity >=0.7.0 <0.9.0;

contract TestReceived {
 
    uint public rec_counter;

    event myevent(string );
    
    
    fallback()  payable external {
        emit myevent("no function found so this fallback function is called");
    }
    
    receive() payable external {
        
       rec_counter++;
       emit myevent("default received function is called");

    }
    
    
    function getBalance() public view returns (uint balance) {
        
        return address(this).balance;
    }
}