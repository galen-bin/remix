// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Hello{

    
     address public  ads=msg.sender;
     mapping (address=>uint256) public  balances;
     mapping(string=>uint) public  counts;
     struct user  {
         string name;
          uint256 age;
          address wallet;
     
       }

       mapping (address=>user) public users ;
     
    function sayHello() public pure  returns(string memory){
        return "hello, world";
    }


    function taker(uint _a, uint _b) public pure {
        _a+_b;
        
    }

    function addressTypes (address x) public  pure returns  (address a){

        address z = x;
    
        return z;
       // (z[1]);
    }
    

    function numbertype(uint256 account) public  {
        uint8 a=254;
        bytes4 abbb="a84b";
        bytes memory a1 = "75048074384425574039e8f";
        bool c =true;
        bytes32 d="124568f5d55d5d5d5d5d5d55dd5d5d5d";
        string memory str="sss";
        uint[] memory  storageArray=new uint[](5);
        storageArray[0]=1;
        storageArray[1]=1;
        storageArray[2]=1;
        storageArray[3]=1;
        int[] memory iarr;
        iarr[0]=1;
       balances[msg.sender]=account;
       users[msg.sender]= user("jesus",25,msg.sender);

    }

    
}