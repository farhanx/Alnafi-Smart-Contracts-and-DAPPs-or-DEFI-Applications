// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma abicoder v2;



contract Candidate {
    
    
    struct candidate_template_data {
        
        string fname;
        string lname;
        string party_name;
        string party_symbol;
        address ethereum_address;
    }
    
    
    candidate_template_data [] public candidateData;
    
    address electionCommissionAddress;
    
    constructor (address _electionCommissionAddress) 
    {
        electionCommissionAddress = _electionCommissionAddress;
        
    }
    
    
    function insertCandidateData(string calldata _fname, string calldata _lname, string calldata _party_name,string calldata  _party_symbol, address candidate_address) external 
    {
        
        require(msg.sender == electionCommissionAddress , "Incoming call is not from Election Commission's contract");
        
        candidate_template_data memory obj ;
        
        obj.fname = _fname;
        obj.lname = _lname;
        obj.party_symbol = _party_symbol;
        obj.party_name = _party_name;
        obj.ethereum_address = candidate_address;
        
        candidateData.push(obj);
    }
    
    
    function getCandidateDataByPartyName(string calldata _party_name) public view returns (candidate_template_data memory  _candidate)
    {
        
        for(uint loop= 0; loop<candidateData.length; loop++)
        {
            if(keccak256(bytes(candidateData[loop].party_name)) == keccak256(bytes(_party_name)))
            {
                return candidateData[loop];
            }
        }
        
    }
    
    function getCandidateAddressByPartyName(string calldata _party_name) public view returns (address   _candidate_address)
    {
        
        for(uint loop= 0; loop<candidateData.length; loop++)
        {
            if(keccak256(bytes(candidateData[loop].party_name)) == keccak256(bytes(_party_name)))
            {
                return candidateData[loop].ethereum_address;
            }
        }
        
    }
    
    
    function getPartiesList() external view returns(string [] memory parties)
    {
         parties = new string[](candidateData.length);
         
         for(uint loop=0; loop<candidateData.length; loop++)
         {
             parties[loop] =candidateData[loop].party_name; 
             
         }
        
    }
    
    
    
}