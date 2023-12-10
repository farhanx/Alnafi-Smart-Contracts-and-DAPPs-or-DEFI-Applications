// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract World 
{
    int age;
    string name;

    function setMyData(int _age, string calldata _name) public {

        name = _name;
        age = _age;
    }

    function readMyData() public view returns (int, string memory ) {
        return (age,name);
    }
}
