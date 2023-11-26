// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "./TestFallback.sol";
import "./TestReceived.sol";

contract TestCaller {
    
    
    constructor()  payable {
        
    }
    
    function callme_existingfunction(TestFallback testFallback) public returns (bool ret) {
        
     (ret,)  = address(testFallback).call(abi.encodeWithSignature("existing()"));
     
    }
    
     function callme_nonexistingfunction1(TestFallback testFallback) public returns (bool ret) {
        
     (ret,)  = address(testFallback).call(abi.encodeWithSignature("non_existing()"));
     
    }
    
    function callme_nonexistingfunction2(TestFallback testFallback) public returns (bool ret) {
        
     (ret,)  = address(testFallback).call(abi.encodeWithSignature("non_existing123()"));
     
    }
    
    function callme_sendether_nonexistingfunction(TestFallback testFallback) public returns (bool ret) {
    
        ( ret,)  = address(testFallback).call{value: 1 ether}(abi.encodeWithSignature("non_existing123()"));
        
    }

    
    
    function callme_sendether_no_function(TestFallback testFallback) public returns (bool ret) {
    
        ( ret,)  = address(testFallback).call{value: 1 ether}("");
        
    }
    
    
    
    // --- Next contract
    
    function callme_recieved_test_1(TestReceived testReceived) public returns (bool ret) {
    
         ret  = payable(address(testReceived)).send(1 ether);
        
    }
    
   
    function callme_recieved_test_2(TestReceived testReceived) public returns (bool ret) {
    
        ( ret,)  = address(testReceived).call{value: 1 ether}("");
        
    }
    
    
    function getBalance() public view returns (uint balance) {
        
        return address(this).balance;
    }
    
}
