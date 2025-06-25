// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

abstract contract A {
    function get() virtual public;
}


 contract B is A {
      // Cannot be called from this contract
       function get() override public  {
            revert("Cannot call");
          }
   }