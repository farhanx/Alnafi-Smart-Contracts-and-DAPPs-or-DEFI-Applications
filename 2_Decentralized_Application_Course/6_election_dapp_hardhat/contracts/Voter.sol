// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0; 

import './Candidate.sol';

contract Voter {
    
    struct VoterData
    {
        string nicop;
        address ethereum_address;
    }
    
    
    mapping(address => VoterData[]) voters;
    
    Candidate candidateContract;
    
    
    constructor(address _candidateAddress) 
    {
        candidateContract =  Candidate(_candidateAddress);
    }
    
    
    function insertVoteByParty(string memory national_id,string memory _party_name) public 
    {
        
        address ethereum_candidate_address = candidateContract.getCandidateAddressByPartyName(_party_name);
        
        require(ethereum_candidate_address != address(0)," There is no candidate for this party in the contract" );
        
        
        VoterData memory vdata;
        vdata.nicop = national_id;
        vdata.ethereum_address = msg.sender;
        
        
        voters[ethereum_candidate_address].push(vdata);

    }
    
    
    function getVotesByParty(string calldata _party_name) public view returns (uint total_votes)
    {
        address ethereum_candidate_address = candidateContract.getCandidateAddressByPartyName(_party_name);
        
        require(ethereum_candidate_address != address(0)," No candidate found for this party" );
        
       return voters[ethereum_candidate_address].length;
   
    }
    
    function verifyMyVote(string calldata _party_name) public view returns (string memory nicop, uint voter_index)
    {
     
        address ethereum_candidate_address = candidateContract.getCandidateAddressByPartyName(_party_name);
        
        require(ethereum_candidate_address != address(0)," There is no such party exist" );
    
        for(uint loop=0;loop<voters[ethereum_candidate_address].length; loop++)
        {
            if(voters[ethereum_candidate_address][loop].ethereum_address == msg.sender)
            {
                return (voters[ethereum_candidate_address][loop].nicop, loop);
            }
        }
    }
   
}