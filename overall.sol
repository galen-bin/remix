// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract overall {


    function getTxOrigin() public view returns (address) {
        return tx.origin;
    }

     function getBlockDetails() public view returns (uint, uint) {
        return (block.number, block.timestamp);
    }

    function getMessageDetails() public payable returns (address, uint) {
        return (msg.sender, msg.value);
    }

     function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }


}