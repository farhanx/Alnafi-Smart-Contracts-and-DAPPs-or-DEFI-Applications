// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "github.com/provable-things/ethereum-api/provableAPI.sol";



contract getUrlProvable is usingProvable {

    string private ETHtoUSD;

    event LogInitializeOracle(string);
    event LogNewProvableQuery(string, uint256 value);
    event LogNewProvableQuery(string);
    event LogPriceUpdated(string,bytes32);



    constructor () payable {
       emit LogInitializeOracle("constructor initiated successfully!");
    }

     function __callback(bytes32 myid, string calldata result) public {
       
       if (msg.sender != provable_cbAddress()) revert();
       
       ETHtoUSD = result;
       emit LogPriceUpdated(result,myid);
   }

    function updatePrice() public  payable {

        //if a user is paying its fees and it is less than the oracle fee
         if (provable_getPrice("URL") > msg.value) {
          emit LogNewProvableQuery("Provable query was NOT sent, please add some ETH to cover for the query fee",provable_getPrice("URL"));
       } 
       else {
            
            emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
            provable_query("URL", "json(https://api.pro.coinbase.com/products/ETH-USD/ticker).price");
       }
    }


    function returnValue() public view returns (string memory) {
        return ETHtoUSD;
    }


}