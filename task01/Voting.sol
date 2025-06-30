// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting{
    
    //投票轮数
    uint public whell;
    //候选人
    string[] public  voters;
    //候选人得票
    mapping(string=>uint) public voters_number;
    //投票人周期记录
    mapping(address=>uint) public voteMap;
    //合约拥有者
    address public  owner;

    //初始化
    constructor(){
        owner=msg.sender;
        whell=1;
        voters=["vote01","vote02","vote03"];
    }

    //投票
    function votering(string memory name) public {
        require(voteMap[msg.sender]!=whell,"You have already cast your vote");
        voteMap[msg.sender]=whell;
        voters_number[name]+=1;        
    }

    //查看得票
    function check(string memory name) public view returns (uint){
        return voters_number[name];
    }

    //重置投票
    function reset() external {
        require(owner==msg.sender,"Not the owner");

        for (uint i=0;i<voters.length;i++){
            voters_number[voters[i]]=0;
        }
        //轮数+1
        whell++;
      
    }





}