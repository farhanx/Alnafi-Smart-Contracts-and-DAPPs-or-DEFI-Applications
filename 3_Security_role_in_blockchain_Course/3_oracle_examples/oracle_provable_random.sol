// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.6.0 < 0.7.0;

import 'https://github.com/provable-things/ethereum-api/blob/master/provableAPI_0.6.sol';

contract mycontract is usingProvable {
    
    //uint8 PkrPerDollar;
    
    
    bytes32 public queryId;
    bytes public result;
    
    
    constructor() public 
    {
        //PkrPerDollar = 1;
        provable_setProof(proofType_Ledger);
    }
    
   
    function __callback(bytes32 _queryId,string memory _result,bytes memory _proofs) override public
    {
        require(msg.sender == provable_cbAddress());
        
        if(provable_randomDS_proofVerify__returnCode(_queryId,_result,_proofs)==0)
            result = bytes(_result);
        else
            result ="Error";
        
    }
    
    function GetRandom(uint nrbytes) public  {
        queryId = provable_newRandomDSQuery(0,nrbytes,200000);
    }
    
}
