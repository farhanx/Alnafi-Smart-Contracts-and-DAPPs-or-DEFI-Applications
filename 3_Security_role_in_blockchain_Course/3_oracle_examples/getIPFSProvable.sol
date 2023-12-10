// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "github.com/provable-things/ethereum-api/provableAPI.sol";

contract getIPFS is usingProvable{

    event LogInitializeOracle(string);
    event LogNewProvableQuery(string, uint256 value);
    event LogNewProvableQuery(string);
    event LogPriceUpdated(string,bytes32);

    string public result;

    
    constructor ()  {
       emit LogInitializeOracle("constructor initiated successfully!");
    }

     function __callback(bytes32 myid, string calldata _result) public {
       
       if (msg.sender != provable_cbAddress()) revert();
       
       result = _result;
       emit LogPriceUpdated(result,myid);
   }

    function updateIPFS() public  payable {

            //if a user is paying its fees and it is less than the oracle fee
       if (provable_getPrice("IPFS") > msg.value) {
          emit LogNewProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee",provable_getPrice("IPFS"));
       } 
       else {
            
            emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
            provable_query("IPFS", "QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o");
       }

    }


}