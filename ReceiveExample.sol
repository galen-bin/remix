// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReceiveExample{
    event DataChanged(uint newValue);
    event FallbackCalled(address sender, uint amount);
    address  owner;
    uint public data = 0;

      constructor()  {
        owner = msg.sender;
    }


    receive() external payable {      // 接收外部支付
        data += msg.value;
        emit DataChanged(data);       // 触发事件
    }
     fallback() external payable {
         emit FallbackCalled(msg.sender, msg.value);
     }

  

     modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner=newOwner;
    }

     function f(uint _in) public pure returns (uint) {
        return _in;
    }
    function f(uint _in, bool _flag) public pure returns (uint) {
        return _flag ? _in : 0;
    }

 }


