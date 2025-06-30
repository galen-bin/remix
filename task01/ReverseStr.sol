// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Reverser {


    //翻转字符串
    function reverse(string memory input) public view returns (string memory) {
    
        bytes memory inputBytes = bytes(input);
        bytes memory resultString=new bytes(inputBytes.length) ;  
    for (uint i = 0; i < inputBytes.length; i++) {
         resultString[i] = inputBytes[inputBytes.length-1-i];
        }

        return string(resultString);
    }

}