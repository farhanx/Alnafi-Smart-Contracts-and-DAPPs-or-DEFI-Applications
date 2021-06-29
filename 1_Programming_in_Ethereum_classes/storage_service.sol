// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract StorageService {
    
    struct USERDATA {
        
    string first_name;
    string last_name;
    uint8 age;
    address account;
    uint id;
    }
    
    USERDATA [] private gUsers; 
    
    uint public current_balance;
    
    address payable owners_account_address;
    
    constructor(address payable _owneraddress)
    {
        
        owners_account_address = _owneraddress;
        
        current_balance =0;
    }
    
    function WithdrawMoney(address payable _owneradd) public payable {
     
        require(_owneradd==owners_account_address,"You are not the onwer of this contract");
        
       uint balance =  address(this).balance ;
       current_balance = 0;
       
        owners_account_address.transfer(balance); //owner will receive his contract existing balance
        
    }
    
    
    function setMyData(string calldata _fname, string calldata _lname, uint8 _age, uint _id) public payable 
    {
        
        require(msg.value==100000,"Fees is less than expected, pay atleast 100,000 wei");
        
        current_balance += msg.value;

        USERDATA memory localObj;
        
        localObj.first_name = _fname;
        localObj.last_name = _lname;
        localObj.age = _age;
        localObj.account = msg.sender; //it will give address of the caller
        localObj.id = _id;
        
        gUsers.push(localObj);
    }
    
    
    function readMyData(uint _id) public  view returns (string memory, string memory, uint8, address)
    {
        
        for(uint loop=0; loop<gUsers.length; loop++)
        {
        
            // if given id is equal to the looped item
            if(_id==gUsers[loop].id)
            {
                return (gUsers[loop].first_name,gUsers[loop].last_name,gUsers[loop].age,gUsers[loop].account);
            }
        }
    }
    
}
