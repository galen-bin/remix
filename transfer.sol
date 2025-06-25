// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Transfer{

constructor() payable{}
error CallFailed(); // 用call发送ETH失败error
event receivelog(uint,uint);

receive() external payable { 

    emit receivelog(msg.value, gasleft());
}

fallback() external payable { }

// call()发送ETH
function callETH(address payable _to, uint amount) external payable{
    // 处理下call的返回值，如果失败，revert交易并发送error
    (bool success,) = _to.call{value: amount}("");    
    if(!success){
        revert CallFailed();
    }
}


}