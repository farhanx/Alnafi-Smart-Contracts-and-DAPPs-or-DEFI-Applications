// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import '../openzeppelin-contracts/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol';

contract FHKTokens is ERC20PresetMinterPauser {


    constructor()ERC20PresetMinterPauser("FHK Token","FHK"){

    }


}