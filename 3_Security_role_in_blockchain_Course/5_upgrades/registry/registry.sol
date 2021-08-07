pragma solidity >=0.7.0 <0.9.0;
import "./owner.sol";

contract ABCRegistry  is Owner {
    
    
    uint public latest_version =0; 
    mapping(uint=>address) version_history;
    
    function UpdateVersion(address _abcContractAddress) public isOwner{
        
        latest_version++;
        version_history[latest_version] = _abcContractAddress;
        
    }
    
    function getLatestVersion() public view returns(address ret) {
        return version_history[latest_version];
    }
    
     function getContractByVersionNumber(uint version) public view returns(address ret) {
        return version_history[version];
    }
    
    
    
}