// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0; 

contract escrow_service {
    
    event DepositConfirmed(uint value,string msg);
    event ReleaseConfirmed(string msg);
    
    enum Statuses {WAITING_FOR_DEPOSIT,DEPOSIT_CONFIRMED,SHIPMENT_IN_PROGRESS,SHIPMENT_RECEIVED,PAYMENT_RELEASE}
    
    uint private payment_agreed;
    address private buyer;
    address payable private seller;
    Statuses status;
    
    
    constructor (address _buyer,address payable _seller, uint _agreed) {
        
        buyer = _buyer;
        seller = _seller;
        payment_agreed = _agreed;
        
        status  = Statuses.WAITING_FOR_DEPOSIT;
    } 
    
    modifier onlyBuyer() {
        
        require(msg.sender==buyer,"Hold on, you are not an authentic buyer");
        _;
        
    }
    
    
    modifier onlySeller() {

        require(msg.sender == seller, "You are not a seller, please go away!");
        _;
    }
    
    
    function getStatus() public view returns(Statuses state)
    {
        return status;
    }
    
    function deposit() external payable onlyBuyer{
        
        require(payment_agreed == msg.value," Your amount is not same as agreed amount");
        
        status = Statuses.DEPOSIT_CONFIRMED;
        
        emit DepositConfirmed(msg.value,"Good! deposit is here inside the contract");
        
    }
    
    function ShipmentInProgress() external onlySeller {
        
        status = Statuses.SHIPMENT_IN_PROGRESS;
        
    }
    
    function ShipmentReceived() external onlyBuyer {
        status = Statuses.SHIPMENT_RECEIVED;
    }
    
    function ReleasePayment() external onlyBuyer payable{
        
        seller.transfer(address(this).balance);
        
        status = Statuses.PAYMENT_RELEASE;
        
        emit ReleaseConfirmed("Contract purpose is achieved!");

    }
    
}