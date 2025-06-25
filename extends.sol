// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract A{
    uint a;
    constructor(uint _a){
        a = _a;
    }

    function testa() public view     returns(uint){
        return  a+10;
    }

}

contract B is A{
    uint b;

     constructor() A(1) {
        b = 2;
    }

    function testb() public view  returns(uint) {
    
        return A.testa()+b;
    }



}



