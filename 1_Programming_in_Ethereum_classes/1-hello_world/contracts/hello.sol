// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract HelloWorld 
{

    int age;
    string name;


    function setMyName(string memory _name) public {

        name = _name;

    }

}