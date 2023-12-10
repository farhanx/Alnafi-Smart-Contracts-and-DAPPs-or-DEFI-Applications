// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

import "github.com/provable-things/ethereum-api/provableAPI.sol";

contract WolframAlpha is usingProvable {

   string public myresult;
   event LogConstructorInitiated(string nextStep);
   event LogPriceUpdated(string price);
   event LogNewProvableQuery(string description,uint256 fees);
   bytes32 public queryId;


    constructor() payable {
      emit LogConstructorInitiated("Constructor was initiated. Call 'updatePrice()' to send the Provable Query.");
   }

   function __callback(bytes32 myid, string memory result) public {
       if (msg.sender != provable_cbAddress()) revert();
       myresult = result;
       emit LogPriceUpdated(result);
   }

   function createRandomNumber() payable public {
       if (provable_getPrice("URL") > msg.value) 
       {
          emit LogNewProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee",provable_getPrice("URL"));
       } 
       else 
       {
          emit  LogNewProvableQuery("Provable query was sent, standing by for the answer..", msg.value);
           queryId = provable_query("WolframAlpha", "random number between 0 and 100");
       }
   }

   function getTemperatureFromOutsideWorld() payable public {
       if (provable_getPrice("URL") > msg.value) 
       {
          emit LogNewProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee",provable_getPrice("URL"));
       } 
       else 
       {
          emit  LogNewProvableQuery("Provable query was sent, standing by for the answer..", msg.value);
          
            // "temperature in London"
           queryId = provable_query("WolframAlpha", "temperature in Dubai");
       }
   }
}