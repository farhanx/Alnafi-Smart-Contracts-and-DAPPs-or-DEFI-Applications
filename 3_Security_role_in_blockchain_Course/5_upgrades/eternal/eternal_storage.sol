// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract ABC_STORAGE  {
    
    
    mapping(bytes32=>uint) uintVariables;
    
    mapping(bytes32=>string) stringVariables;
    
    
    
    function setUintVariable(bytes32 _variable_name,uint  _variable_value ) public  {
        
        uintVariables[_variable_name] = _variable_value;
    }
    
    
    function getUintVariable(bytes32 _variable_name) public view returns(uint ret){
        return  uintVariables[_variable_name] ;
    }

    function setStringVariable(bytes32 _variable_name,string  calldata _variable_value ) public  {
        
        stringVariables[_variable_name] = _variable_value;
    }
    
    
    function getStringVariable(bytes32 _variable_name) public view  returns(string memory ret){
        return  stringVariables[_variable_name] ;
    }
        
}


library ABC_LIB {

    
    function setXValue(address _abcStorage, uint _value) public {
        
        ABC_STORAGE(_abcStorage).setUintVariable(keccak256("x"),_value);
    }
    
     function getXValue(address _abcStorage) public view returns(uint ){
        
        return ABC_STORAGE(_abcStorage).getUintVariable(keccak256("x"));
    }
    
    
    function setUserNameValue(address _abcStorage, string calldata _value) public {
        
        ABC_STORAGE(_abcStorage).setStringVariable(keccak256("UserName"),_value);
    }
    
     function getUserNameValue(address _abcStorage) public view returns(string memory ){
        
        return ABC_STORAGE(_abcStorage).getStringVariable(keccak256("UserName"));
    }
    
     function setAgeValue(address _abcStorage, string calldata _value) public {
        
        ABC_STORAGE(_abcStorage).setStringVariable(keccak256("age"),_value);
    }
    
     function getAgeValue(address _abcStorage) public view returns(string memory ){
        
        return ABC_STORAGE(_abcStorage).getStringVariable(keccak256("age"));
    }
}


