// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MyContract {

    int age;
    string name;
    bool is_AlnafiStudent;
    address public admin;

    constructor() {
        age = 34;
        name = "Arbaz";
        is_AlnafiStudent = true;
        admin = msg.sender;
    }

    modifier is_Owner() {
       
        require(msg.sender==admin,"You are not an admin, please go away!") ;
         _;
    }

    function setDetails(string calldata _name, int _age, bool _is_student) public {
        age = _age;
        name = _name;
        is_AlnafiStudent = _is_student;
    }

    function getDetails() public view returns (string memory _name,int _age, bool _is_student) {
        return (name,age,is_AlnafiStudent);
    }

    function returnSecretValue() public view  is_Owner returns(uint val) {
        return 5572;
    }

    function returnAdmin() public view returns (address) {
        return admin;
    }

}