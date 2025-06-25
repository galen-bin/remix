// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract A{
    uint a;
    function testa() public view   returns(uint){
        return  a+10;
    }

}

contract B is A{
    uint b;

    constructor(){
        b=10;
    }

    function testb() public view  returns(uint) {
    
        return A.testa()+b;
    }



}