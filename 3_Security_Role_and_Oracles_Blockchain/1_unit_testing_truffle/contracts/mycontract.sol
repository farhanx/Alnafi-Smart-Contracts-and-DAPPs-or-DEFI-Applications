// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0; 

contract mycontract {


    int age;
    string name;
    bool is_alnafi_student;
    address admin;


    constructor()
    {
        age = 11;
        name = "Javed";
        is_alnafi_student = true;
        admin = msg.sender;
    }


    function setDetails(string calldata _name,int _age, bool _is_student) public {
        age = _age;
        name = _name;
        is_alnafi_student = _is_student;
    }


    function getDetails() public view returns (string memory _name, int _age,bool _is_student)
    {
        return (name,age,is_alnafi_student);
    } 


    modifier is_Owner() {
        
         require(msg.sender == admin , "You are not a an admin, please go away!");
        _;
    }

    function returnSecretValue() public  view is_Owner returns(uint val){

        return 321;
    }

}