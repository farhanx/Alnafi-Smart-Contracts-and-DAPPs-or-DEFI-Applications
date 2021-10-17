// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PakNFT is  ERC721URIStorage {
 
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
 
     constructor() ERC721("Pakistani Figure NFT","PNT") {
         
     }
    
    function awardItem (address player, string memory tokenURI) public returns (uint256) {
        
        _tokenIds.increment();
        
         uint256 newNFTItemId = _tokenIds.current();
         
        _mint(player,newNFTItemId);
        
        _setTokenURI(newNFTItemId, tokenURI);

        return newNFTItemId;
    }
    
    
}