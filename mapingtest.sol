// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MappingTest{

    struct  User{      
        string name;
        uint age;
        uint256 blance;
    }

    mapping (address=>User)users;

    function setUser(string memory name,uint age,uint blance) public {

 
        users[msg.sender]=User(name,age,blance);
        
    }

    function getUser(address ars) public  view returns (string memory,uint,uint256){

        User memory u= users[ars];

        return (u.name,u.age,u.blance);
    }

}