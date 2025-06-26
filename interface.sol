// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface Ibank { 
   function getblance() external view returns (uint256);
   function deposit() external  payable ;
   function withdraw( uint256 _value, address _to )external;
}



contract Bank is Ibank{    

   mapping (address => uint256) public balances;
   function getblance() external view override returns (uint256){
    return balances[msg.sender];
   }

   function deposit() external  payable override{
    require(msg.value>0,"deposit amount must great than 0");
    balances[msg.sender]+= msg.value;
   }

   function withdraw( uint256 _value, address   _to )external override{

    require(_value<balances[_to], "Withdraw amount must be lower than your balance");

       (bool sent,)=payable(_to).call{value: _value}("");
       if(sent){
        balances[msg.sender] -=  _value;
       }else {
        revert("No Ether Sent");
       }

   }
}

contract BankUser{
    Bank buser;

   
    constructor (address addr){
        buser=Bank(addr); 
    }

    function getUserBlance(address ads) external  view  returns (uint256) {
         Bank b=Bank(ads);
        return b.getblance();
    }

    function User_withdraw_Bank(address ads,uint amount) external payable{
        Bank b=Bank(ads);
        b.withdraw(amount,ads);
    }

    function deposit_in_bank(address ads) external payable {
        Bank b=Bank(ads);
        b.deposit{value:msg.value}();
    }

}