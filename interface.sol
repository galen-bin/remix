// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface Ibank { 
   function getblance() external view returns (uint256);
   function deposit() external    payable ;
   function withdraw( uint256 _value)external;
}



contract Bank is Ibank{    

   mapping (address => uint256) public balances;
   function getblance() external view  returns (uint256){
    return balances[msg.sender];
   }

   function deposit() external  payable   {
    require(msg.value>0,"deposit amount must great than 0");
    balances[msg.sender]+= msg.value;
   }

   function withdraw( uint256 _value)external  {

        require(_value<=balances[msg.sender], "NO balance");           
        balances[msg.sender]-=_value;
        payable(msg.sender).transfer(_value);
 

   }
}

contract BankUser{
 

    receive() external payable { }
    fallback() external payable { }


    function getUserBlance(address ads) external  view  returns (uint256) {
         Bank b=Bank(ads);
        return b.getblance();
    }

    function User_withdraw_Bank(address ads,uint amount) external payable{
        Bank b=Bank(ads);
        b.withdraw(amount);
    }

    function deposit_in_bank(address ads) external payable {
        Bank b=Bank(ads);
        b.deposit{value:msg.value}();
    }

}