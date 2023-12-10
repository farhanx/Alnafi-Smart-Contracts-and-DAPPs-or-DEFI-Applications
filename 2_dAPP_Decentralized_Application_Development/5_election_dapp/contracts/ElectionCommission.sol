// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0; 

import "./Candidate.sol";

import "./Voter.sol";

contract ElectionCommission {
    
    address ec_admin;
    
    Candidate  candidateContract;
    Voter      voterContract;
    
    
    constructor()  
    {
        ec_admin = msg.sender;
        
        candidateContract = new Candidate(address(this));
        voterContract = new Voter(address(candidateContract));
        
        
    }
    
    
    modifier is_ECAdmin ()
    {
        require (msg.sender == ec_admin, " You are not an administrator of this contract");
        _;
    }
    
    
    function getCandidateContractAddress() public view returns (address candidateContractAddress)
    {
        return address(candidateContract);
    }
    
    
    function getVoterContractAddress() public view returns (address voterContractAddress)
    {
        return address(voterContract);
    }
    
    
    function insertNewCandidate(string calldata _fname,
    string calldata _lname, string calldata _party_name,
    string calldata  _party_symbol, address candidate_address) external is_ECAdmin
    {
        candidateContract.insertCandidateData(_fname,_lname,_party_name,_party_symbol,candidate_address);
    }
    
    
}