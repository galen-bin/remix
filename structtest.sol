// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract StructTest{



    struct User{
        string name;
        uint age;
        bool isregist;
    }


    mapping (address =>User) public users;

    function regist(string memory name,uint age)public {

        require(!users[msg.sender].isregist,"User already registered");

        users[msg.sender]=User(name,age,true);

    }

    function getuser(address ads) public view  returns (string memory,uint,bool) {

        require(users[ads].isregist,"user not registered");
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        User memory u=users[ads];

        return (u.name,u.age,u.isregist);

    }

}